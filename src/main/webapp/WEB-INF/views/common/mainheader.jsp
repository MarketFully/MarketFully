<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/header.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<script>
var maincatelist = new Array();
			$(function(){
				$.ajax({
					url:"adminmaincategory",
					dataType:"json",
					success:function(data){
						maincatelist=data;
						for(var i = 0 ; i < maincatelist.length;i++){
						document.getElementById("ProductCategory").innerHTML+='<li><a href="Productchoosecate?catenum='+maincatelist[i].catecode1+'&maincatename='+maincatelist[i].catename1+'">'+
						'<img class="food" src="resources/img/categoryuploadimg/'+maincatelist[i].renamefilename+'">'+maincatelist[i].catename1+'</a></li>';
						
						}
						
						console.log(maincatelist);
						
					},error:function(request, status, errorData){
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText
								+ "error : " + errorData);
					}
				});
			});
</script>
<div id="header">
        <div id="userMenu">
            <ul class="list_menu">
            	<c:if test="${ empty sessionScope.loginUser }">
                	<li class="menu_join" style="cursor: pointer;" onclick="location.href='regist'">
                		회원가입
                	</li>
                </c:if>
                <c:if test="${ empty sessionScope.loginUser }">
                	<li class="menu_login" style="cursor: pointer;" onclick="location.href='login'">로그인</li>
                </c:if>
                <c:if test="${ !empty sessionScope.loginUser }">
                	<li class="menu_login"><c:out value="${ loginUser.mem_name }님 환영합니다!" /> </li>
                </c:if>
                <li class="menu_login" style="cursor: pointer;" onclick="location.href='adminmain'">관리자</li> 
                <li class="menu_login" style="cursor: pointer;" onclick="location.href='basket'">장바구니</li> 
                <c:if test="${ !empty sessionScope.loginUser }">
                <li class="menu_login" style="cursor: pointer;" onclick="location.href='myorderlist.bo?mem_num=${loginUser.mem_num}'">마이페이지</li>
                </c:if>
                <c:if test="${ !empty sessionScope.loginUser }">
                	<c:url var="logout" value="logout.do"/>
                	<li class="menu_login" style="cursor: pointer;" onclick="location.href='${logout}'">로그아웃</li>
                </c:if>
            </ul>
        </div>

        <div class="headerLogo">
            <img src="resources/img/logo.jpg" onclick="location.href='home.do'">
        </div>

        <div class="category">
            <div class="c_menu">
                <div class="menulist">
                    <div class="list">
                        <ul class="listName">
                            <li class="C1"><a href="ProductMain"><span><img class="listImg" src="resources/img/list.png"></span>전체 카테고리</a>
                                <ul class="All" id="ProductCategory">
                                           </ul>
                            </li>
                             <span class="bar"> | </span>
                                    <li style="cursor: pointer;" class="C2" onclick="location.href='TvRecipetopten'">TOP 10 레시피</li>
                                    <span class="bar"> | </span>
                                    <li style="cursor: pointer;" class="C3" onclick="location.href='tvCateList'">TV  속 레시피</li>
                                    <span class="bar"> | </span>
                                    <li style="cursor: pointer;" class="C4" onclick="location.href='RecipeUser'">사용자 레시피</li>
                                    <span class="bar"> | </span>
                                    <li style="cursor: pointer;" class="C6" onclick="location.href='ServiceCenter'">고객센터</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>