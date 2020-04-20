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
                        <img src="resources/img/detail.jpg">
                        <div>
                            <img src="resources/img/heart.png" class="choice">
                        </div>
                    </div>

                    
                    <div class="goods_name">
                        <h3 class="name">GAP 대저 짭짤이 토마토</h3>
                        <div class="good_list">
                            <ul>
                                <li>
                                    <div class="ment">가격</div>
                                    <div class="ment_subject">15000원</div>
                                </li>
                                <li>
                                    <div class="ment">판매단위</div><!-- admin 에서는 상퓸용량 -->
                                    <div class="ment_subject">1팩</div>
                                </li>
                                <li>
                                    <div class="ment">제조사(원산지)</div>
                                    <div class="ment_subject">부산</div>
                                </li>
                                <li>
                                    <div class="ment">영양성분</div>
                                        <div class="ment_subject">
                                        <table style="border-collapse: collapse;">
                                        <tr style="border-bottom:2px solid #2f2f30;" id="tabletr">
                                            <th id="viewtable">재료</th>
                                            <th id="viewtable">량</th>
                                            <th id="viewtable">칼로리</th>
                                        </tr>
                                        <tr id="showtable">
                                           <td>다진김치</td>
                                           <td>1/3컵 (80g)</td>
                                           <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>피자치즈</td>
                                            <td>1/2컵(50g)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>대파</td>
                                            <td>1/2컵(15g)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>밥</td>
                                            <td>1공기(200g)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>옥수수콘</td>
                                            <td>1/2 컵(30g)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>김가루</td>
                                            <td>1/2컵(3g)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>진간장</td>
                                            <td>1큰술(10ml)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>황설탕</td>
                                            <td>1작은술(3g)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>고춧가루</td>
                                            <td>1큰술(5g)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>식용유</td>
                                            <td>1큰술(12ml)</td>
                                            <td>kcal</td>
                                        </tr>
                                        <tr id="showtable">
                                            <td>깨</td>
                                            <td>1꼬집(1g)</td>
                                            <td>kcal</td>
                                        </tr>
                                        </table>
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
                                            <strong>15000</strong>
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
                        <img src="resources/img/pic1.jpg" style="margin-top: 40px;"> 
                    </div>
                    <div class="product_Info">
                        <p  style="text-align: center;"> GAP 대저 짭짤이 토마토</p>
                        <hr>
                        <p class="product_text">
                            대저 토마토는 부산 대저 지역에서만 생산되는 특산물이에요. 다 익은 상태가 푸른빛을 띠는 토마토로 '토마토는 빨갛다'라는 고정관념을 불
                            식시킨 이색 작물이죠. 일반 토마토의 절반 크기로 아삭거리는 식감과 신선한 맛이 월등히 뛰어나요. 바닷물과 강물이 만나는 낙동강 하류에
                            위치한 부산 대저동, 이곳의 천연 미네랄이 풍부한 퇴적 토양에서 자라나 일반 토마토에서 맛볼 수 없는 짠맛과 신맛, 단맛이 입체적으로 전
                            해진답니다. 때문에 일명 짭짤이 토마토라는 이름이 붙었죠. 재배부터 유통까지 모든 위해요소가 철저하게 관리된 GAP 등급의 대저 짭짤이 토마토를 준비했으니 안전히, 만나보세요.
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