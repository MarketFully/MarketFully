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

    <!-- 아이디 찾기 부분-->
    <div id="loginfind_full" style="max-width:450px;">
    	<fieldset style="border:1.5px solid #2e8b57; margin-bottom: 40px;">
        	<legend><h2>아이디 찾기</h2></legend>
        		<div id="loginfind_write" style="max-width:450px;">
            		<div>
            			<p style="margin-bottom: 30px;">회원님의 아이디는   ${ idfind.mem_id } 입니다.</p>
            		</div>
        		</div>
        </fieldset>
            <button id="okbtn" onclick="" style="width:100px; height:30px">로그인하기</button>&nbsp;&nbsp;
            <button id="okbtn" onclick="" style="width:100px; height:30px">비밀번호 찾기</button><br><br>
    </div>
</body>
</html>