<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/myPage.css"> <!-- 나중에 정리해서 삭제 -->
    <link rel="stylesheet" href="resources/css/QNA_write.css">
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
                        <li  class="on">
                            <a href="adminnotice">공지사항</a>
                        </li>
                        <li>
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
    <form action="adminnoticeinsert" method="POST">
    <div id="viewNotice" class="viewNotice">
        <div class="head_aticle">
            <h2 class="tit">공지사항</h2>
        </div>
        <div class="Ncontent">
            <div class="Ncontent_div">
                <table>
                    <tbody class="qwrite">
                        <tr>
                            <td>제목</td>
                            <td><input type="text" class="inputcss" name="notice_title"></td>
                        </tr>
                        <tr>
                        	<td>작성자</td>
                        	<td><input type="text" class="inputcss" name="notice_writer" value="${ loginUser.mem_id }"></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="notice_content"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
                <!-- 글쓰기 버튼-->
                <div>
                    <!-- <input type="submit" value="저장" class="write_btn" onclick="location.href='QNAinsert'"> --> 
                    <button class="write_btn">저장</button>
                </div>
        </div>
    </div>
    </form>
   <!-- QNA 내용 끝-->
</div>
<!-- QNA 끝-->

</body> 
</html>
