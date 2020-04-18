<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>tab example</title>
	<style>
        .page_aticle{
            width: 1050px;
            margin: 0 auto;
        }

        .KF_title{
            padding-top: 100px;
        }

        .KF_inner{
            position: relative;
            /* padding-left: 20px; */
        }

        .KF_main{
            overflow: hidden;
            width: 100%;
            /* border-bottom: 2px solid #2e8b57; 보류 */
            margin-bottom: 10px;
            width: 100px;
        }

        .Kicon{
            display: block;
            overflow: hidden;
            float: left;
            width: 40px;
            height: 40px;
        }

        .Kicon img{
            width: 40px;
            height: 30px;
            vertical-align: top
        }

        .kF_name{
            float: left;
            padding: 7px 0 0 4px;
            font-size: 14px;
            line-height: 18px;
            font-weight: 700;
            color: #000;
            letter-spacing: -0.3px;
        }

        .toptenTab{

            text-align: center;
            box-sizing: border-box;
            padding-left: 20px;
            padding-right: 20px;
            width: 100%;
            margin-left: 0px;
            margin-top: 30px;
        }

        .recipe{
            border-collapse: collapse;
            width: 100%;
        }

        .recipe_head{
            border-top: 3px solid #2e8b57;
            border-bottom: 1px dashed #dcdcdc;
        }

        .col{
            padding: 20px;
            line-height: 1.5;
            text-align: center;
            font-size: 15px;
            color: #555;
        }

        .colT{
            padding: 20px;
            line-height: 1.5;
            text-align: center;
            font-size: 15px;
            color: #555;
            width: 470px;
        }

        .recipe{
            width: 100%;
        }

        .item > tr > td{
            padding: 10px;
        }

        .item > tr > td {
            border-bottom: 1px dashed #dcdcdc;
        }

        .mtitle {
            margin-top: 40px;
            /* float: right; */
            display: inline-block;
        }

        .mimg{
            float: left;
            margin-left: 20px;
        }
        .menu{
            padding-bottom: 20px;
        }


        /*검색창css*/
        .tbox{
            padding: 0 5px 0 30px;
             width: 200px;
            height: 35px;
            line-height: 35px;
            border: none;
            border-bottom: 1px solid #ccc;
            background: url(../resources/img/Tsearch.png) no-repeat 10px 50%;
            background-size: 15px;
        }
        .btn_srch{
            display: inline-block;
            width: 70px;
            text-align: center;
            height: 35px;
            font-size: 14px;
            line-height: 35px;
            vertical-align: middle;
            background: #2e8b57;
            color: #fff !important;
            text-decoration: none;
        }
        fieldset {
            border: none;
            box-sizing: border-box;
            width: 100%;
            margin-top: 50px; 
            margin-bottom: 50px;
        }
        /*페이징 처리 css*/
        .pagination {
            display:inline-block;
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
            margin-top: 100px;
        }

        .pagenum_currentpage{
            border-radius: 3px; 
            background: #2e8b57; 
            color: #fff;
            display: inline-block; 
            width: 25px;
            height: 25px; 
            line-height: 25px;
            text-align: center;
            vertical-align: middle;
            margin-left: 15px;
        }

        .pagenum{
            display: inline-block; 
            width: 25px;
            height: 25px; 
            line-height: 25px;
            text-align: center;
            vertical-align: middle;
        }

        .firstpage_img,.prevpage_img{
            display: inline-block; 
            width: 30px;
            height: 30px; 
            text-align: center;
            vertical-align: middle;
            float: left;
        }

        /* 레시피 작성 버튼 css*/
        .write_btn{
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
            margin-top: 20px;
            float: right;
        }

        .write{
            flex: auto;     
        }
	</style>
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/toptenrecipe.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->
</head>
<body>
    <!-- header-->
    <%@include file="../common/header.jsp" %>
    <!-- header end-->


    <!-- 사용자 레시피 타이틀 -->
    <div class="topTenRecipe">
        <div class="TOP">
            <div class="TOP10" style="width: 1100px; display: flex; margin: 0 auto;">
                <div class="topImgdiv"><img src="resources/img/user.png" class="topImg"></div>
                <div class="Ttitle"><h4>사용자 레시피</h4></div>
                <div class="write"><input type="submit" value="레시피 작성" class="write_btn" onclick="location.href=''"> </div>
            </div>
        </div>
    </div>
    <!-- 사용자 레시피 타이틀 end-->


     <!-- 전체 카테고리 목록 -->

     <div class="toptenTab" style="width: 1100px; margin: 0 auto;">
        <table class="recipe" id="tv_recipe">
            <thead class="recipe_head">
                <tr>
                    <th class="col">번호</th>
                    <th class="colT">제목</th>
                    <th class="col">작성자</th>
                    <th class="col">작성일</th>
                    <th class="col">조회수</th>
                </tr>
            </thead>
            <c:forEach var="b" items="${ list }">
            <tbody class="item">
                <tr>
                    <td>${ b.mb_num }</td>
	                    <c:url var="bdetail" value="RecipeDetail">
							<c:param name="bId" value="${ b.mb_num }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
							<c:param name="TvOrUser" value="${ TvOrUser }"/>
						</c:url>
                    <td class="menu"><img src="resources/img/menu1.png" class="mimg"><p class="mtitle"><a href="${ bdetail }">${ b.MB_TITLE }</a> </p></td>
                    <td>${ b.MB_WRITER }</td>
                    <td>${ b.MB_CDATE }</td>
                    <td>${ b.MB_COUNT }</td>
                </tr>
            </tbody>
            </c:forEach>
        </table>
    </div>

    
    <!--전체 카테고리 목록 end-->


        
    <!-- 페이징 처리 -->
    <div class="pagination">
            
<!--         <img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img">
        <span class="pagenum_currentpage">1</span>
        <span class="pagenum">2</span>
        <span class="pagenum">3</span>
        <span class="pagenum">4</span>
        <span class="pagenum">5</span> 
        <img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img"> -->
        
        <!-- 이전 -->
        <c:if test="${ pi.currentPage eq 1 }">
				[이전] &nbsp;
		</c:if>
			<c:if test="${ pi.currentPage ne 1 }">
				<c:url var="before" value="RecipeUser">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
		</c:if>
		
		<!-- 페이지 -->
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<font color="red" size="4"><b>${ p }</b></font>
			</c:if>
					
			<c:if test="${ p ne pi.currentPage }">
				<c:url var="pagination" value="RecipeUser">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
		
		<!-- [다음] -->
			<c:if test="${ pi.currentPage eq pi.maxPage }">
					[다음]
			</c:if>
			<c:if test="${ pi.currentPage ne pi.maxPage }">
				<c:url var="after" value="RecipeUser">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
				</c:url> 
				<a href="${ after }">[다음]</a>
			</c:if>    

        <!-- <a href="javascript:;"><img src="images/next.png" alt="다음 페이지로 이동"  class="nextpage_img"></a>
        <a href="javascript:;"><img src="images/doublenext.png" alt="마지막 페이지로 이동" class="lastpage_img"></a> -->
    </div> 
    <!-- 페이징처리 end-->

    <!--검색창-->
    <fieldset>
    	<form id="src_form" action="userSearchList" method="post">
    		<select name="mc_cate_num">
	    		<option value="101" selected>전체</option>
	    		<option value="102" >한식</option>
	    		<option value="103" >양식</option>
	    		<option value="104" >일식</option>
	    		<option value="105" >중식</option>
	    		<option value="106" >기타</option>
	    	</select>
        	<input type="hidden" name="mc_cate_num" value="${ mc_cate_num}">
	        <input type="text" name="src_input" class="tbox" placeholder="검색어를 입력해주세요" id="keyword">
	        <a href="javascript:SearchBtn()" class="btn_srch">검색</a>
        </form>
    </fieldset>
    <!-- 검색창 ends-->
<script>
	function SearchBtn(){ //HTML을 최대한 유지하기 위해 a태그로 submit을 해준다.
		
		$('#src_form').submit();
	}
</script>


	</div>
    <!--tv 레시피 end-->

    <!-- 탭 메뉴 스크립트-->
	<script>
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.toptenTab').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
	</script>
</body>
</html>