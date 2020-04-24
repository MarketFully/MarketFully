<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.market.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/myPage.css"> <!-- 나중에 정리해서 삭제 -->
    <link rel="stylesheet" href="resources/css/QNAdetail.css">
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
            <h2 class="tit">문의</h2>
        </div>

        <div class="Ncontent">
            <div class="Ncontent_div">
                <table>
                    <tbody class="qwrite">
                        <tr>
                            <td>제목</td>
                            <td>${ b.q_TITLE }</td>
                        </tr>
                        <tr>
                        	<td>작성자</td>
                        	<td>${b.q_WRITER}</td>
                        </tr>
                        <tr>
                            <td>문의종류</td>
                            <td>
                                ${ b.q_CATEGORY }
                            </td>
                        </tr>
                        <tr>
                            <td>주문번호</td>
                            <td>${ b.oR_NUM }</td>
                        </tr>
                        <tr>
                            <td>문의내용</td>
                            <td>
                                <textarea readonly>${ b.q_CONTENT }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td>
                               <c:if test="${!empty b.q_FILE }">
                            		<a href="${contextPath}/resources/qnauploadFiles/${b.q_REFILE}" 
                            		download="${b.q_FILE }">${b.q_FILE}</a>
                            	</c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
                <!-- 글쓰기 버튼-->
                <div>
                	<c:url  var="QNAwriteUpdate" value="QNAwriteUpdate">
                		<c:param name="q_num" value="${b.q_NUM }"/>
                	</c:url>
                    <input type="submit" value="수정" class="write_btn" style="margin-left: 10px;" onclick="location.href='${QNAwriteUpdate}'">
                    
                        <c:url var="QNAdelete" value="QNAdelete">
                    		<c:param name="q_num" value="${b.q_NUM}"/>
                    	</c:url>
                    <input type="button" value="삭제" class="write_btn" onclick="location.href='${QNAdelete}'">
                </div>
        </div>
        <div>
            <div><p style="border-bottom: 2px solid #2e8b57; font-size: 20px;"><strong>댓글</strong></p></div>
            <div class="re" style="margin-top: 30px;">
                <textarea></textarea>
                <input type="submit" value="등록" class="re_btn">
            </div>
        </div>
    </div>
    
   <!-- QNA 내용 끝-->
</div>

<!-- QNA 끝-->



</body> 
</html>