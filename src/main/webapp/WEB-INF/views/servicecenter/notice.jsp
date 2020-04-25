<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/notice.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <title>Document</title>
</head>
<body>
    <!--header-->
   <%@include file="../common/header.jsp" %>
    <!-- header end-->

    <!-- 공지사항 -->

    <!-- 공지사항 왼쪽 tab-->
    <div class="noticeList noticetype">
        <div id="sub" class="sub_No">
            <h2 class="Ntitle">고객센터</h2>
                <div class="inner_sub">
                    <ul class="list_menu_left">
                        <li class="on">
                            <a href="ServiceCenter">공지사항</a>
                        </li>
                        <li>
                            <a href="QNA">문의</a>
                        </li>
                        <li>
                            <a href="recipeSuggest">레시피 제안</a>
                        </li>
                    </ul>
                </div>
        </div>

    <!--공지사항 tab end-->

    <!-- 공지사항 내용-->
    <div id="viewNotice" class="viewNotice">
        <div class="head_aticle">
            <h2 class="tit">공지사항</h2>
        </div>

        <div class="Ncontent">
            <div class="Ncontent_div">
                <table class="table" id="user_table">
                    <thead>
                        <tr>
                            <th class="col">번호</th>
                            <th class="colT">제목</th>
                            <th class="col">작성자</th>
                            <th class="col">작성일</th>
                            <th class="col">조회수</th>
                        </tr>
                    </thead>
                    <c:forEach var="b" items="${ list }">
                    <tbody class="item">
                        <tr>
                            <td>${ b.notice_num }</td>
                            <td class="tdtext" style="padding-left: 30px;" onclick="location.href='noticeDetail?notice_num=${b.notice_num}'">${ b.notice_title }</td>
                            <td>${ b.notice_writer }</td>
                            <td>${ b.notice_cdate }</td>
                            <td>${ b.notice_count }</td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>

                <c:if test="${list.size() == 0 }">
					<img src="resources/img/edit.jpg" style="margin-top:30px;">
				</c:if> 
            </div>
                <!-- 페이징 처리 -->
    			<div class="pagination" style="text-align:center;">
            
        
		        <!-- 이전 -->
		        <c:if test="${ pi.currentPage eq 1 }">
					<img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img" style="width:25px;height:25px; cursor:pointer;vertical-align: middle;">
				</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before" value="ServiceCenter">
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
						<c:url var="pagination" value="ServiceCenter">
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
							<c:url var="after" value="ServiceCenter">
								<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
							</c:url> 
							<a href="${after}"><img src="resources/img/arrow_right.png" style="width:25px;height:25px;vertical-align: middle;"></a>
						</c:if>    
			
			    </div> 
			    
			    <!-- 페이징처리 end--> 
        </div>
    </div>
   <!-- 공지사항 내용 끝-->
</div>
<!-- 공지사항 끝-->

</body> 
</html>