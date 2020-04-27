<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/myPage.css"> <!-- 나중에 정리해서 삭제 -->
    <link rel="stylesheet" href="resources/css/notice.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <title>Document</title>
</head>
<body>
    <!--header-->
    <%@include file="../common/adminheader.jsp" %>
    <!-- header end-->
    <!-- 공지사항 -->

    <!-- QNA 왼쪽 tab-->
    <div class="noticeList noticetype">
        <div id="sub" class="sub_No">
            <h2 class="Ntitle">고객센터</h2>
                <div class="inner_sub">
                    <ul class="list_menu_left">
                        <li>
                            <a href="adminServiceCenter">공지사항</a>
                        </li>
                        <li class="on">
                            <a href="adminqna">문의</a>
                        </li>
                        <li>
                            <a href="adminrecipeSuggest">레시피 제안</a>
                        </li>
                    </ul>
                </div>
        </div>

    <!--QNA tab end-->

    <!-- QNA 내용-->
<!--     <form action="QNA"  method="post" id="search"> -->
    <div id="viewNotice" class="viewNotice">
        <div class="head_aticle">
            <h2 class="tit" >문의</h2>
        </div>

        <div class="Ncontent">
            <div class="Ncontent_div">
                <table class="table" id="user_table">
                    <thead>
                        <tr>
                            <th class="col">번호</th>
                            <th class="col">카테고리</th>
                            <th class="colT">제목</th>
                            <th class="col">작성자</th>
                            <th class="col">작성일</th>
                            <th class="col">조회수</th>
                        </tr>
                    </thead>

                    <c:forEach var="b" items="${ list }">
                    <tbody class="item">
                        <tr>
                            <td>${ b.q_NUM }</td>
                        <c:url var="bdetail" value="adminqnadetail">
							<c:param name="bId" value="${ b.q_NUM }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
						</c:url>
                            <td>${ b.q_CATEGORY }</td>
                            <td class="tdtext" style="padding-left: 30px;"><a href="${ bdetail }">${ b.q_TITLE }</a> </td>
                            <td>${ b.q_WRITER }</td>
                            <td>${ b.q_CDATE }</td>
                            <td>${ b.q_COUNT }</td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
                 
                <c:if test="${list.size() == 0 }">
					<img src="resources/img/edit.jpg" style="margin-top:30px;">
				</c:if> 
                
				<form action="QNASearch" method=POST>
				<div>
                <fieldset>
                	 <select style="height: 31px;  border: 1px solid #dcdcdc; border-radius: 5px; margin-right: 20px; font-family: MapoPeacefull;" name="q_searchType">
                        <option value="q_TITLE">제목</option>
                        <option value="q_WRITER">작성자</option>
                        <option value="q_CATEGORY">카테고리</option>
                    </select>
                    <input type="text" class="sbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" name="q_keyword">
                    <button type="submit" class="btn_srch" id="searchbtn">검색</button>
                </fieldset>
                </div>
                </form>
        <!-- 페이징 처리 -->
    	<div class="pagination">
            
        <!-- 이전 -->
        <c:if test="${ pi.currentPage eq 1 }">
				<img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img" style="width:25px;height:25px; cursor:pointer;vertical-align: middle;">
		</c:if>
			<c:if test="${ pi.currentPage ne 1 }">
				<c:url var="before" value="QNA">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${before}"><img src="resources/img/arrow_left.png" style="width:25px;height:25px;vertical-align: middle;"></a>
		</c:if>
		
		<!-- 페이지 -->
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<font color="#2e8b57" size="4"><b>${ p }</b></font>
			</c:if>
					
			<c:if test="${ p ne pi.currentPage }">
				<c:url var="pagination" value="QNA">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
		
		<!-- [다음] -->
			<c:if test="${ pi.currentPage eq pi.maxPage }">
				<img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img" style="width:25px;height:25px;cursor:pointer;vertical-align: middle;" >
			</c:if>
			<c:if test="${ pi.currentPage ne pi.maxPage }">
				<c:url var="after" value="QNA">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
				</c:url> 
				<a href="${after}"><img src="resources/img/arrow_right.png" style="width:25px;height:25px;vertical-align: middle;"></a>
			</c:if>    
    </div> 
    <!-- 페이징처리 end-->

            </div>
                <!-- 글쓰기 버튼-->
                <div>
                    <input type="submit" value="글작성" class="write_btn" onclick="location.href='QNAwrite'"> 
                </div>
        </div>
    </div>
<!--     </form> -->
   <!-- QNA 내용 끝-->
   
</div>
<!-- QNA 끝-->



</body> 
</html>