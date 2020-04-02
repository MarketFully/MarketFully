<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <li> ▶ 고객님의 의견을 빠르게 반영하여 더욱 편리하 마켓풀리가 되겠습니다.</li>
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
                        </tr>
                    </thead>
                    
                    <tbody class="item">
                        <tr>
                            <td>1</td>
                            <td>한식</td>
                            <td class="tdtext" style="padding-left: 30px;" onclick="location.href='suggestwriteDetail'">[가격인상공지] [아임제주] 제주 구좌 향당근 주스</td>
                            <td>user01</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>한식</td>
                            <td class="tdtext"  style="padding-left: 30px;">[가격인하공지] [카나슈] 티 & 커피 슈가 7종 </td>
                            <td>user02</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>양식</td>
                            <td class="tdtext" style="padding-left: 30px;">[추석연휴] 배송휴무안내</td>
                            <td>user03</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>양식</td>
                            <td class="tdtext" style="padding-left: 30px;">개인정보처리방침 개정</td>
                            <td>user04</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>5</td> 
                            <td>기타</td>
                            <td class="tdtext" style="padding-left: 30px;">[마켓풀리] 레시피 오류 안내 </td>
                            <td>user05</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>중식</td>
                            <td class="tdtext" style="padding-left: 30px;">[가격인상공지] [아임제주] 제주 구좌 향당근 주스</td>
                            <td>user06</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>중식</td>
                            <td class="tdtext"  style="padding-left: 30px;">[가격인하공지] [카나슈] 티 & 커피 슈가 7종 </td>
                            <td>user07</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>일식</td>
                            <td class="tdtext" style="padding-left: 30px;">[추석연휴] 배송휴무안내</td>
                            <td>user08</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>기타</td>
                            <td class="tdtext" style="padding-left: 30px;">개인정보처리방침 개정</td>
                            <td>user09</td>
                            <td>2020.2.6</td>
                        </tr>
                        <tr>
                            <td>10</td> 
                            <td>한식</td>
                            <td class="tdtext" style="padding-left: 30px;">[마켓풀리] 레시피 오류 안내 </td>
                            <td>user10</td>
                            <td>2020.2.6</td>
                        </tr>
                    </tbody>
                </table>
<!-- 
                <fieldset>
                    <input type="text" class="sbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" id="keyword">
                    <button type="submit" class="btn_srch">검색</a>
                </fieldset> -->

                <ul class="pagination"></ul>  
            </div>
                <!-- 글쓰기 버튼-->
                <div>
                    <input type="submit" value="글작성" class="write_btn" onclick="location.href='suggestwrite.html'">
                </div>
        </div>
    </div>
   <!-- QNA 내용 끝-->
</div>
<!-- QNA 끝-->

</body> 
</html>