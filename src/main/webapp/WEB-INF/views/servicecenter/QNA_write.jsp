<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/myPage.css"> <!-- 나중에 정리해서 삭제 -->
    <link rel="stylesheet" href="css/QNA_write.css">
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
                        <li class="on">
                            <a href="QNA.html">문의</a>
                        </li>
                        <li>
                            <a href="recipeSuggest.html">레시피 제안</a>
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
                            <td><input type="text" class="inputcss"></td>
                        </tr>
                        <tr>
                            <td>문의종류</td>
                            <td>
                                <select>
                                    <option value="회원문의">회원문의</option>
                                    <option value="주문/결제">주문/결제</option>
                                    <option value="취소/교환/반품">취소/교환/반품</option>
                                    <option value="배송문의">배송문의</option>
                                    <option value="적립금">적립금</option>
                                    <option value="서비스 이용 및 기타">서비스 이용 및 기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>주문번호</td>
                            <td><input type="text" style="width: 170px;" class="inputcss"></td>
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
                    <input type="submit" value="저장" class="write_btn" onclick="location.href='QNAdetil.html'">
                </div>
        </div>
    </div>
   <!-- QNA 내용 끝-->
</div>
<!-- QNA 끝-->

</body> 
</html>