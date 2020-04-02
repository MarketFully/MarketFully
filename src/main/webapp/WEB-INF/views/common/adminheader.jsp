<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/header.css">
<title>Insert title here</title>
</head>
<body>
<div id="header">
        <div id="userMenu">
            <ul class="list_menu">
                <li class="menu_join" style="cursor: pointer;" onclick="location.href='home.do'">사용자 화면으로</li>
            </ul>
        </div>

        <div class="headerLogo">
            <img src="resources/img/logo.jpg" onclick="location.href='adminmain'">
        </div>

        <div class="category">
            <div class="c_menu">
                <div class="menulist">
                    <div class="list">
                        <ul class="listName">
                            <li class="C1"><a href="adminmain"> 판매량 조회 </a>
                               
                            </li>
                             <span class="bar"> | </span>
                                    <li class="C2" style="cursor: pointer;" onclick="location.href='admincategory'">카테고리 관리</li>
                                    <span class="bar"> | </span>
                                    <li class="C3" style="cursor: pointer;"  onclick="location.href='adminmodify_user'">사용자 관리</li>
                                    <span class="bar"> | </span>
                                    <li class="C4" style="cursor: pointer;" onclick="location.href='adminrecipe_user'">사용자 레시피</li>
                                    <span class="bar"> | </span>
                                    <li class="C5" style="cursor: pointer;" onclick="location.href='adminrecipe_tv'">TV속 레시피</li>
                                    <span class="bar"> | </span>
                                    <li class="C6" style="cursor: pointer;" onclick="location.href='adminServiceCenter'">고객센터</li>
                                    <span class="bar"> | </span>
                                    <li class="C6" style="cursor: pointer;" onclick="location.href='adminproduct_list'">상품관리</li>
                        </ul>
                        <hr class="cate_hr">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>