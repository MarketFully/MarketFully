<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 이미지 슬라이드  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <link rel="stylesheet" href="resources/css/main.css">

    <title>mainpage</title>
<style>
    .w-100{
        width: 100%!important;
        height: 450px;
    }
    a{
        color: #007bff;
    text-decoration: none;
    background-color: transparent;
    }
    </style>

</head>

<body>
    <div class="full">
        <div class="container">
            <!-- header -->
            <%@include file="../common/adminheader.jsp" %>
<hr><br>
            <h1>상품 리스트</h1>
			<div class="row">

				<c:forEach var="R" begin="0" end="7" step="1">
					<c:if test="${list[R]!=null }">
						<div class="col-lg-3 col-md-6 mb-4">
							<div class="Rcard h-500 w-100">
								<a href="AdminProductDetail?pr_code=${list[R].pr_code }"><img src="resources/img/Productuploadimg/${list[R].renameFileName }"
									onERROR="this.src='resources/img/errorimg.PNG'" class="Rcard-img-top" style="width: 90%; height: 280px;"  ></a>

								<div class="Rcard-body">
									<h4 class="Rcard-title" style="font-size: ">
										<a href="AdminProductDetail?pr_code=${list[R].pr_code }"
										 style="text-decoration: none;">${list[R].pr_name }</a>
									</h4>
									<p class="Rcard-text">남은 재고 : ${list[R].pr_entity }개 &nbsp;&nbsp; 가격 : ${list[R].pr_price } 원</p>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${list[R]==null }">
						<div class="col-lg-3 col-md-6 mb-4">
						</div>
					</c:if>
				<c:if test="${R ==3}">
					</div>
					<div class=row>
				</c:if>
				</c:forEach>
			</div>
              
              <c:if test="${ pi.currentPage eq 1 }">
<img src="resources/img/arrow_left.png" style="width:25px;height:25px;vertical-align: middle;">

				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url var="before" value="adminproduct_list">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
 <a href="${before}"><img src="resources/img/arrow_left.png" style="width:25px;height:25px;vertical-align: middle;"></a>

				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="#2e8b57" size="4"><b>${ p }</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="adminproduct_list">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
		                     <img src="resources/img/arrow_right.png" alt="다음 페이지로 이동" 
                      style="width:25px;height:25px;cursor:pointer;vertical-align: middle;" >
                     		</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url var="after" value="adminproduct_list">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${after}"><img src="resources/img/arrow_right.png" style="width:25px;height:25px;vertical-align: middle;"></a>
				</c:if>
        </div>
        <br><br>
        <div>
              <button class="mdl-button mdl-js-button mdl-button--raised" onclick="location.href='adminproduct_Insert'">
                새 상품 추가
              </button>
        </div>
        <Br>
    </div>

    <footer class="py-5 bg-dark">
        <div class="footContainer">
            <p class=""></p>
        </div>
    </footer>

    <script> $('.carousel').carousel({ interval: 2000 }) 
    </script>


</body>

</html>