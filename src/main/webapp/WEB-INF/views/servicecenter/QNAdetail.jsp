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

<script>
	$(function(){

		// 댓글 등록
		$("#submitbtn").on("click",function(){
			var qr_content = $("#qr_content").val();
			var q_num = ${b.q_NUM};
			var qr_writer = "<%=((Member)session.getAttribute("loginUser")).getMem_name()%>";
			console.log(" ㅎㅇ");
			
			$.ajax({
				url:"qnaReply",
				data:{qr_content: qr_content, q_num:q_num, qr_writer:qr_writer},
				type: "post",
				success:function(data){
					if(data == "success"){
						window.location.reload();
						$("#qr_content").val("");
					}
				}, error:function(){
					console.log("등록실패");
				}
			});
		});
	});
	

</script>

<style>
    #deletebtn{
    color:#2e8b57;
    border:none;
    background:none;
    font-family: MapoPeacefull;
    font-size: 13px;
    }
</style>
    <!--header-->
    <%@include file="../common/header.jsp" %>
    <!-- header end-->
	
	</script>
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
        
        <!-- 댓글 등록 -->
        <div>
        <div>
            <div><p style="border-bottom: 2px solid #2e8b57; font-size: 20px;"><strong>댓글</strong></p></div>
            	
            	<c:forEach var="r" items="${qr}">
        			<div class=reply_Body">
        				<h4 class="reply_head">
        				<b class="reply_name">${r.qr_writer}</b> ${r.qr_date}
        				<c:url var="qdelete" value="qnadeleteReply">
        				<c:param name="q_num" value="${r.q_num }"/>
        				<c:param name="bId" value="${b.q_NUM }"/>
        				</c:url>
        				<input type="button" value="삭제" id="deletebtn" onclick="location.href='${qdelete}'" style="float: right;margin-top: 10px;">
        				</h4>
        				<p class="reply_main">${r.qr_content }</p>
        			</div>
        		</c:forEach>
            <div class="re" style="margin-top: 30px;">
                <textarea id="qr_content"></textarea>
                <input type="button" value="등록" class="re_btn"  id="submitbtn">
            </div>
        </div>
        </div>
    </div>
    
   <!-- QNA 내용 끝-->
</div>

<!-- QNA 끝-->



</body> 
</html>