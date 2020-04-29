<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/review.css">
    <script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
      <!-- 헤더부분-->
      <%@include file="../common/mypageheader.jsp" %>
   <!--마이페이지 왼쪽 부분-->
    <div class="page_aticle aticle_type2">
        <div id="snb" class="snb_my">
       <h2 class="tit_snb">마이컬리</h2>
       <div class="inner_snb">
           <ul class="list_menu_left">
               <li>
                   <a href="myorderlist.bo?mem_num=${loginUser.mem_num}">주문 내역</a>
               </li>
               <li class="on">
                   <a href="mypagereview">상품후기</a>
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

    <!-- 리뷰 내용 부분-->
    <div class="page_section section_review">
        <div class="head_aticle">
            <h2 class="tit">상품후기</h2>
        </div>

        <div id="reviewView" >
            <div class="review_notice" style="text-align: left;">
                <p><b>후기 작성 시 사진후기 100원, 글후기 50원을 적립해드립니다.</b></p>
                - 퍼플, 더퍼플은 <b>2배</b> 적립 (사진 200원, 글 100원)<br>
                - 주간 베스트 후기로 선정 시 <b>5,000원</b>을 추가 적립<br>
                * 후기 작성은 배송 완료일로부터 30일 이내 가능합니다.
            </div> 
            <ul class="tab_menu" style="margin-top: 30px;margin-bottom:90px;">
                <li class="on" id="before_li">
                		<c:set var="size" value="0" />
                		<c:set var="size2" value="0" />
                <c:forEach var="mrt" items="${mrtlist }" varStatus="index">
                	<c:if test="${mrt.prdreview.re_num eq 0 }">
                		<c:set var="size" value="${size+1 }" />
                	</c:if>
                	   <c:if test="${mrt.prdreview.re_num ne 0  && mrt.prdreview.re_status eq 'Y'}">
                	   <c:set var="size2" value="${size2+1 }" />
                	   </c:if>
                </c:forEach>
                
                    <a href="javascript:;" id="before">작성가능 후기 <span style="float:none;margin-right:0px;">(<c:out value="${size }"></c:out>)</span></a>
                </li> 
                <li id="after_li"><a href="javascript:;" id="after">작성완료 후기 <span style="float:none;margin-right:0px;">(<c:out value="${size2 }"></c:out>)</span></a>
                </li>
            </ul> 
        </div>

        <!-- 작성가능후기-->
        <div id="viewBeforeList" class="on" style="text-align: left;">
            <ul class="list_before" >
                 <li>
                 <c:if test="${size == 0}">
                 	<div style="border-bottom: 2px solid #dddfe1;padding: 50px 0;font-size: 13px;color: #757575;text-align: center;">
						작성 가능한 후기가 없습니다.
					</div>
                 </c:if>
                 <c:forEach var="mrt" items="${mrtlist }">
                 <c:if test="${mrt.prdreview.re_num eq 0 }">
                     <strong class="tit_item">
                         <span style="float:none;margin-right:0px;" class="emph">주문번호</span> ${mrt.or_num }
                    </strong> 
                    <div class="item" style="width: 750px; height: 130px; padding: 25px 30px 5px;">
                        <a href="ProductDetail?pr_code=${mrt.product.pr_code }" class="thumb">
                      
                            <img src="resources/img/Productuploadimg/${mrt.product.renameFileName }" alt="상품 이미지"  onerror="this.src='resources/img/errorimg.PNG' " style="width: 100px;height: 110px;">
                     
                        </a> 
                        <div class="name" style="padding-left:20px;">
                            <div class="inner_name">
                                <a href="ProductDetail?pr_code=${mrt.product.pr_code }"  class="sub_name">${mrt.mcate.catename1 } > ${mrt.scate.catename2 }</a> 
                                <a href="ProductDetail?pr_code=${mrt.product.pr_code }"  class="main_name">${mrt.product.pr_name }</a> 
                                <span style="float:none;margin-right:0px;" class="num">${mrt.pr_each }개 구매</span>
                            </div>
                        </div> 
                        <div class="date">
                            <div class="inner_date">
                                <div class="in_date" style="text-align: right;">
                                    <span style="float:none;margin-right:0px;" class="start" style="margin-right: 0px;">배송완료</span> 
                                    <span style="float:none;margin-right:0px;" class="end"></span>
                                </div>
                            </div>
                        </div> 
                        <c:url var="myreivewinsert" value="myreivewinsert">
                    		<c:param name="or_num" value="${mrt.or_num}"/>
                    		<c:param name="pr_code" value="${mrt.pr_code }"/>
                    		<c:param name="pr_name" value="${mrt.product.pr_name }" />		
                    		<c:param name="mcate" value="${mrt.mcate.catename1 }" />		
                    		<c:param name="scate" value="${mrt.scate.catename2 }" />	
                    		<c:param name="renamefile" value="${mrt.product.renameFileName }" />	
                    	</c:url>	
                        <a href="${myreivewinsert}" class="btn_write">후기쓰기</a>
                    </div>
                    </c:if>
                    </c:forEach>
                </li>
                
                	
            </ul>
        </div>

         <!--작성완료 후기 부분-->
        <div id="viewAfterList" style="display: none;">
            <ul class="list_after">
                <li class="item_view"> 
                 <c:if test="${size2 == 0}">
                 	<div style="border-bottom: 2px solid #dddfe1;padding: 60px 0;padding-bottom: 50px;font-size: 13px;color: #757575;text-align: center;">
						작성 완료한 후기가 없습니다.
					</div>
                 </c:if>
                   <c:forEach var="mrt" items="${mrtlist }">
                 <c:if test="${mrt.prdreview.re_num ne 0 && mrt.prdreview.re_status eq 'Y'}">
                    <div class="tit_after" style="text-align: left;padding: 35px 30px 17px;">
                        <a href="ProductDetail?pr_code=${mrt.product.pr_code }" class="main_name">상품명 : ${mrt.product.pr_name }</a>
                    </div> 
                    <div class="cont_after" style="border-bottom: 2px solid lightgray;">
                        <a class="desc_after" style="text-align: left;cursor: default;">
                            <span style="float:none;margin-right:0px;" class="subject">제목 : ${mrt.prdreview.re_title }</span> &nbsp;&nbsp;&nbsp;  
                            <span style="float:none;margin-right:0px;text-align: right; font-size: 12px; color: #949296; float: right;">${mrt.prdreview.re_date }</span>
                            <span style="float:none;margin-right:0px;" class="desc">
                              <c:if test="${mrt.prdreview.re_rename != NULL}">
                             <img src="resources/reviewuploadFiles/${mrt.prdreview.re_rename }" onerror="this.src='resources/img/errorimg.PNG' " alt="상품 이미지" style="width: 200px;height: 210px;">  
                                </c:if>    
                                <span style="float:none;margin-right:0px;width:500px;" class="txt">${mrt.prdreview.re_content }</span>
                            </span> 
                           
                        </a> 
                        <div class="btn_after" style="text-align: right;">             
                       <c:url var="mypageReviewDelete" value="mypageReviewDelete">
                    		<c:param name="re_num" value="${mrt.prdreview.re_num}"/>
                    	</c:url>
                            <a class="btn btn_del" >삭제하기</a>
                        </div>
                    </div> 
                    <div class="write_reply" style="display: none;">
                        <div class="inner_replay"><div class="time">답변일 
                            <span style="float:none;margin-right:0px;" class="num"></span>
                        </div> 
                        <div class="reply"></div>
                    </div>
                </div>    
                </c:if>
    		</c:forEach>
            </li> 
        </ul>
    </div>
  
  </div>
 </div>
    

    <!-- tab 기능-->
    <script>
        $('#before').click(function() {
        $('li').removeClass('on');
        $('#before_li').addClass('on');  
        $('#viewAfterList').css('display','none');
        $('#viewBeforeList').css('display','block');
        });
     
        $('#after').click(function() {
        $('li').removeClass('on');
        $('#after_li').addClass('on');   
        $('#viewBeforeList').css('display','none');
        $('#viewAfterList').css('display','block');
        });
    </script>

    <!--작성완료 후기에서 삭제 눌렀을때 -->
    <script>
     $('.btn_del').click(function() {
         if (confirm("작성한 후기를 정말로 삭제하시겠습니까??") == true){    //확인
             location.href="${mypageReviewDelete}";
         }else{   //취소
             return false;
         }  
     });
    </script>
      
</body>
</html>