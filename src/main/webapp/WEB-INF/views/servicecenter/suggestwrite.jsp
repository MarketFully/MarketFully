<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/myPage.css"> <!-- 나중에 정리해서 삭제 -->
    <link rel="stylesheet" href="resources/css/suggestwrite.css">
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
                            <a href="notice.html">공지사항</a>
                        </li>
                        <li>
                            <a href="QNA.html">문의</a>
                        </li>
                        <li class="on">
                            <a href="recipeSuggest.html">레시피 제안</a>
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
                <li> ▶ 고객님의 의견을 빠르게 반영하여 더욱 편리하 마켓풀리가 되겠습니다.</li>
                <li> ▶ 담당 MD가 제안해주신 의견은 실시간으로 모니터링할 예정이나, 별도 답변 안내는 되지 않음을 양해부탁드립니다.</li>
            </ul>
        </div>

        <div class="Ncontent">
            <div class="Ncontent_div">
                <table>
                    <tbody class="Rwrite">
                        <tr>
                            <td>제목</td>
                            <td><input type="text" class="inputcss"></td>
                        </tr>
                        <tr>
                            <td>카테고리</td>
                            <td>
                                <select>
                                    <option value="한식">한식</option>
                                    <option value="양식">양식</option>
                                    <option value="일식">일식</option>
                                    <option value="중식">중식</option>
                                    <option value="기타">기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>문의내용</td>
                            <td>
                                <textarea></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td><input type="file" style="font-family: MapoPeacefull;"></td>
                        </tr>
                    </tbody>
                </table>
                    
                    


                
            </div>
                <!-- 글쓰기 버튼-->
                <div>
                    <input type="submit" value="저장" class="write_btn" onclick="location.href='suggestwriteDetail'">
                </div>
        </div>
    </div>
   <!-- QNA 내용 끝-->
</div>
<!-- QNA 끝-->

</body> 
</html>