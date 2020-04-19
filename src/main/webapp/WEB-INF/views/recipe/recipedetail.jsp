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
                        <h3 class="name">${ b.mb_title}</h3>
                        <div class="good_list">
                            <ul>
                                <li>
                                    <div class="ment">조회수</div>
                                    <div class="ment_sub">${b.mb_count}</div>
                                </li>
                                <li>
                                    <div class="ment">추천수</div>
                                    <div class="ment_sub">${ b.mb_thank }</div>
                                </li>

                                <li>
                                    <div class="ment">${b.mb_content}</div>
                                </li>
                                
                                <br>
                                <br><br>
                                
                                <li>
                                	<table style="width:100%;">
                                		<thead>
	                                		<tr>
	                                			<th class="col" style="width:340px;">상품</th>
	                                			<th class="col" style="width:100px;">가격</th>
	                                			<th class="col" style="width:100px;">수량</th>
	                                		</tr>
                                		</thead>
                                		<tbody>
                                			<c:forEach var="bp" items="${b.getBplist() }">
		                                		<tr id="product${bp.getPrd().getPr_code() }">
		                                			<td style="padding-top:17px">
			                                            <input type="checkbox" name="product" id="source" value="source" class="check"/>
			                                            <input type="hidden" value="${bp.getPrd().getPr_code() }" name="pr_code" id="pr_code"/>
			                                            <input type="hidden" value="${bp.getPrd().getPr_price() }" name="pr_price" id="pr_price"/>
			                                            <label for = "source" style="font-size:16px;">${bp.getPrd().getPr_name() }</label>
		                                            </td>
		                                            <td>
			                                            <label for = "source" style="font-size:16px;" id ="total_price">${bp.getPrd().getPr_price() }</label>
			                                            <label for = "source" style="font-size:16px;">원</label>
				                                    </td>
				                                    <td>        
			                                            <div class="proCount">
			                                                <div class="product_count">
			                                                    <button onclick="form_btn(-1, ${bp.getPrd().getPr_code() })" class="count_btn">-</button>
			                                                    <input type="text" id="text" value="1" style="width: 30px;" class="input_num">
			                                                    <button onclick="form_btn(1, ${bp.getPrd().getPr_code() })" class="count_btn">+</button>
			                                                </div>
			                                            </div>
		                                			</td>
	                                			</tr>
                                           </c:forEach>
                                		</tbody>
                                	</table>

                                </li>
                                <li>
                                    <div class="price">
                                        <span class="total">합계 :</span>
                                        <span class="price">
                                            <strong  id="total">0</strong>
                                            <strong>원</strong>
                                        </span>
                                    </div>
                                </li>
                                
                                <li>
                                    <div style="display: flex; float: right; margin-top: 15px; margin-bottom: 30px;">
                                        <input type="button" onclick="" value="장바구니에 담기" class="bag">
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

         // 폼값 증가&감소
         function form_btn(n, pr_code){
            
        	 var selector = "product"+pr_code+" td";
            
            text_val = Number($('#'+selector).children().children().children('#text').val()); // 폼 값을 숫자열로 변환
            text_val += n; // 계산
            
            console.log(text_val);
            
            if(text_val < 0){
               text_val = 0;   // 만약 값이 0 미만이면 0로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
            }
            
            $('#'+selector).children().children().children('#text').val(text_val); // 수량을 바꾼다    
         
            var total_price = Number($('#'+selector).children('#pr_price').val())*text_val
            console.log('상품 총 가격 : '+total_price);
            $('#'+selector).children('#total_price').text(total_price);
            
            total_val();
            
        }	//form_btn

        
        // 가격을 계산하는 함수
        function total_val(){
        	
        	var total=0;
        	console.log('-- 가격 갱신 --');
        	
        	$.each($('label#total_price'), function(index, item){
        		console.log(index+'번째 상품 갱신된 가격 : '+ $(item).text());
        		total= Number($(item).text())+total;
        	})
        	
        	console.log('계산된 total : '+total);
        	$('#total').text(total);
        }
        
        
        
        
         //화면이 나오면 토탈값을 계산해준다.
         $(function(){
        	 
        	 var total=0;
        	 
        	 console.log('-- 처음 total계산 --');
        	 $.each($('input#pr_price'), function(index, item){
        		 console.log(index+'번째 상품 가격 : '+ Number($(item).val()));
        		 total = total + Number($(item).val());
        	 });
        	 
        	 console.log('계산된 total : '+ total);
        	 
        	 $('#total').text(total);
         });

    </script>
</body>
</html>
