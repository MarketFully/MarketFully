<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/boarddetail.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->
    <style>
        .purchase_count{
            border:1px solid #ddd;
            border-radius: 50px;
            display: flex;
            align-items: center;
            padding: 6px 6px;
            width: 70px;
            height: 13px;
        }
        .count_btn{
           border: none;
           background: none;
        }
        .input_num{
            border: 0px solid transparent;
            text-align: center;
        }

        .ment_subject{
            margin-left: 150px;
            display: flex;
        }

        .product_Info{
            font-size: 25px;
            margin-top: 50px;
            margin-bottom: 150px;
            font-weight: 600;
            text-align: justify;
        }
        .product_text{
            font-size: 15px;
            font-weight: 400;
            display: inline;
        }
    </style>
    <title>Document</title>
</head>
<body>
    <!--header-->
    <%@include file="../common/header.jsp" %>
    <!-- header end-->

    <!-- boardDetail-->
    <div class="boardDetailview">
        <div class="boardDetail">
            <div class="sectionView">
                <div class="sectionInner">
                    <div class="detailImg">
                        <img src="resources/img/Productuploadimg/${p.renameFileName }" style="width:400px;"
                        onERROR="this.src='resources/img/errorimg.PNG' ">
                        <div>
                            <img src="resources/img/heart.png" class="choice">
                        </div>
                    </div>

                    
                    <div class="goods_name">
                        <h3 class="name">${p.pr_name }</h3>
                        <div class="good_list">
                            <ul>
                                <li>
                                    <div class="ment">가격</div>
                                    <div class="ment_subject">${p.pr_price }</div>
                                </li>
                                <li>
                                    <div class="ment">판매단위</div><!-- admin 에서는 상퓸용량 -->
                                    <div class="ment_subject">${p.pr_size }</div>
                                </li>
                                <li>
                                    <div class="ment">열량</div>
                                    <div class="ment_subject">${p.pr_carlory }</div>
                                </li>
                                <li>
                                    <div class="ment">원산지</div>
                                        <div class="ment_subject">
                                            ${p.pr_from }
                                    </div>
                                </li>
                                <li>
                                    <div class="ment" style="margin-right: 80px;">구매수량</div>
                                    
                                    <div class="purchase_count">
                                        <button onclick="form_btn1(-1)" class="count_btn">-</button>
                                        <input type="text" id="text1" value="1" style="width: 30px;" class="input_num">
                                        <button onclick="form_btn1(1)" class="count_btn">+</button>
                                    </div>
                                </li>
                                <li style="margin-top:20px; margin-bottom:20px;">
                                    <div class="price">
                                        <span class="total">합계 :</span>
                                        <span class="price">
                                            <strong>총 ${p.pr_price }</strong>
                                            <strong>원</strong>
                                        </span>
                                    </div>
                                </li>
                                <li>
                                    <div style="display: flex; float: right; margin-top: 15px; margin-bottom: 30px;">
                                        <input type="submit" value="장바구니에 담기" class="bag">
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 상품 상단부분 (info) end -->

                <!-- 상품 설명 start -->
                <div class="recipe_view">
                    <ul class="recipe_cotent">
                        <li class="recipe_tab">상품설명</li>
                    </ul>
                    <div class="product_img">
                        <img src="resources/img/Productuploadimg/${p.renameFileName }" onERROR="this.src='resources/img/errorimg.PNG' " style="margin-top: 40px;"> 
                    </div>
                    <div class="product_Info">
                        <p  style="text-align: center;"> ${p.pr_name }</p>
                        <hr>
                        <p class="product_text">
                           ${p.pr_content }
                        </p>
                    </div>



                </div>

                <!-- 상품 설명 end -->
                <div>
                    <ul class="recipe_cotent">
                        <li class="recipe_reply" data-tab="tab2" style="border-right: 1px solid #2e8b57;">후기</li>
                    </ul>
                </div>

                     <!-- 후기 -->
                    <div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">존맛탱</p>
                        </div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">존맛탱</p>
                        </div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">존맛탱</p>
                        </div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">존맛탱</p>
                        </div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">존맛탱</p>
                        </div>
                    </div>

                    <div> 
                        <input type="button" value="후기쓰기" class="btn" onclick="location.href=''">
                    </div>
            </div>
            
        </div>
    </div>
    <!-- boardDetail end-->


    <script>
         // 폼값 증가&감소
         function form_btn(n){
            
            var text = document.getElementById("text"); // 폼 선택
            text_val = parseInt(text.value); // 폼 값을 숫자열로 변환
            text_val += n; // 계산
            text.value = text_val; // 계산된 값을 바꾼다
            
            if(text_val <= 0){
               text.value = 1;   // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
            }
        }

        function form_btn1(n){
            
            var text = document.getElementById("text1"); // 폼 선택
            text_val = parseInt(text1.value); // 폼 값을 숫자열로 변환
            text_val += n; // 계산
            text1.value = text_val; // 계산된 값을 바꾼다
            
            if(text_val <= 0){
               text1.value = 1;   // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
            }
        }
    </script>

</body>
</html>