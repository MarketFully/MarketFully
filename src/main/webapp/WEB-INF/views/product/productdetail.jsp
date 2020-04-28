<%@page import="com.kh.market.member.model.vo.MyBag"%>
<%@page import="java.util.ArrayList"%>
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
         .reviewtbl {
		    border-collapse: collapse;
		    position: relative;
		    border-bottom: 1px solid #dedede;
		    max-width: 100%;
		    width: 100%;
		}
		.item > tr> td {
		    border-bottom: 1px solid #ccc;
		    height: 30px;
		    font-size: 13px;
		    font-weight: 200;
		    padding-left: 20px;
		    padding-top: 30px;
		    padding-bottom: 30px;
		}
		body{
			margin-bottom:300px;
		}
		.reviewcontent{	   
    		text-align: left;
		}
		.goodbtn{
			width: 100px;
		    height: 35px;
		    border: 1px solid #2e8b57;
		    background-color: #fff;
		    font-size: 12px;
		    font-weight: 600;
		    color: #2e8b57;
		    float: right;
		    outline: none;
		    cursor:pointer;
		}
		#lab1{
			font-weight: bold;
		    font-size: 14px;
		    color: #1d5736;
		}
		.pagination {
			display: inline-block;
			padding-left: 75px;
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
		a { text-decoration:none 
		}
		#reviewinsert{
			width: 100px;
		    height: 35px;
		    border: 1px solid #2e8b57;
		    background-color: #2e8b57;
		    font-size: 12px;
		    font-weight: 600;
		    color: white;
		    float: right;
		    outline: none;
		    cursor:pointer;
		    margin-top:30px;
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
            width: 20%; /* Could be more or less, depending on screen size */                          
        }
        
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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
                                            <strong name="total1" id="total1">${p.pr_price }</strong>
                                            <strong>원</strong>
                                        </span>
                                    </div>
                                </li>
                                <li>
                                    <div style="display: flex; float: right; margin-top: 15px; margin-bottom: 30px;">
                                        <input type="submit" onclick="toBasket()" value="장바구니에 담기" class="bag"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="submit" onclick="miroticView()" value="주문하기" class="bag">
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
                    <ul class="recipe_cotent" style="margin-bottom: 0px;">
                        <li class="recipe_reply" data-tab="tab2" style="border-right: 1px solid #2e8b57;">후기</li>
                    </ul>
                </div>

                     <!-- 후기 -->
                    <div>
                    	<table class="reviewtbl" id="user_table">
                    <thead>
                        <tr style="height:70px;border-bottom: 1px solid #ccc;">
                            <th class="col">번호</th>                    
                            <th class="colT">제목</th>
                            <th class="col">작성자</th>
                            <th class="col">작성일</th>
                          <!--    <th class="col">좋아요</th> -->
                            <th class="col">조회수</th>
                        </tr>
                    </thead>
                    		<c:url var="ProductReview" value="ProductReview">
								<c:param name="pr_code" value="${p.pr_code}"/>
							</c:url>
                     <c:forEach var="pr" items="${ list }">
                    <tbody class="item">
                        <tr class="reviewtr" style='height: 67px;' onclick="countup(${pr.re_num },this);">
                            <td style="width:30px;">${pr.re_num }</td>
                            <td class="tdtext" style="padding-left: 30px; width: 120px;text-align: start;">${pr.re_title }</td>
                            <td style="width:40px;">${pr.re_writer }</td>
                            <td style="width:40px;">${pr.re_date }</td>
                            <td style="width:30px">${pr.re_count }</td>
                        </tr>
                         <tr style="display:none;">
						         <td class="reviewcontent" colspan="5">
						       <label id="lab1">${p.pr_name}</label><br><br><br>
					           <c:if test="${pr.re_rename != NULL}">
                            		<img src="resources/reviewuploadFiles/${pr.re_rename }"
                            		 onerror="this.src='resources/img/errorimg.PNG' " 
                            		 alt="상품 이미지" style="width: 500px; height: 310px;"> <br><br> 
                               </c:if>  
						       <label>${pr.re_content}</label><br>
						       </td>
						</tr>
                    </tbody>
                    </c:forEach>                
                </table>
                 <button id="reviewinsert">후기 쓰기</button>
                
                <c:if test="${ pi.listCount > 0}">
				<div class="pagination">

					<c:if test="${ pi.currentPage eq 1 }">
						<img src="resources/img/arrow_left.png" alt="첫 페이지로 이동"
							class="firstpage_img" style="margin-right: 10px">
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before"
							value="ProductDetail?pr_code=${p.pr_code}">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }"><img src="resources/img/arrow_left.png"
							alt="첫 페이지로 이동" class="firstpage_img" style="margin-right: 10px"></a>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<span class="pagenum_currentpage"> <font color="white"
								size="3"><b>${ p }</b></font>
							</span>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination"
								value="ProductDetail?pr_code=666">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<span class="pagenum"> <a href="${ pagination }">${ p }</a>
							</span>
						</c:if>
					</c:forEach>

					<c:if test="${ pi.currentPage eq pi.maxPage }">
						<img src="resources/img/arrow_right.png" alt="이전 페이지로 이동"
							class="prevpage_img" style="margin-left: 10px">
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after"
							value="ProductDetail?pr_code=${p.pr_code}">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }"><img src="resources/img/arrow_right.png"
							alt="이전 페이지로 이동" class="prevpage_img" style="margin-left: 10px"></a>
					</c:if>
				</div>
				</c:if>
            </div>
            
        </div>
    </div>
    <!-- boardDetail end-->

	<!-- myModal 장바구니 -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      	<label>여기에 대충 장바구니 정보 출력</label>
        <p>장바구니에 등록되었습니다.</p>
        <button onclick="location.href='basket'">장바구니로 이동하기</button>
        <button id="modalClose">계속하기</button>
      </div>

    </div>



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
            
            var text1 = document.getElementById("text1"); // 폼 선택
            text_val = parseInt(text1.value); // 폼 값을 숫자열로 변환
            text_val += n; // 계산
            
            if(text_val <= 0){
               text1.value = 1;   // 만약 값이 0 이하면 1로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
            }
            
            text1.value = text_val; // 계산된 값을 바꾼다
        
            var total1 = $('#text1').val()*${p.pr_price}
            
            $('#total1').text(total1);
        }
    </script>

  <script>
    $(function () {
        $(".reviewtr").click(function(){  
            $(this).next().toggle();

        })
        $('.reviewtr').on({
            'mouseenter':function(){
                $(this).css('background','#f7f7f7');
            },'mouseleave':function(){
                $(this).css('background','white');
            }
        });
    });
    
    function countup(re_num,A){
    	
    	$.ajax({
			url : "ReviewCount",
			type : "post",
			data : {re_num :  re_num},
			dataType : "text",
			success : function(data) {
				console.log(data);
				
			A.children[4].innerHTML=data;
			
			},
			error : function(request, status,
					errorData) {
				alert("error code : "
						+ request.status + "\n"
						+ "message: "
						+ request.responseText
						+ "error : "
						+ errorData);
			}
		});
    }

    $(".goodbtn").on("click",function(){
    	var login =  '${ loginUser.mem_id }';
    	if(login == ""){
    		 alert("로그인을 해주세요.")
             return;
    	}
    });
    
    $("#reviewinsert").on("click",function(){
    	var login =  '${ loginUser.mem_id }';
    	if(login == ""){
    		 alert("상품후기는 상품을 구매하시고 배송완료된 회원 분만 작성 가능합니다.")
             location.href="login.do";
    	}else{
    		location.href="mypagereview";
    	}
    });
    
    
    //장바구니로 이동
    function toBasket(){
    	if(${empty loginUser}){
   		 alert('회원만 이용 가능합니다.');
   		 return false;
   	 }
    	//cartList를 만들어서 센션에 넣어줘야 한다.
	
    	//넘겨야될 값을 배열로 만든다.
       	 var prcodeArr = [];	//상품코드
       	 var prnameArr = [];	//상품이름
       	 var prpriceArr= [];	//상품가격
       	 var preachArr = [];	//상품 갯수
       	 
   		 	prcodeArr[0] = ${p.pr_code};
	   	 	prnameArr[0]='${p.pr_name}';
	   	 	prpriceArr[0]=${p.pr_price};
	   	 	preachArr[0]=$('#text1').val();
	   	 
 		$.ajax({
 			url:"myCart"
 			, data:{
 				 'prcodeArr' : prcodeArr
				, prnameArr : prnameArr
				, prpriceArr : prpriceArr
				, preachArr : preachArr
 			}//data
 			, dataType:"text"
 			, type:"post"
 			, success:function(data){
 				console.log('success : '+data);
				console.log('cartList : '+ '${cartList}');
	        	 $('#myModal').css("display", "block");
 			}//success
 			, error:function(request,status,error){
    	 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	 	}//error
 		})//ajax
    } // toBasket
    
    
    
    //주문 페이지로 이동
    function miroticView(){
    	//주문을 누르는 순간
    	if(${empty loginUser}){
   		 alert('회원만 이용 가능합니다.');
   		 return false;
   	 }
    	var list=[];
    	list.push({
       		'pr_code' : ${p.pr_code}
       		, 'pr_each' : $('#text1').val()
   			});
	   	 
	   	 $.ajax({	
	   			url:"miroticView"
	   			, data: JSON.stringify(list)
	   			, dataType : "text"
	   			, contentType : "application/json"
	   			, method:"post"
	   			, success:function(data){
	   				console.log(data);
	   				location.href="miroticView";
	   			}//success
	   			, error:function(request, status, error){
	   				console.log('request :'+request);
	        			console.log('status :'+status);
	        			console.log('error :'+error);
	   			}//error
	   		}); //ajax 
    	//확인
    	
   		
    }//miroticView
    
    </script>
</body>
</html>