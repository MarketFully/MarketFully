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
    <link rel="stylesheet" href="resources/css/suggestwrite.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <style>
    	.goodbtn,.hatebtn{
    	    border: none;
   		    width: 80px;
    		height: 30px;
    		border-radius: 4px;
    		background-color:#2e8b57;
    		color:#fff;
    	}
    </style>
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
                <table>
                    <tbody class="Rwrite">
                        <tr>
                            <td>제목</td>
                            <td>${ rcb.rb_title }</td>
                        </tr>
                        <tr>
                        	<td>작성자</td>
                        	<td>${ rcb.rb_writer }</td>
                        </tr>
                        <tr>
                            <td>카테고리</td>
                            <td>
                                ${ rcb.rb_foodcategory }
                            </td>
                        </tr>
                        <tr>
                            <td>제안내용</td>
                            <td>
                                ${rcb.rb_content}
                            </td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td>
                            	<c:if test="${!empty rcb.rb_file }">
                            		<a href="${contextPath}/resources/recipesuggestuploadFiles/${rcb.rb_refile}" 
                            		download="${rcb.rb_file }">${rcb.rb_file}</a>
                            	</c:if>
                            </td>
                        </tr>
                      
						<tr>
                        	<td></td>
                        	<td style="text-align:center; padding-top:30px; padding-bottom:20px;">
                        		<c:if test="${ !empty sessionScope.loginUser and loginUser.mem_id != rcb.rb_writer }">
                        			<div style="float:left; padding-left:320px;" class="good">
                        				<c:if test="${ boardLike == 0 }">
                        					<img src="resources/img/like.png" style="width:30px;heigh:30px; vertical-align: top; margin-right:5px;" id="goodBtn" name="rb_thank">
                        					좋아요
                        				</c:if>
                        				<c:if test="${ boardLike == 1 }">
                        					<img src="resources/img/likecolor.png" style="width:30px;heigh:30px; vertical-align: top; margin-right:5px;" id="goodBtn" name="rb_thank">
                        					좋아요
                        				</c:if>
                        			</div>
                        		</c:if>
                        	</td>
                       </tr>
                    </tbody>
                </table>
                     
                    


                
            </div>
                <!-- 글쓰기 버튼-->
                <div>
                	<c:if test="${loginUser.mem_id eq rcb.rb_writer }">
                		
                		<c:url var="suggestwriteUpdate" value="suggestwriteUpdate">
                			<c:param name="rb_num" value="${rcb.rb_num }"/>
                    	</c:url>
                    		<input type="button" value="수정" class="write_btn" style="margin-left: 10px;" onclick="location.href='${suggestwriteUpdate}'">
                    	
                    	<c:url var="suggestwriteDelete" value="suggestwriteDelete">
                    		<c:param name="rb_num" value="${rcb.rb_num }"/>
                    	</c:url>
                    		<input type="button" value="삭제" class="write_btn" onclick="location.href='${suggestwriteDelete}'">
                    </c:if>
                </div>
        </div>
    </div>
   <!-- QNA 내용 끝-->
</div>
<!-- QNA 끝-->

<script>
		
/*   	var r = "${rcb.rb_num}"
 	$(function(){
 		$(".good").on("click",function(){
 			$.ajax({
 				url:"likey.do",
 				data:{rb_num:r},
 				type:"post",
 				success:function(data){
 					console.log(data);
 					if(data == 1){
 						$('#goodBtn').prop("src","resources/img/likecolor.png");
 					}else{
 						$('#goodBtn').prop("src","resources/img/like.png");
 					}
 				}
 			})
 		})
 	}) */
 	
/*  	$('#nonHeart').bind("click",function() {
 		$('#nonHeart').attr("src","/ot/resources/images/icons/like-check.png")
 		   }) */
 	
 		  var r = "${rcb.rb_num}"
 		  var mem_num = "${loginUser.mem_num}"
 			 	$(function(){
 			 		$(".good").on("click",function(){
 			 			$.ajax({
 			 				url:"likey.do",
 			 				data:{rb_num:r , mem_num :mem_num},
 			 				type:"post",
 			 				success:function(data){
 			 					console.log(data);
 			 					if(data == 1){
 			 						$('#goodBtn').prop("src","resources/img/likecolor.png");
 			 					}else{
 			 						$('#goodBtn').prop("src","resources/img/like.png");
 			 					}
 			 				}
 			 			})
 			 		})
 			 	})
 
</script>
</body> 
</html>