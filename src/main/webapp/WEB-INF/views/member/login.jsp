<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>    
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
    <!-- 헤더부분-->
    <%@include file="../common/header.jsp" %>
    
    <!--로그인 부분-->
    <div id="login_full">
        <h2>로그인</h2><br>
        <form action="login.do" method="post">
        <div id="login_write" style="margin-bottom : 100px;"> 
            <input type="text" name="MEM_ID" class="input" placeholder="    아이디를 입력해주세요"><br><br>
            <input type="password" name="MEM_PWD" class="input" placeholder="    비밀번호를 입력해주세요"><br><br>
            <span id="find">
                <button id="idfind" onclick="location.href='idfind'" >아이디 찾기</button> |
                <button id="pwdfind" onclick="location.href='pwdfind'">비밀번호 찾기</button>
            </span><br><br>
            <button id="loginbtn" onclick="location.href='home.do'">로그인</button><br><br>
            <button id="joinbtn" onclick="location.href='regist'">회원가입</button>
        </div>
        </form>  
    </div>
</body>
</html>