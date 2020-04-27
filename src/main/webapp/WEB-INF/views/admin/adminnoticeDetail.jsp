<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/noticeDetail.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <title>Document</title>
</head>
<body>
    <!--header-->
    <%@include file="../common/adminheader.jsp" %>
    <!-- header end-->

    <!-- 공지사항 -->
    <div class="main">
        <div class="content">
            <div class="notice">
                <div class="noticeSection">
                    <div class="notice_head">
                        <h2>공지사항</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 공지사항 end-->

    <!-- 공지사항 내용-->
    <div class="nt_content">
        <div class="nt_detail">
            <table width="100%" style="font-size: 14px; border-bottom: 2px solid #2e8b57;">
                <tbody>
                    <tr>
                        <td>
                            <table style="width: 100%;" class="nt_detail_tb">
                                <tbody>
                                    <tr>
                                        <th scope="row" style="border:none;">제목</th>
                                        <td style="text-align: start; padding-left: 40px;">${snb.notice_title}</th>
                                    </tr>
                                    <tr>
                                        <th scope="row">작성자</th>
                                        <td style="text-align: start; padding-left: 40px;">운영자</td>
                                    </tr>
                                    <tr class="ntArea">
                                        <td colspan="2">
                                            <ul>
                                                <li class="date">
                                                    <strong class="th">작성일</strong>   
                                                    <span class="td" style="text-align: start; padding-left: 40px;">${snb.notice_cdate }</span>
                                                </li>
                                                <li class="hit">
                                                    <strong class="th">조회수</strong>
                                                    <span class="td" style="text-align: start; padding-left: 20px;">${snb.notice_count}</span>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                 </tbody>
                            </table>
                        </td>
                    </tr>
                    <!-- 공지사항 detail 제목 , 작성일 , 작성자 등등 end-->
                    <!-- 공지사항 detail 내용 -->
                    <tr>
                        <td>
                            <div class="detail">
								${snb.notice_content }
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
           <input type="button" value="목록" class="btn" onclick="location.href='adminServiceCenter'">
        </div>
    </div>
    <!-- end -->

</body> 
</html>