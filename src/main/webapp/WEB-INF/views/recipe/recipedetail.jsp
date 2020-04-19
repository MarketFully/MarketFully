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
        
                /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
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
                        <img src="resources/img/tvRecipe/${b.getMb_rename() }" style="width:400px;">
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
                                        <!-- <a href="#myModal" rel="modal:open" class="bag">장바구니에 담기</a> -->
                                        <a href="#" onclick="saveRecipe();" class="bag">장바구니에 담기</a>
                                        
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
                    	
                    	<c:forEach var="be" items="${b.getBelist() }">
                       		<div class="step1">
	                            <div class="countR">${be.getSeq() } .</div>
	                            <div class="step1ment">${be.getContent() }</div>
	                            <div class="stem1img"><img src="resources/img/tvRecipe/${be.getRename()}" class="foodR"></div>
	                        </div>
                    	</c:forEach>
                       

                </div> <!-- class="recipe_view" -->

                <div>
                    <ul class="recipe_cotent">
                        <li class="recipe_reply current" data-tab="tab1">댓글</li>
                        <li class="recipe_reply" data-tab="tab2" style="border-right: 1px solid #2e8b57;">후기</li>
                    </ul>
                </div>
                     <!-- 댓글 -->
                     <div id="tab1" class="reply current">
                     
                     <c:forEach var="br" items="${b.getBrlist() }">
                     	<div class="reply_body">
                            <h4 class="reply_head"><b class="reply_name">${br.getWriter()} 님</b>2020-03-24</h4>
                            <p class="reply_main">${br.getContent() }</p>
                        </div>
                     </c:forEach>

                        
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


	<div id="myCart1" class="modal">
		<p>장바구니 모달창</p>
		<a href="#" rel="modal:close">계속 쇼핑하기</a>
		<a href="#">결제하기</a>
	</div>



	
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p>Some text in the Modal..</p>
      </div>

    </div>



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

         
         //장바구니 function
         function saveRecipe(){
        	 
        	 console.log('saveRecipe my Modal display none으로 바꿔줌');
        	 
        	 $('#myModal').css("display", "block");
        	 
         }
    </script>
</body>
</html>
