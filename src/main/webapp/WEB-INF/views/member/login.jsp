<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>    
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
    <!-- 헤더부분-->
    <%@include file="../common/header.jsp" %>
     <script>
		$(function(){
			$("#loginbtn").on("click",function(){
				$("#frm").attr("action","login.do").submit();
			});	
		
			$("#joinbtn").on("click",function(){
				$("#frm").attr("action","regist").submit();
			});	
			
			$("#idfind").on("click",function(){
				$("#frm").attr("action","idfind").submit();
			});	
			
			$("#pwdfind").on("click",function(){
				$("#frm").attr("action","pwdfind").submit();
			});	
		});   
    </script>
    
    <!--로그인 부분-->
    <div id="login_full">
        <h2>로그인</h2><br>
        <form id="frm" onsubmit="false" method="post">
        <div id="login_write" style="margin-bottom : 100px;"> 
            <input type="text" name="mem_id" class="input" placeholder="    아이디를 입력해주세요"><br><br>
            <input type="password" name="mem_pwd" class="input" placeholder="    비밀번호를 입력해주세요">
            
            <br><br>
            <button id="loginbtn" style="margin-top:20px;">로그인</button><br><br>
            <button id="joinbtn" >회원가입</button>
            <br><br>
            <span id="find">
                <button id="idfind" >아이디 찾기</button> |
                <button id="pwdfind" >비밀번호 찾기</button>
            </span>
        </div>
        </form>  
    </div>
</body>
</html>