<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
       <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/join.css">
    <link rel="stylesheet" href="resources/css/informationchange.css">
    <!-- 이미지 슬라이드  -->
     <!-- Bootstrap core CSS -->
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/bootstrap.bundle.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="resources/css/mainpage.css">
    <title>mainpage</title>
</head>
<body>
<form action="adminupdateuser">

   <table class="tbl">
   <tr>
      <td class="td1">회원번호*</td>         
                    <td class="td2"><input type="text" name="mem_num" class="input" value="${ m.mem_num }" style="padding: 0 9px; width: 280px; border: 1px solid #d4d4d4; color: #d4d4d4;" readonly></td>
                    <td class="td3"></td>
   </tr>
                <tr>
                    <td class="td1">아이디*</td>         
                    <td class="td2"><input type="text" name="mem_id" class="input" value="${ m.mem_id }" style="padding: 0 9px; width: 280px; border: 1px solid #d4d4d4; color: #d4d4d4;" readonly></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                
                </tr>
                 <tr>
                    <td class="td1">새 비밀번호</td>
                    <td class="td2"><input type="password" name="mem_pwd" id="MEM_PWD" class="input" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3"></td>
                </tr>

                <tr>
                    <td class="td1">이름</td>
                    <td class="td2"><input type="text" name="mem_name" class="input" value="${ m.mem_name }" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">이메일</td>
                    <td class="td2"><input type="text" name="mem_email" class="input" value="${ m.mem_email }" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">휴대폰</td>
                    <td class="td2"><input type="text" name="mem_phone" class="input" value="${ m.mem_phone }" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">사용여부</td>
                    <td class="td2">
                    <select name="mem_status">
                    <c:if test='${m.mem_status.equals("Y")}'>
                    	<option value="Y" selected> Y </option>
                    	<option value="N"> N </option>
                    	</c:if>                  	
                        <c:if test='${m.mem_status.equals("N")}'>
                    	<option value="Y"> Y </option>
                    	<option value="N" selected> N </option>
                    	</c:if>
                    </select>
					</td>
                    <td class="td3"></td>
                    </tr>
            </table>
            <button id="emailbtn" class="btn">회원정보 수정하기</button>
</form>
    
</body>
</html>