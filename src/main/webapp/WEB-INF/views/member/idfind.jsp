<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div id="loginfind_full">
        <h2>아이디 찾기</h2>
        <form action="idfind.do"  method="post">
        <div id="loginfind_write">
            <label>이름</label><br>
            <input type="text" name="MEM_NAME" class="input" placeholder="    이름을 입력해주세요"><br><br> 
            <label>이메일</label><br>
            <input type="text" name="MEM_EMAIL" class="input" placeholder="    이메일을 입력해주세요"><br><br><br>
            <button id="okbtn" onclick="">확인</button><br><br>
        </div>
        </form>
    </div>
</body>
</html>