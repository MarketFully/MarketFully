<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 이미지 슬라이드  -->
     <!-- Bootstrap core CSS -->
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/header.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <title>mainpage</title>
</head>
<body>
    <div class="full">
        <div class="container">
            <!-- header -->
            <div id="header">
                <div id="userMenu">
                    <ul class="list_menu">
                        <li class="menu_join">회원가입</li>
                        <li class="menu_login">로그인</li>
                    </ul>
                </div>

                <div class="headerLogo">
                    <img src="resources/img/logo.png">
                </div>

                <div class="category">
                    <div class="c_menu">
                        <div class="menulist">
                            <div class="list">
                                <ul class="listName">
                                    <li class="C1"><a href="#"><span><img class="listImg" src="resources/img/list.png"></span>전체카테고리</a>
                                        <ul class="All" id="header">
                                        <c:forEach var="l" items="${ maincatearr}">
                                        <li> <a href="#">${l }</a></li>
                                        </c:forEach>
                                        </ul>
                                    </li>
                                    <span class="bar"> | </span>
                                    <li class="C2">TOP 10 레시피</li>
                                    <span class="bar"> | </span>
                                    <li class="C3">TV 속 레시피</li>
                                    <span class="bar"> | </span>
                                    <li class="C4">사용자 레시피</li>
                                    <span class="bar"> | </span>
                                    <li class="C5">고객센터</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- 이미지 슬라이드 -->
        

	</div>
    </div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


    
</body>
</html>