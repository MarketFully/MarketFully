<%@page import="java.util.List"%>
<%@page import="com.kh.market.admin.model.vo.MainCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.market.admin.model.Service.CategoryServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/main.css">
<title>Shop Item - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

.inputcss {
	border: 1px solid #dedede;
	border-radius: 4px;
	height: 21px;
	width: 250px;
	font-family: MapoPeacefull;
}
</style>

</head>

<body>
	<%@include file="../common/adminheader.jsp"%>

	<script>
var subdatalist = new Array();
var maindatalist = new Array();
$(function(){
	
	$.ajax({
		url:"adminsubgory",
		dataType:"json",
		success:function(data){
			subdatalist=data;
		},error:function(request, status, errorData){
			alert("error code : " + request.status + "\n"
					+ "message : " + request.responseText
					+ "error : " + errorData);
		}
	});
});
var str = "";
$(function(){
	
	$.ajax({
		url:"adminmaincategory",
		dataType:"json",
		success:function(data){
			maindatalist=data;
			for(var i = 0 ; i < maindatalist.length;i++){
		  	str += '<a onclick="changemaincategory(this);" style="cursor: pointer;">'+maindatalist[i].catename1+'</a>';
		  	str += '<input type="hidden" value='+maindatalist[i].catecode1+'>';
			}
			document.getElementById("maincatelist").innerHTML = str;
			console.log(str);
		},error:function(request, status, errorData){
			alert("error code : " + request.status + "\n"
					+ "message : " + request.responseText
					+ "error : " + errorData);
		}
	});
});
//////////이미지 미리보기

	var sel_file;
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
	});
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	//////////이미지 미리보기
</script>
	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-lg-12">
			 <form action="Productinsert.do" method="post" id=pfrm enctype="multipart/form-data"> 
			
				<h3>상품 등록하기</h3>
				<div class="card mt-4">
					<img id="img" src=""
						style="width: 50%; border: 1px solid gray;"> 
						<input name="uploadimg" type="file" id="input_img" placeholder="">  <br>
					<div class="list-group" style="width: 30%;">
						<div class="dropdown">
							<button id="maincate" class="list-group-item dropbtn"
							onclick="return false;"	style="width: 100%;">상위 카테고리</button>
							<div id="maincatelist" class="dropdown-content"
								style="width: 100%;">

							</div>

						</div>
↓
						<div id=subonoff class="dropdown" style="display: none;">
							<button id="subcate" id="subcate" class="list-group-item dropbtn"
								onclick="return false;" style="width: 100%;">하위 카테고리</button>
							<div id="subcatelist" class="dropdown-content"
								style="width: 100%;">
						
							</div>
						</div>
						<div id="productonoff" class="dropdown" style="display: none;">
							<button id="productname" class="list-group-item dropbtn"
								style="width: 100%;">상품 명 찾기</button>
						
						</div>
						<input id="catebtn" type="button" class="list-group-item"
							value="적용하기" style="display: none;">
					</div>



					<div class="card-body">
						<table
							style="border-top: 2px solid #666666; border-bottom: 2px solid #666666; width: 100%;">
							<tr
								style="border-top: 1px solid #e9e9e9; border-bottom: 1px solid #e9e9e9;">
								<td style="background: #f7f7f7"><p class="card-text">
										상품 명 :</td>
								</p>
								<td><p class="card-text">
										<input type=text class="inputcss" value="" name="PR_NAME"
											placeholder="상품명을 기입해주세요.">
									</p></td>
							</tr>
							<tr
								style="border-top: 1px solid #e9e9e9; border-bottom: 1px solid #e9e9e9;">
								<td style="background: #f7f7f7">
									<p class="card-text">상품 용량 :</p>
								</td>
								<td>
									<p class="card-text">
										<input type=text class="inputcss" value="0" name="PR_SIZE"
											placeholder="상품용량을 기입해주세요.">
									</p>
								</td>
							</tr>
							<tr
								style="border-top: 1px solid #e9e9e9; border-bottom: 1px solid #e9e9e9;">
								<td style="background: #f7f7f7">
									<p class="card-text">재고 :</p>
								</td>
								<td>
									<p class="card-text">
										<input type='number' class="inputcss" value="0"
											name="PR_ENTITY" placeholder="재고를 기입해주세요.">
									</p>
								</td>
							</tr>
							
							<tr
								style="border-top: 1px solid #e9e9e9; border-bottom: 1px solid #e9e9e9;">
								<td style="background: #f7f7f7">
									<p class="card-text">kcal :</p>
								</td>
								<td>
									<p class="card-text">
										<input type=NUMBER class="inputcss" value="0" name="PR_CARLORY"
											placeholder="상품 열량을 입력해주세요.">
									</p>
								</td>
							</tr>
							
							
							
							<tr
								style="border-top: 1px solid #e9e9e9; border-bottom: 1px solid #e9e9e9;">
								<td style="background: #f7f7f7">
									<p class="card-text">상세내용</p>
								</td>
								<td>
									<p class="card-text">
										<textarea name="PR_CONTENT" id="" cols="30" rows="10" class="inputcss" style="height: 200px; width: 90%;" name=PR_CONTENT>
1. 오뚜기 케찹은 진한 케찹으로 우리 입맛에 맞는 우리의 자랑 대한민국 대표 케찹입니다.
2. 새콤 달콤한 오뚜기 케찹은 빨갛게 잘 익은 신선한 토마토만을 사용하여 만들어 깊고 진한 맛을 더했습니다.
3. 오뚜기 토마토 케찹의 붉은색은 토마토에 들어 있는 라이코펜(lycopene) 성분입니다.
4. 샐러드, 볶음밥, 계란후라이, 튀김류 등 어느 음식과도 잘 어울립니다.
                  </textarea>
									</p>

								</td>
							</tr>
							<tr
								style="border-top: 1px solid #e9e9e9; border-bottom: 1px solid #e9e9e9;">
								<td style="background: #f7f7f7">
									<p class="card-text">원산지</p>
								</td>
								<td>
									<p class="card-text">
										<textarea name="PR_FROM" id="" cols="30" rows="10" class="inputcss"
											style="height: 200px; width: 90%;">
토마토페이스트43.8%[외국산(미국,칠레,중국 등)], 정제수, 물엿, 설탕, 발효식초(주정,발효영양원), 정제소금(국산), 잔탄검, 케챂향신료[천연향신료(육두구:인도네시아산),양파분(미국산)] [토마토 함유] *토마토페이스트 함량은 가용성고형분 25%기준임.
                  </textarea>
									</p>

								</td>
							</tr>
						</table>

					</div>
				</div>
				<input type="hidden" name="PR_CATE1" id="PR_CATE1" value="">
				<input type="hidden" name="PR_CATE2" id="PR_CATE2" value="">
 				<!-- /.card -->
				<center>
					<button class="btn btn-success">상품 등록하기</button>
				</center>
				<!-- /.card -->
				</form>

			</div>
			<!-- /.col-lg-9 -->

		</div>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

<script>

  
	function changemaincategory(maincate) { // 메인카테고리를 눌렀으면
		document.getElementById("subonoff").style.display = ""; //하위 카테고리 선택 창이 보이고
		document.getElementById("subcate").innerHTML = "하위 카테고리";
		console.log(maincate.nextSibling); // 메인카테고리의 메인코드 (히든태그) 찾아오기
		document.getElementById("PR_CATE1").value = maincate.nextSibling.value;
		var substr = "";
		for (var i = 0; i < subdatalist.length; i++) { //하위카테고리의 데이터 length만큼 반복
			if (subdatalist[i].upcate == maincate.nextSibling.value) { // 
				substr += '<a style="cursor: pointer;" onclick="changesubcategory(this);">'
						+ subdatalist[i].catename2 + '</a>';
				substr += '<input type="hidden" value='+subdatalist[i].catecode2+'>';
			}
			document.getElementById("subcatelist").innerHTML = substr;
		}
		document.getElementById("maincate").innerHTML = maincate.innerHTML;
	}

	function changesubcategory(subcate) {//서브카테고리를 눌렀으면
		document.getElementById("catebtn").style.display = "";
		document.getElementById("subcate").innerHTML = subcate.innerHTML;
		document.getElementById("PR_CATE2").value = subcate.nextSibling.value;
	}

	var str = "";
</script>

</html>
