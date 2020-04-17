<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <%@include file="../common/header.jsp" %>
    <!-- header end-->

    <!-- 공지사항 -->

    <!-- QNA 왼쪽 tab-->
    <div class="noticeList noticetype">
        <div id="sub" class="sub_No">
            <h2 class="Ntitle">고객센터</h2>
                <div class="inner_sub">
                    <ul class="list_menu_left">
                        <li>
                            <a href="ServiceCenter">공지사항</a>
                        </li>
                        <li class="on">
                            <a href="QNA">문의</a>
                        </li>
                        <li>
                            <a href="recipeSuggest">레시피 제안</a>
                        </li>
                    </ul>
                </div>
        </div>

    <!--QNA tab end-->

    <!-- QNA 내용-->
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
                            <td>${ b.q_CATEGORY }</td>
                            <td class="tdtext" style="padding-left: 30px;" onclick="location.href='QNAdetail'">${ b.q_TITLE }</td>
                            <td>${ b.q_WRITER }</td>
                            <td>${ b.q_CDATE }</td>
                            <td>${ b.q_RCOUNT }</td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
                

                <fieldset>
                    <input type="text" class="sbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" id="keyword">
                    <button type="submit" class="btn_srch">검색</a>
                </fieldset>
                    <!-- 페이징 처리 -->
    <div class="pagination">
            
<!--         <img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img">
        <span class="pagenum_currentpage">1</span>
        <span class="pagenum">2</span>
        <span class="pagenum">3</span>
        <span class="pagenum">4</span>
        <span class="pagenum">5</span> 
        <img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img"> -->
        
        <!-- 이전 -->
        <c:if test="${ pi.currentPage eq 1 }">
				[이전] &nbsp;
		</c:if>
			<c:if test="${ pi.currentPage ne 1 }">
				<c:url var="before" value="RecipeUser">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
		</c:if>
		
		<!-- 페이지 -->
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<font color="red" size="4"><b>${ p }</b></font>
			</c:if>
					
			<c:if test="${ p ne pi.currentPage }">
				<c:url var="pagination" value="RecipeUser">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
		
		<!-- [다음] -->
			<c:if test="${ pi.currentPage eq pi.maxPage }">
					[다음]
			</c:if>
			<c:if test="${ pi.currentPage ne pi.maxPage }">
				<c:url var="after" value="RecipeUser">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
				</c:url> 
				<a href="${ after }">[다음]</a>
			</c:if>    

        <!-- <a href="javascript:;"><img src="images/next.png" alt="다음 페이지로 이동"  class="nextpage_img"></a>
        <a href="javascript:;"><img src="images/doublenext.png" alt="마지막 페이지로 이동" class="lastpage_img"></a> -->
    </div> 
    <!-- 페이징처리 end-->

                <ul class="pagination"></ul>  
            </div>
                <!-- 글쓰기 버튼-->
                <div>
                    <input type="submit" value="글작성" class="write_btn" onclick="location.href='QNAwrite'"> 
                </div>
        </div>
    </div>
   <!-- QNA 내용 끝-->
   
</div>
<!-- QNA 끝-->

</body> 
</html>