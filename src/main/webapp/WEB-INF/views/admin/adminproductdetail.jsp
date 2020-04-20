<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<script>

var subdatalist = new Array();
var maindatalist = new Array();
$(function(){
	
	$.ajax({
		url:"adminsubgory",
		dataType:"json",
		success:function(data){
			subdatalist=data;
			for(var i = 0 ; i < subdatalist.length;i++){
				if(subdatalist[i].upcate== "${p.pr_cate1}" && subdatalist[i].catecode2){
					document.getElementById("subcate").innerHTML=subdatalist[i].catename2;
					break;
				}
			}
		},error:function(request, status, errorData){
			alert("error code : " + request.status + "\n"
					+ "message : " + request.responseText
					+ "error : " + errorData);
		}
	});
});
var maincatename = "";
$(function(){
	
	$.ajax({
		url:"adminmaincategory",
		dataType:"json",
		success:function(data){
			maindatalist=data;
			for(var i = 0 ; i < maindatalist.length;i++){
				if(maindatalist[i].catecode1 == "${p.pr_cate1}"){
					document.getElementById("maincate").innerHTML=maindatalist[i].catename1;
					break;
				}
			}
		},error:function(request, status, errorData){
			alert("error code : " + request.status + "\n"
					+ "message : " + request.responseText
					+ "error : " + errorData);
		}
	});
});
</script>

    <!--header-->
    <%@include file="../common/adminheader.jsp" %>
    <!-- header end-->

    <!-- boardDetail-->
    <div class="boardDetailview">
        <div class="boardDetail">
            <div class="sectionView">
                <div class="sectionInner">
                    <div class="detailImg">
                        <img src="resources/img/Productuploadimg/${p.renameFileName}" style="width : 400px;">
                        <div>
                            <img src="resources/img/heart.png" class="choice">
                        </div>
                    </div>

                    
                    <div class="goods_name">
                        <h3 class="name">${p.pr_name }</h3>
                        <div class="good_list">
                            <ul>
                           		 <li>
                                   	<div class="ment">상위 카테고리</div>
                                    <div id="maincate" class="ment_subject">${p.pr_cate1} </div>
                                </li>
                                <li>
                                    <div class="ment">하위 카테고리</div>
                                    <div id="subcate" class="ment_subject">${p.pr_cate2} </div>
                                </li>
                                <li>
                                    <div class="ment">상품 코드</div>
                                    <div class="ment_subject">${p.pr_code} </div>
                                </li>
                                <li>
                                    <div class="ment">판매단위</div><!-- admin 에서는 상퓸용량 -->
                                    <div class="ment_subject">${p.pr_size}</div>
                                </li>
                                <li>
                                    <div class="ment">제조사(원산지)</div>
                                    <div class="ment_subject">${p.pr_from}</div>
                                </li>
                                
                                <li>
                                    <div class="ment" >남은 재고수량</div>
                                    
                                       <div class="ment_subject">${ p.pr_entity}</div>
                                </li>
                                <li style="margin-top:20px; margin-bottom:20px;">
                                    <div class="price">
                                        <span class="total">가격 :</span>
                                        <span class="price">
                                            <strong>${p.pr_price }</strong>
                                            <strong>원</strong>
                                        </span>
                                    </div>
                                </li>
                                <li>
                                <c:url var="p_modify" value="AdminProductmodify">
                                 <c:param name="pr_code" value="${p.pr_code }"/>
                                </c:url>
                                    <div style="display: flex; float: right; margin-top: 15px; margin-bottom: 30px;">
                                        <input type="button" onclick="location.href='${p_modify}'" value="상품 수정하기" class="bag">
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
                        <img src="resources/img/Productuploadimg/${p.renameFileName }" style="margin-top: 40px;"> 
                    </div>
                    <div class="product_Info" style="text-align: center;">
                        <p  style="text-align: center;"> ${p.pr_name }</p>
                        <hr>
                        <p class="product_text">
							${p.pr_content }
                        </p>
                       <p  style="text-align: center;"> 원산지</p>
                        <hr>
                        <p class="product_text">
							${p.pr_from}
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