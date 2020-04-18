<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <ul class="tab_menu" style="margin-top: 30px;">
                <li class="on" id="before_li">
                    <a href="javascript:;" id="before">작성가능 후기 <span style="float:none;margin-right:0px;">(1)</span></a>
                </li> 
                <li id="after_li"><a href="javascript:;" id="after">작성완료 후기 <span style="float:none;margin-right:0px;">(0)</span></a>
                </li>
            </ul> 
        </div>

        <!-- 작성가능후기-->
        <div id="viewBeforeList" class="on" style="text-align: left;">
            <ul class="list_before" >
                 <li>
                     <strong class="tit_item" style="margin-top: 65px;">
                         <span style="float:none;margin-right:0px;" class="emph">주문번호</span> 1584682637389
                    </strong> 
                    <div class="item" style="width: 750px; height: 130px;">
                        <a href="/shop/goods/goods_view.php?&amp;goodsno=49159" class="thumb">
                            <img src="resources/img/chocolate.png" alt="상품 이미지" style="width: 80px;height: 103px;">
                        </a> 
                        <div class="name">
                            <div class="inner_name">
                                <a href="/shop/goods/goods_view.php?&amp;goodsno=49159" class="sub_name">[싱크] 하이 프로틴바 5종</a> 
                                <a href="/shop/goods/goods_view.php?&amp;goodsno=49159" class="main_name">[싱크] 하이 프로틴 바(초콜릿 퍼지)</a> 
                                <span style="float:none;margin-right:0px;" class="num">3개 구매</span>
                            </div>
                        </div> 
                        <div class="date">
                            <div class="inner_date">
                                <div class="in_date">
                                    <span style="float:none;margin-right:0px;" class="start" style="margin-right: 0px;">03월21일 배송완료</span> 
                                    <span style="float:none;margin-right:0px;" class="end"></span>
                                </div>
                            </div>
                        </div> 
                        <a href="reviewinsert" class="btn_write">후기쓰기</a>
                    </div>
                </li>
            </ul>
        </div>

         <!--작성완료 후기 부분-->
        <div id="viewAfterList" style="display: none;">
            <ul class="list_after">
                <li class="item_view"> 
                    <div class="tit_after" style="text-align: left;">
                        <a href="/shop/goods/goods_view.php?&amp;goodsno=49159" class="main_name">[싱크] 하이 프로틴바 5종</a>
                    </div> 
                    <div class="cont_after" style="border-bottom: 2px solid lightgray;">
                        <a class="desc_after" style="text-align: left;">
                            <span style="float:none;margin-right:0px;" class="subject">맛있어요               
                            <span style="float:none;margin-right:0px;" style="text-align: right; font-size: 12px; color: #949296; float: right;">20.03.26 작성</span>
                            </span> 
                            <span style="float:none;margin-right:0px;" class="desc">
                                <span style="float:none;margin-right:0px;" class="txt">든든하고 맛있습니다!!</span>
                            </span> 
                            <span style="float:none;margin-right:0px;" class="view">
                                <span style="float:none;margin-right:0px;" class="img"></span> 
                                <span style="float:none;margin-right:0px;" class="txt">든든하고 맛있습니다!!<br></span>
                            </span>
                        </a> 
                        <div class="btn_after" style="text-align: right;">
                            <a href="reviewinsert.html" class="btn btn_modify">수정</a> 
                            <a class="btn btn_del">삭제하기</a>
                        </div>
                    </div> 
                    <div class="write_reply" style="display: none;">
                        <div class="inner_replay"><div class="time">답변일 
                            <span style="float:none;margin-right:0px;" class="num"></span>
                        </div> 
                        <div class="reply"></div>
                    </div>
                </div>
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
             $(this).parent().parent().parent().remove();
         }else{   //취소
             return false;
         }  
     });
    </script>
      
</body>
</html>