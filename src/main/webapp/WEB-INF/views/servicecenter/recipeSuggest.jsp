<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/myPage.css"> <!-- 나중에 정리해서 삭제 -->
    <link rel="stylesheet" href="resources/css/recipesuggest.css">
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
                        <li >
                            <a href="ServiceCenter">공지사항</a>
                        </li>
                        <li>
                            <a href="QNA">문의</a>
                        </li>
                        <li class="on">
                            <a href="recipeSuggest">레시피 제안</a>
                        </li>
                    </ul>
                </div>
        </div>

    <!--QNA tab end-->

    <!-- QNA 내용-->
    <div id="viewNotice" class="viewNotice">
        <div class="head_aticle">
            <h2 class="tit">레시피 제안</h2>
        </div>

        <!-- 레시피 제안 코멘트 -->
        <div>
            <ul style="font-size: 0.85em; margin-bottom: 20px;">
                <li> ▶ 필요한 레시피나 알고싶은 레시피를 마켓풀리에 제안해주세요.</li>
                <li> ▶ 고객님의 의견을 빠르게 반영하여 더욱 편리한 마켓풀리가 되겠습니다.</li>
                <li> ▶ 담당 MD가 제안해주신 의견은 실시간으로 모니터링할 예정이나, 별도 답변 안내는 되지 않음을 양해부탁드립니다.</li>
            </ul>
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
                            <th class="col">추천수</th>
                        </tr>
                    </thead>
                    
                    <c:forEach var="r" items="${ RSlist }">
                    <tbody class="item">
                        <tr>
                            <td>${ r.rb_num }</td>
                            <td>${ r.rb_foodcategory }</td>
                            <c:url var="recipewritedetail" value="suggestwriteDetail">
								<c:param name="rb_num" value="${r.rb_num}"/>
							</c:url>
                            <td class="tdtext" style="padding-left: 30px;" onclick="location.href='${recipewritedetail}'">${ r.rb_title }</td>
                            <td>${ r.rb_writer }</td>
                            <td>${ r.rb_date }</td>
                            <td>${ r.rb_count }</td>
                            <td>${ r.rb_thank }</td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
<!-- 
                <fieldset>
                    <input type="text" class="sbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" id="keyword">
                    <button type="submit" class="btn_srch">검색</a>
                </fieldset> -->

				<!-- 페이징 처리 -->
                <div class="pagination">
                
                	<!-- 이전 -->
                	<c:if test="${ rpi.currentPage eq 1}">
                		<img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img" style="width:25px;height:25px; cursor:pointer;vertical-align: middle;">
                	</c:if>
                		<c:if test="${ rpi.currentPage ne 1 }">
                			<c:url var="before" value="recipeSuggest">
                				<c:param name="currentPage" value="${ rpi.currentPage -1 }"/>
                			</c:url>
                			<a href="${before}"><img src="resources/img/arrow_left.png" style="width:25px;height:25px;vertical-align: middle;"></a>
                		</c:if>
                	
                	<!-- 페이지 -->
					<c:forEach var="p" begin="${ rpi.startPage }" end="${ rpi.endPage }">
					<c:if test="${ p eq rpi.currentPage }">
						<font color="#2e8b57" size="4"><b>${ p }</b></font>
					</c:if>
							
					<c:if test="${ p ne rpi.currentPage }">
						<c:url var="pagination" value="recipeSuggest">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
		        	
		        	<!-- 다음   -->
		        	<c:if test="${ rpi.currentPage eq rpi.maxPage }"> 
		        		<img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img" style="width:25px;height:25px;cursor:pointer;vertical-align: middle;" >
		        	</c:if>
		        		<c:if test="${ rpi.currentPage ne rpi.maxPage }">
		        			<c:url var="after" value="recipeSuggest">
		        				<c:param name="currentPage" value="${ rpi.currentPage + 1 }"/>
		        			</c:url>
		        			<a href="${after}"><img src="resources/img/arrow_right.png" style="width:25px;height:25px;vertical-align: middle;"></a>
		        		</c:if>
                </div>  
            </div>
            
                <!-- 글쓰기 버튼-->
                <c:if test="${ !empty sessionScope.loginUser }">
                <div>
                    <input type="submit" value="글작성" class="write_btn" onclick="location.href='suggestwrite'">
                </div>
                </c:if>
        </div>
    </div>
   <!-- QNA 내용 끝-->
</div>
<!-- QNA 끝-->

</body> 
</html>