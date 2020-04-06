<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/myPage.css">
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
               <li class="on">
                   <a href="mypageorder">주문 내역</a>
               </li>
               <li>
                   <a href="mypagereview">상품후기</a>
               </li>
               <li>
                  <a href="mypagepoint">적립금</a>
               </li>
               <li> 
                    <a href="mypageloverecipe">찜한 레시피</a>
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
        <ul class="list_order">
            <li>
                <div class="date" style="text-align: left;">2019.08.13 (13시 53분)</div> 
                <div class="order_goods"><div class="name" style="text-align: left;">
                    <a href="orderdetail">[한채] 리얼미니 구운감자 외 1건</a>
                </div> 
                <div class="order_info">
                    <div class="thumb">
                        <img src="resources/img/food.PNG" alt="해당 주문 대표 상품 이미지"></div> 
                        <div class="desc">
                            <dl>
                                <dt>주문번호</dt> 
                                <dd>1565671899735</dd>
                            </dl> 
                            <dl style="margin: 0px;">
                                <dt>결제금액</dt> 
                                <dd>20,000원</dd>
                            </dl> 
                            <dl style="margin: 0px;">
                                <dt>주문상태</dt>
                                <dd class="status end">배송완료</dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
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