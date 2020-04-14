<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/boarddetail.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->
    <title>Document</title>
    <style>
        .product_count{
            border:1px solid #ddd;
            border-radius: 50px;
            display: flex;
            align-items: center;
            padding: 6px 6px;
            width: 70px;
            height: 13px;
            float: right;
        }
        .input_num{
            border: 0px solid transparent;
            text-align: center;
        }

        .count_btn{
           border: none;
           background: none;
        }

        .proCount{
            display: inline; 
            /* float: right; */
        }
    </style>
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
                        <h3 class="name">${ b.MB_TITLE }</h3>
                        <div class="good_list">
                            <ul>
                                <li>
                                    <div class="ment">조회수</div>
                                    <div class="ment_sub">${b.MB_COUNT }</div>
                                </li>
                                <li>
                                    <div class="ment">추천수</div>
                                    <div class="ment_sub">${ b.MB_THANK }</div>
                                </li>

                                <li>
                                    <div class="ment">영양성분</div>
                                        <div class="ment_sub">
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
                                    <div class="ment">상품</div>
                                    
                                    <div class="ment_sub1">
                                        <div> 
                                          
                                            <input type="checkbox" name="product" id="source" value="source" class="check">
                                            <label for = "source">샘표 - 맛간장</label>
                                            
                                            <div class="proCount">
                                                <div class="product_count">
                                                    <button onclick="form_btn(-1)" class="count_btn">-</button>
                                                    <input type="text" id="text" value="1" style="width: 30px;" class="input_num">
                                                    <button onclick="form_btn(1)" class="count_btn">+</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div>
                                            <input type="checkbox" name="product" id="cheese" value="cheese"  class="check">
                                            <label for="cheese">서울우유 - 체다슬라이스 치즈</label>
                                            <div class="proCount">
                                                <div class="product_count">
                                                    <button onclick="form_btn1(-1)" class="count_btn">-</button>
                                                    <input type="text" id="text1" value="1" style="width: 30px;" class="input_num">
                                                    <button onclick="form_btn1(1)" class="count_btn">+</button>
                                                </div>
                                            </div>
                                        </div>             
                                    </div>
                                </li>
                                <li>
                                    <div class="price">
                                        <span class="total">합계 :</span>
                                        <span class="price">
                                            <strong>50000</strong>
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
                <!-- 레시피 상단부분 (info) end -->
                <!-- 레시피 내용 s-->
                <div class="recipe_view">
                    <ul class="recipe_cotent">
                        <li class="recipe_tab">레시피내용</li>
                    </ul>
                        <div class="turn"><p style="margin-left: 10px;">조리순서</p></div>
                        <div class="step1">
                            <div class="countR">1.</div>
                            <div class="step1ment">대파는 송송 썬 후 달군 팬에 식용유를 넉넉히 두르고 대파를 넣어 볶는다.</div>
                            <div class="stem1img"><img src="resources/img/recipe14.png" class="foodR"></div>
                        </div>

                        <div class="step2">
                            <div class="countR">2.</div>
                            <div class="step2ment">파향이 나오면 다진 김치를 넣어 볶는다.</div>
                            <div class="stem2img"><img src="resources/img/recipe3.png" class="foodR"></div>
                        </div>

                        <div class="step3">
                            <div class="countR">3.</div>
                            <div class="step3ment">팬 가장자리에 간장과 설탕을 넣어 볶는다.</div>
                            <div class="stem3img"><img src="resources/img/recipe4.png" class="foodR"></div>
                        </div>

                        <div class="step4">
                            <div class="countR">4.</div>
                            <div class="step4ment">마지막으로 고춧가루를 넣고 볶아 김치밥 베이스를 만든다.</div>
                            <div class="stem4img"><img src="resources/img/recipe7.png" class="foodR"></div>
                        </div>

                        <div class="step5">
                            <div class="countR">5.</div>
                            <div class="step5ment">볼에 밥과 김치밥 베이스를 넣고 잘 비벼준다.</div>
                            <div class="stem5img"><img src="resources/img/recipe9.png" class="foodR"></div>
                        </div>

                        <div class="step6">
                            <div class="countR">6.</div>
                            <div class="step6ment">기름을 두른 팬에 비벼진 밥을 눌어 붙도록 넓게 펴준다.</div>
                            <div class="stem6img"><img src="resources/img/recipe6.png" class="foodR"></div>
                       </div>

                        <div class="step7">
                            <div class="countR">7.</div>
                            <div class="step7ment">피자치즈를 한쪽면에 올리고 뚜껑을 닫아 30초 정도 익힌다.</div>
                            <div class="stem7img"><img src="resources/img/recipe13.png" class="foodR"></div>
                        </div>

                        <div class="step8">
                            <div class="countR">8.</div>
                            <div class="step8ment">김치밥을 반으로 접어 그릇에 담은 뒤 김가루와 옥수수통조림을 곁들여 완성한다.</div>
                            <div class="stem8img"><img src="resources/img/recipe14.png" class="foodR"></div>
                        </div>
                </div>

                <div>
                    <ul class="recipe_cotent">
                        <li class="recipe_reply current" data-tab="tab1">댓글</li>
                        <li class="recipe_reply" data-tab="tab2" style="border-right: 1px solid #2e8b57;">후기</li>
                    </ul>
                </div>
                     <!-- 댓글 -->
                     <div id="tab1" class="reply current">
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">1111111</p>
                        </div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">222222</p>
                        </div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">333333</p>
                        </div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">4444444</p>
                        </div>
                        <div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">OOO님</b>2020-03-24</h4>
                            <p class="reply_main">5555555</p>
                        </div>

                        <div> 
                            <input type="button" value="댓글" class="btn" onclick="location.href=''">
                        </div>
                    </div>
                     <!-- 후기 -->
                    <div id="tab2" class="reply">
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

                        <div> 
                            <input type="button" value="후기" class="btn" onclick="location.href=''">
                        </div>
                    </div>


            </div>
            
        </div>
    </div>
    <!-- boardDetail end-->

    <script>
        // 탭 메뉴 스크립트
        $(function() {
			$('ul.recipe_cotent li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.recipe_cotent li').removeClass('current');
				$('.reply').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});


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
