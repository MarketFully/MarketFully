<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/loverecipe.css">
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
	                   <a href="mypageorder">주문 내역</a>
	               </li>
	               <li>
	                   <a href="mypagereview">상품후기</a>
	               </li>
	               <li>
	                   <a href="mypagepoint">적립금</a>
	               </li>
	               <li class="on"> 
	                    <a href="mypageloverecipe">찜한 레시피</a>
	               </li>
	               <li>
	                    <a href="mypagechange">개인 정보 수정</a>
	               </li>
	           </ul>
	       </div>
    	</div>

       <!--찜한 레시피 내용부분-->
     <div class="page_section section_myinfo">
        <div class="head_aticle">
            <h2 class="tit">찜한 레시피</h2>
        </div>
        <div id="main">
            <div id="content">
                <div class="user_form section_cart" id="allcheck" style="width:820px;">
                    <table class="tbl_comm tbl_header" >
                        <thead>
                            <tr>
                                <th id="thSelect" style="width: 375px; padding-left: 10px;">
                                    <div class="all_select">
                                        <label class="label_check checked">
                                            <input type="checkbox" id="chk_all"><label for="chk_all"></label></label>
                                        <span style="float:none;margin-right:0px;" class="tit" style="vertical-align: middle;">전체선택 (
                                            <span style="float:none;margin-right:0px;" class="num_count" style="margin-right: 0px;">2</span>&nbsp;/
                                            <span style="float:none;margin-right:0px;" class="num_total" style="margin-right: 0px;">2</span>&nbsp;)
                                        </span>
                                    </div>
                                </th> 
                            </tr>
                        </thead>
                    </table> 
                    <div id="viewGoods">
                        <div>
                            <div class="view_goods"> 
                                <table class="tbl_goods goods" id="tdl" id="l_table">
                                    <tbody>
                                        <tr class="tr_food"> 
                                            <td header="thSelect" class="goods_check" style="width: 76px;">
                                                <label class="label_check checked">
                                                <input type="checkbox" id="check1" class="ico_check"><label for="check1"></label></label></td> 
                                            <td class="goods_thumb" style="width: 100px;">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="thumb">
                                                <img src="resources/img/food.PNG" alt="상품이미지" onerror="this.src='https://res.kurly.com/pc/temp/1801/noimg_100.gif'"></a>
                                            </td> 
                                            <td class="goods_info" style="width: 488px;"> 
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="name" style="vertical-align: middle;">야채 계란말이</a> 
                                                <p class="txt txt_limit"></p> 
                                            </td> 
                                         
                                        </tr>
                                        <tr class="tr_food">
                                            <td class="goods_check" style="width: 76px;">
                                                <label class="label_check checked">
                                                <input type="checkbox" id="check2" class="ico_check" value="5051"><label for="check2"></label></label></td> 
                                            <td class="goods_thumb" style="width: 100px;">
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="thumb">
                                                <img src="resources/img/food2.PNG" alt="상품이미지" onerror="this.src='https://res.kurly.com/pc/temp/1801/noimg_100.gif'"></a>
                                            </td> 
                                            <td class="goods_info" style="width: 488px;"> 
                                                <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="name" style="vertical-align: middle;">떡볶이</a> 
                                                <p class="txt txt_limit"></p> 
                                            </td> 
                                         
                                        </tr>
                                    </tbody>
                                </table>
                            </div>                        
                        </div> 
                    </div> 
                    <div class="all_select select_option">
                        <button type="button" class="btn_delete" id="sel_delete"">선택 삭제</button> 
                        <button type="button" class="btn_delete" id="all_delete" style="width: 88px;">전체 삭제</button> 
                    </div>
                </div>
            </div>
        </div>
       </div>
    </div>

       <!--전체동의-->
       <script>
            $("#chk_all").click(function(){
            var chk = $("#chk_all").prop("checked");
            if(chk) {
            $(".ico_check").prop("checked", true);
            } else {
            $(".ico_check").prop("checked", false);
            }
            });
       
        </script>
    
         <!--전체동의가 체크되있을 때 하나라도 풀리면 해제-->
         <script>           
            $(".ico_check").click(function(){
            $("#chk_all").prop("checked", false);
            });
        </script>

         <script>
            //선택삭제
            $('#sel_delete').click(function(){
                if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                    $.each($('#tdl tr'),function(index,item){
                        
                        if($(item).children().children().children().prop('checked')){
                            $(item).remove();
                        }
                    });//$.each
                }else{
                    return false;
                }
            });

            //전체삭제
            $('#all_delete').click(function(){
                if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                    $('#tdl tr').remove()
                }else{
                    return false;
                }
            });

        </script>

</body>
</html>