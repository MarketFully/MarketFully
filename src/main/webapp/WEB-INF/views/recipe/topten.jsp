<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>tab example</title>
	<style>
		#topRecipe {
			width:1100px;
			margin:0 auto;
            /* text-align:center; */
            margin-bottom: 100px;
		}
		.tab {
			list-style: none;
			margin: 0;
			padding: 0;
            overflow: hidden;
		}
		/* Float the list items side by side */
		.tab li {
			float: left;
		}
		/* Style the links inside the list items */
		.tab li a {
			display: inline-block;
			color: #000;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 17px;
			transition:0.3s;
		}
		/* Style the tab content */
		.toptenTab {
			display: none;
			background-color :#fff;
			padding: 6px 12px;
			color:#000;
		}
		.toptenTab.current {
			display: block;
        }
        

	</style>
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/toptenrecipe.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->
</head>
<body>
    <!-- header-->
   <%@include file="../common/header.jsp" %>
    <!-- header end-->

    <!-- top10 메뉴 타이틀 end-->
    <div class="topTenRecipe">
        <div class="TOP">
            <div class="TOP10" style="width: 1100px; display: flex; margin: 0 auto;">
                <div class="topImgdiv"><img src="resources/img/winner.png" class="topImg"></div>
                <div class="Ttitle"><h4>TOP10 레시피</h4></div>
            </div>
        </div>
    </div>
    <!-- top10 메뉴 타이틀 end-->


	<div id="topRecipe">
        <div class="TopMenu">
		<ul class="tab" style="margin-top: 30px;">
			<li class="current" data-tab="tab1"><a href="TvRecipetopten">TV 속 레시피</a></li>
			<li data-tab="tab2"><a href="UserRecipetopten">사용자 레시피</a></li>
		</ul>
        </div>
		<div id="tab1" class="toptenTab current">
			<table class="recipe" id="tv_recipe">
                <thead>
                    <tr>
                        <th class="col">순위</th>
                        <th class="colT">제목</th>
                        <th class="col">작성자</th>
                        <th class="col">작성일</th>
                        <th class="col">조회수</th>
                    </tr>
                </thead>
                <c:set var="i" value="1"/>
                <c:forEach var="b" items="${ list }">
                <tbody class="item">
                    <tr>
                        <td>${i }</td>
                        <c:url var="bdetail" value="RecipeDetail">
							<c:param name="bId" value="${ b.mb_num }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
							<c:param name="TvOrUser" value="${ TvOrUser }"/>
						</c:url>
                    	<td class="menu">
                    	<c:if test="${ TvOrUser eq 'tv' }">
                    		<img src="resources/img/tvRecipe/${b.getMb_rename() }" class="mimg">
                    	</c:if>
                    	<c:if test="${ TvOrUser eq 'user' }">
                    		<img src="resources/img/userRecipe/${b.getMb_rename() }" class="mimg">
                    	</c:if>		
                    			<p class="mtitle">
                    				<a href="${ bdetail }">${ b.mb_title }</a> 
                    			</p>
                    	</td>
                        <td>${ b.mb_writer }</td>
                        <td>${ b.mb_cdate }</td>
                        <td>${ b.mb_count}</td>
                    </tr>
                 </tbody>
                 <c:set var="i" value="${i+1 }"></c:set>
                 </c:forEach>                                                                
            </table>
		</div>

<%-- 		<div id="tab2" class="toptenTab">
			<table class="recipe" id="tv_recipe">
                <thead>
                    <tr>
                        <th class="col">순위</th>
                        <th class="colT">제목</th>
                        <th class="col">작성자</th>
                        <th class="col">작성일</th>
                        <th class="col">조회수</th>
                    </tr>
                </thead>
                <c:forEach var="b" items="${ list }">
                <tbody class="item">
                    <tr onclick="location.href='RecipeDetail'">
                        <td>${ b.mb_num }</td>
                        <c:url var="bdetail" value="RecipeDetail">
							<c:param name="bId" value="${ b.mb_num }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
						</c:url>
                    	<td class="menu"><img src="resources/img/menu1.png" class="mimg"><p class="mtitle"><a href="${ bdetail }">${ b.MB_TITLE }</a> </p></td>
                        <td>${ b.MB_WRITER }</td>
                        <td>${ b.MB_CDATE }</td>
                        <td>${ b.MB_COUNT }</td>
                    </tr>
                </tbody>
                </c:forEach>
            </table>
        </div> --%>
        


	</div>
    <!--top 10 레시피 end-->

    <!-- 탭 메뉴 스크립트-->
	<script>
 		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.toptenTab').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});  
	</script>
	 <footer><!--class="py-5 bg-dark"-->
        <!-- <img src="resources/img/footer_test.jpg" style="margin-top: 150px;"> -->
        <div style="display: inline-flex; margin-top: 200px;height: 200px;">
         
            <div class="footer_info">
                <p class="f_if">법인명(상호) : 주식회사 마켓풀리</p>
                <p class="f_if">사용자 등록 번호 : 111-11-11111</p>
                <p class="f_if">주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</p>
                <p class="f_if">팩스 : 000-0000-0000</p>
                <p class="f_if">이메일 : marcketfully@marcket.com</p>
            </div>
        </div>
        <img src="resources/img/footer1.jpg">
        <div class="footContainer">
            <p class=""></p>
        </div>
    </footer>
</body>
</html>