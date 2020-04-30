<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/myPage.css">
<link rel="stylesheet" href="css/suggestwrite.css">
<title>Insert title here</title>
<style>
        .Recipewrite {
            width: 1100px;
            margin: 0 auto;
            margin-top: 50px;
        }

        .Rcontent_div {
            text-align: center;
            box-sizing: border-box;
            width: 100%;
            margin-left: 0px;
            border-bottom: 2px solid #2e8b57;
            border-top: 2px solid #2e8b57;
        }

        .rewrite>tr>td {
            padding: 15px;
            text-align: start;
        }

        .rewrite>tr>td>select {
            font-family: MapoPeacefull;
            border-radius: 4px;
            height: 25px;
            width: 100px;
        }

        .rewrite>tr>td>textarea {
            border: 1px solid #dedede;
            border-radius: 4px;
            height: 20px;
            resize: none;
            width: 700px;
            height: 300px;
            font-family: MapoPeacefull;
        }

        .categorychoice {
            width: 100px;
            text-align: center;
            height: 35px;
            font-size: 14px;
            line-height: 35px;
            vertical-align: middle;
            background: #2e8b57;
            color: #fff !important;
            text-decoration: none;
            border: none;
            font-family: MapoPeacefull;
        }
        .inputcss{
            border: 1px solid #dedede;
    		border-radius: 4px;
    		height: 21px;
    		width: 250px;
   			font-family: MapoPeacefull;
        }
        
        .write_btn {
    		width: 100px;
    		text-align: center;
    		height: 35px;
    		font-size: 14px;
    		line-height: 35px;
    		vertical-align: middle;
    		background: #2e8b57;
    		color: #fff !important;
   			text-decoration: none;
    		border: none;
    		font-family: MapoPeacefull;
    		margin-top: 30px;
    		float: right;
    		margin-bottom:200px;
		}
    </style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div id="writeRecipe" class="Recipewrite">
        <div class="head_aticle">
            <h2 class="tit" style="display:flex;">나만의 레시피 작성</h2>
        </div>

        <div>
            <div class="Rcontent_div">
                <table>
                    <tbody class="rewrite">
                        <tr>
                            <td>제목</td>
                            <td><input type="text" class="inputcss"></td>
                        </tr>
                        <tr>
                            <td>카테고리</td>

                            <td>
                                <input type="submit" value="카테고리선택" class="categorychoice" onclick="showChoie();">
                            </td>
                        </tr>
                        <tr>
                            <td>레시피 내용</td>
                            <td>
                                <textarea name="content" id="content"></textarea>
                            </td>
                        </tr>

                    </tbody>
                </table>





            </div>
            <!-- 글쓰기 버튼-->
            <div>
                <input type="submit" value="저장" class="write_btn" onclick="location.href='#'">
            </div>
        </div>
    </div>
    <!-- QNA 내용 끝-->
    </div>
    <!-- QNA 끝-->

	<script>
    // 팝업창 
    function showChoie() {
        window.open('Categorychoice', "categorychoice", "width=600,height=600,left=100,top=60");
    }
	</script>
	
	 <footer><!--class="py-5 bg-dark"-->
        <!-- <img src="resources/img/footer_test.jpg" style="margin-top: 150px;"> -->
        <div style="display: inline-flex; margin-top: 200px;height: 200px;">
         
            <div class="footer_info">
                <p class="f_if">법인명(상호) : 주식회사 마켓풀리</p>
                <p class="f_if">사용자 등록 번호 : 111-11-11111</p>
                <p class="f_if">주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</p>
                <p class="f_if">팩스 : 000-0000-0000</p>
                <p class="f_if">이메일 : marcketfully@marcket.com</p>
            </div>
        </div>
        <img src="resources/img/footer1.jpg">
        <div class="footContainer">
            <p class=""></p>
        </div>
    </footer>
</body>
</html>