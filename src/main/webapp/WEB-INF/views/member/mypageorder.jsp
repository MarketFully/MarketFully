<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/myPage.css">
    <script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<style>
	.pagination {
	    display: inline-block;
	    padding-left: 0;
	    margin: 20px 0;
	    border-radius: 4px;
	    margin-top: 100px;
	}
	.firstpage_img, .prevpage_img {
	    display: inline-block;
	    width: 30px;
	    height: 30px;
	    text-align: center;
	    vertical-align: middle;
	    float: left;
	}
	.pagenum_currentpage {
	    border-radius: 3px;
	    background: #2e8b57;
	    color: #fff;
	    display: inline-block;
	    width: 25px;
	    height: 25px;
	    line-height: 25px;
	    text-align: center;
	    vertical-align: middle;
	    margin: 0px 5px 0px 5px;
	}
	.pagenum {
	    display: inline-block;
	    width: 25px;
	    height: 25px;
	    line-height: 25px;
	    text-align: center;
	    vertical-align: middle;
	    margin: 0px 5px 0px 5px;
	}
</style>
<body>
      <!-- 헤더부분-->
      <%@include file="../common/mypageheader.jsp" %>

    <!--마이페이지 왼쪽 부분-->
    <div class="page_aticle aticle_type2">
        <div id="snb" class="snb_my">
       <h2 class="tit_snb">마이컬리</h2>
       <div class="inner_snb">
           <ul class="list_menu_left">
               <li class="on">
                   <a href="myorderlist.bo?mem_num=${loginUser.mem_num}">주문 내역</a>
               </li>
               <li>
                   <a href="mypagereview">상품후기</a>
               </li>
               <li>
                  <a href="mypagepoint">적립금</a>
               </li>
               <li> 
                    <a href="mypageloverecipe.bo?mem_num=${loginUser.mem_num}">찜한 레시피</a>
               </li>
               <li>
                   <a href="mypagechange">개인 정보 수정</a>
               </li>
           </ul>
       </div>
    </div>

    <!--마이페이지 내용부분-->
   <div id="viewOrderList" class="page_section section_orderlist">
        <div class="head_aticle">
            <h2 class="tit">주문 내역 <span class="tit_sub">지난 3년간의 주문 내역 조회가 가능합니다</span></h2>
        </div>
        <div class="search_date">
            <h3 class="screen_out">기간 선택</h3>
            <a href="#none" class="btn_layer" style="text-align: left;"  >전체기간</a> 
            <ul class="layer_search" style="display: none;">
                <li><a href="#none" id="allday" class="on">전체기간</a></li>
                <li><a href="#none" id="day1" data-year="2020">2020 년</a></li> 
                <li><a href="#none" id="day2" data-year="2019">2019 년</a></li> 
                <li><a href="#none" id="day3" data-year="2018">2018 년</a></li>
            </ul>
        </div> 
        
        ${list }
                <ul class="list_order">
         <c:forEach var="mi" items="${ list }">
            <li>
                <div class="date" style="text-align: left;">${mi.or_date}</div> 
                <div class="order_goods"><div class="name" style="text-align: left;">
                 <c:url var="orderdetail" value="orderdetail">
                 		<c:param name="or_date" value="${mi.or_date}"/>
                  		<c:param name="or_num" value="${mi.or_num}"/>
                  		<c:param name="sender_name" value="${mi.sender_name}"/>
                  		<c:param name="renameFileName" value="${mi.product.renameFileName}"/>
                  </c:url>	
                    <a href="${orderdetail}">${mi.product.pr_name}</a>               
                </div> 
                 <div class="order_info" style="padding-top: 15px;">
                    <div class="thumb">
                         <img src="resources/img/Productuploadimg/${mi.product.renameFileName }"
                            		 onerror="this.src='resources/img/errorimg.PNG' " 
                            		 alt="상품 이미지" style="width: 80px;"></div> 
                        <div class="desc" style="padding-left: 20px;">
                            <dl>
                                <dt>주문번호</dt> 
                                <dd>${mi.or_num}</dd>             
                            </dl> 
                            <dl style="margin: 0px;">
                                <dt>결제금액</dt> 
                                <dd>${mi.or_total}원</dd>
                            </dl> 
                            <dl style="margin: 0px;">
                                <dt>주문상태</dt>
                                <dd class="status end">${mi.or_status}</dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </li>
           </c:forEach>
        </ul>
        

        
        <!-- 페이징 처리 -->
         <div class="pagination">
            
            <c:if test="${ pi.currentPage eq 1 }">
            <img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img" style="margin-right:10px">
            </c:if>
            <c:if test="${ pi.currentPage ne 1 }">
            	<c:url var="before" value="myorderlist.bo?mem_num=${loginUser.mem_num}">
            		<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }"><img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img" style="margin-right:10px"></a> 
			</c:if>
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<span class="pagenum_currentpage">
						<font color="white" size="3"><b>${ p }</b></font>
						</span>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="myorderlist.bo?mem_num=${loginUser.mem_num}">						
							<c:param name="currentPage" value="${ p }"/>				
						</c:url>
						<span class="pagenum">
						<a href="${ pagination }">${ p }</a>
						</span>
					</c:if>
				</c:forEach>
            
         	<c:if test="${ pi.currentPage eq pi.maxPage }">
            <img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img" style="margin-left:10px">
            </c:if>
            	<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url var="after" value="myorderlist.bo?mem_num=${loginUser.mem_num}">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img" style="margin-left:10px"></a>
				</c:if>
    </div>
    </div>
   
    
        <!-- 기간 selectbox 열고 닫기-->
        <script>
             $(function(){
                $(".btn_layer").click(function(){
                    $(".layer_search").css("display","block");
                    $(".btn_layer").attr("class","btn_layer on");
                    testoff();
                    });
            });

            function teston(){

            
                $(".btn_layer").click(function(){
                    $(".layer_search").css("display","block");
                    $(".btn_layer").attr("class","btn_layer on");
                    testoff();
                });
        
            }

            function testoff(){

            $(".btn_layer.on").click(function(){
                $(".layer_search").css("display","none");
                $(".btn_layer.on").attr('class','btn_layer');
                teston();
                });
            }
     
        </script>

        <!-- 기간 selectbox 선택-->
        <script>
            $('#allday').click(function() {
            $('a').removeClass('on');
            $(this).addClass('on');
            $(".btn_layer").text('전체기간');     
            $(".layer_search").css("display","none");          
            });

            $('#day1').click(function() {
            $('a').removeClass('on');
            $(this).addClass('on');
            $(".btn_layer").text('2020년');
            $(".layer_search").css("display","none");
            });

            $('#day2').click(function() {
            $('a').removeClass('on');
            $(this).addClass('on');
            $(".btn_layer").text('2019년');
            $(".layer_search").css("display","none");
            });

            $('#day3').click(function() {
            $('a').removeClass('on');
            $(this).addClass('on');
            $(".btn_layer").text('2018년');
            $(".layer_search").css("display","none");
            });

        </script>
      
</body>
</html>