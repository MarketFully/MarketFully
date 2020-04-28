<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>idfind</title>   
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/idfind.css">
</head>
<body>
      <!-- 헤더부분-->
      <%@include file="../common/header.jsp" %>

    <!-- 비밀번호 찾기 부분-->
    <div id="loginfind_full" style="max-width:450px;">
    	<fieldset style="border:1.5px solid #2e8b57; margin-bottom: 40px;">
        	<legend><h2>비밀번호 찾기</h2></legend>
        		<div id="loginfind_write" style="max-width:450px;">
            		<div>
            			<p style="margin-bottom: 30px;">존재하지 않는 회원입니다.</p>
            		</div>
        		</div>
        </fieldset>
            <button id="okbtn"  onclick="location.href='regist'" style="width:100px; height:30px">회원가입</button>&nbsp;&nbsp;
    </div>
</body>
</html>