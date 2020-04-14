<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>passwordfind</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/pwdfind.css">
</head>
<body>
      <!-- 헤더부분-->
      <%@include file="../common/header.jsp" %>

    <!-- 비밀번호 찾기 부분-->
    <div id="pwdfind_main" style="margin-top:200px;">
<!--         <h2 style="margin-bottom:50px;">비밀번호 찾기</h2> -->
        <div id="pwdfind">
            <div>
            	<p style="margin-bottom: 80px;"><h3 style="margin-bottom:100px;">임시 비밀번호 발급이 완료되었습니다. 이메일을 확인해주세요.</h3></p>
            	<a href="login" style="text-decoration:none;color:#2e8b57;">로그인 화면으로 이동</a>
			</div>
        </div>
    </div>
</body>
</html>