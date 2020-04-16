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