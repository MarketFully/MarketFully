<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>tab example</title>
	<style>
		#topRecipe {
			width:1100px;
			margin:0 auto;
            /* text-align:center; */
            margin-bottom: 100px;
		}
		
		.tab {
			list-style: none;
			margin: 0;
			padding: 0;
            overflow: hidden;
		}
		/* Float the list items side by side */
		.tab li {
			float: left;
		}
		/* Style the links inside the list items */
		.tab li a {
			display: inline-block;
			color: #000;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 17px;
			transition:0.3s;
		}
		/* Style the tab content */
		.toptenTab {
			display: none;
			background-color :#fff;
			padding: 6px 12px;
			color:#000;
		}
		.toptenTab.current {
			display: block;
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
        
        .btn{display:inline-block;font-weight:400;color:#212529;text-align:center;vertical-align:middle;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-color:transparent;border:1px solid transparent;padding:.375rem .75rem;font-size:1rem;line-height:1.5;border-radius:.25rem;transition:color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out}
        @media (prefers-reduced-motion:reduce){
        .btn{transition:none}}
        .btn:hover{color:#212529;text-decoration:none}
        .btn.focus,.btn:focus{outline:0;box-shadow:0 0 0 .2rem rgba(0,123,255,.25)}
        .btn.disabled,.btn:disabled{opacity:.65}
        a.btn.disabled,fieldset:disabled a
        .btn{pointer-events:none}
        
        
        .btn-success{color:#fff;background-color:#2e8b57;border-color:#2e8b57}
        .btn-success:hover{color:#fff;background-color:#218838;border-color:#1e7e34}
        .btn-success.focus,.btn-success:focus{box-shadow:0 0 0 .2rem rgba(72,180,97,.5)}
        .btn-success.disabled,.btn-success:disabled{color:#fff;background-color:#28a745;border-color:#28a745}
        .btn-success:not(:disabled):not(.disabled).active,.btn-success:not(:disabled):not(.disabled):active,.show>
        .btn-success.dropdown-toggle{color:#fff;background-color:#1e7e34;border-color:#1c7430}
        .btn-success:not(:disabled):not(.disabled).active:focus,
        .btn-success:not(:disabled):not(.disabled):active:focus,.show>
        .btn-success.dropdown-toggle:focus{box-shadow:0 0 0 .2rem rgba(72,180,97,.5)}
        
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

    <!-- top10 메뉴 타이틀 end-->
    <div class="topTenRecipe">
        <div class="TOP">
            <div class="TOP10" style="width: 1100px; display: flex; margin: 0 auto;">
                <div class="topImgdiv"><img src="resources/img/tv.png" class="topImg"></div>
                <div class="Ttitle"><h4>TV 속 레시피</h4></div>
            </div>
        </div>
    </div>
    <!-- top10 메뉴 타이틀 end-->

<script>
	//탭 만들기 
	$(function(){ 
		console.log('suc');
		
		//선택된 카테고리 확인
		if(${mc_cate_num} == 0){ //카테고리가 전체면
			$('button[name=allCate]').attr('class','btn btn-success');
		}else{ //카테고리가 선택되었으면
			console.log('카테고리가 선택되었음 : '+${mc_cate_num});
		
			//선택된 카테고리의 btn-default를 success로 변경
			var cateNum = $('ul.tab li').children().children('input[type=hidden]').val();
			console.log(cateNum);
			
			//반복문을 돌면서 mc_cate_num과 같은 값을 가진 li태그를 찾는다.
			$.each($('ul.tab li').children(), function(index, item){
				console.log('반복문 도는중 : '+$(item).children('input[type=hidden]').val());
				if($(item).children('input[type=hidden]').val() ==  ${ mc_cate_num}){
					console.log('값 변경중 : '+$(item).children('#tvCateBtn'));
					$(item).children('#tvCateBtn').attr('class','btn btn-success');
					console.log('미션 석세스');
					return false;
					
				}//if
			}); //each
			
			
		}//else
		
	});
	
	
	
</script>

    
	<div id="topRecipe">
        <div class="TopMenu">
		    <ul class="tab" style="margin-top: 30px;">
		    <!-- 전체 목록 -->
		    	<li>
		    		<form action="tvBoardList" method="post" >
			    		<input type="hidden" value="0" name="mc_cate_num">
			    		<button id="tvCateBtn" class="btn btn-default" name="allCate" style="font-family: MapoPeacefull;">전체</button>
			    	</form>
		    	</li>
		    	<!-- 레시피 목록 반복문으로 돌려서 카테고리를 만든다.-->
		    	<c:forEach var="clist" items="${clist }" varStatus="status">
			    		<li>
			    			<form action="tvBoardList" method="post" >
			    				<input type="hidden" value="${clist.mc_cate_num}" name="mc_cate_num">
			    				<button id="tvCateBtn" class="btn btn-default" style="font-family: MapoPeacefull;">${clist.mc_name }</button>
			    				&nbsp;&nbsp;
			    			</form>
			    		</li>
		    		
		    	</c:forEach>
		    </ul>
        </div>

		<div id="tab1" class="toptenTab current">
			<table class="recipe" id="tv_recipe">
                <thead>
                    <tr>
                        <th class="col">번호</th>
                        <th class="colT">제목</th>
                        <th class="col">작성자</th>
                        <th class="col">작성일</th>
                        <th class="col">조회수</th>
                    </tr>
                </thead>
                <tbody class="item">
                
                	<c:forEach var="b" items="${blist}">
	                    <tr>
	                     
	                        <td>${b.mb_num }</td>
	                        <c:url var="bdetail" value="RecipeDetail">
								<c:param name="bId" value="${ b.mb_num }"/>
								<c:param name="currentPage" value="${ pi.currentPage }"/>
								<c:param name="TvOrUser" value="${ TvOrUser }"/>
							</c:url>
	                        <td class="menu">
	                        	<img src="resources/img/tvRecipe/${b.getMb_rename() }" class="mimg" style="">
	                        	<p class="mtitle">
	                        		<a href="${ bdetail }">${ b.mb_title}</a> (${b.mb_rcount})
	                        	</p>
                        	</td>
	                        <td>${b.mb_writer}</td>
	                        <td>${b.mb_cdate }</td>
	                        <td>${b.mb_count }</td>
	                         
	                    </tr>
	                 </c:forEach>
	                    
                </tbody>
            </table>
		</div>

        
    <!-- 페이징 처리 -->
    <div class="pagination">
        
        <!-- 이전 -->
        <c:if test="${ pi.currentPage eq 1 }">
				[이전] &nbsp;
		</c:if>
		
		<c:if test="${ pi.currentPage ne 1 }">
			<c:url var="before" value="${pageValue }">
				<c:param name="mc_cate_num" value="${mc_cate_num }"/>
				<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				<c:param name="src_cate" value="${ si.src_cate }"/>
				<c:param name="src_input" value="${ si.src_input }"/>
			</c:url>
			<a href="${ before }">[이전]</a> &nbsp;
		</c:if>
		
		<!-- 페이지 -->
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:if test="${ p eq pi.currentPage }">
				<font color="red" size="4"><b>${ p }</b></font>
			</c:if>

			<c:if test="${ p ne pi.currentPage }">
				<c:url var="pagination" value="${pageValue }">
						<c:param name="currentPage" value="${ p }"/>
						<c:param name="mc_cate_num" value="${mc_cate_num }"/>
						<c:param name="src_cate" value="${ si.src_cate }"/>
						<c:param name="src_input" value="${ si.src_input }"/>
				</c:url>
				<a href="${ pagination }" >${ p }</a> &nbsp;
			</c:if>
		</c:forEach>


		<!-- [다음] -->
			<c:if test="${ pi.currentPage eq pi.maxPage }">
					[다음]
			</c:if>
			<c:if test="${ pi.currentPage ne pi.maxPage }">
				<c:url var="after" value="${pageValue }">
					<c:param name="mc_cate_num" value="${mc_cate_num }"/>
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					<c:param name="src_cate" value="${ si.src_cate }"/>
					<c:param name="src_input" value="${ si.src_input }"/>
				</c:url> 
				<a href="${ after }">[다음]</a>
			</c:if>    

    </div> 
    <!-- 페이징처리 end-->

    <!--검색창-->
    <fieldset>
    	<form id="src_form" action="tvSearchList" method="post">
	    	<select name="src_cate">
	    		<option value="title" selected>제목</option>
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
</body>
</html>