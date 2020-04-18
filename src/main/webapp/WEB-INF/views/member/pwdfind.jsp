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
    <div id="pwdfind_full">
        <h2>비밀번호 찾기</h2>
       
       <form action="pwdfind.do" method="post">
        <div id="pwdfind_write">
            <label>이름</label><br>
            <input type="text" name="mem_name" class="input" placeholder="    이름을 입력해주세요"><br><br> 
            <label>아이디</label><br>
            <input type="text" name="mem_id" class="input" placeholder="    아이디를 입력해주세요"><br><br>
            <label>이메일</label><br>
            <input type="text" name="mem_email" class="input" placeholder="    이메일을 입력해주세요"><br><br>
            <button id="okbtn">확인</button><br><br>
        </div>
        </form>
    </div>
</body>
</html>