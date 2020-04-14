<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 -->
	<%@include file="../common/header.jsp" %>
	    
	<div style="margin-bottom:150px;margin-top:50px;">
<!-- 		<a><img src="resources/img/logo.jpg" style="height: 80px; margin-left: 10px;" /></a> <br> -->
		<br>
		<h3>안녕하세요,&nbsp;${ loginUser.MEM_ID } 님</h3>
		<br>
		<p>환영합니다!</p>
		<br>
		<p>회원가입 시 이메일 인증이 실패하였습니다. </p>
		<br>
		<p>이메일 인증을 하셔야  홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<p>이메일 주소를 다시 한 번 확인하여주세요!</p>
		<br><a href="${pageContext.request.contextPath}/rsinsert.do?MEM_ID=${ loginUser.MEM_ID }&MEM_EMAIL=${loginUser.MEM_EMAIL}">이메일 재인증</a>
	</div>
</body>
</html>