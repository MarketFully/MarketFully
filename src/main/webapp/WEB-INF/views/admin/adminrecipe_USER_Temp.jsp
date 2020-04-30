<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 이미지 슬라이드  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <link rel="stylesheet" href="resources/css/main.css">

    <title>mainpage</title>
<style>
    .w-100{
        width: 100%!important;
        height: 450px;
    }
    a{
        color: #007bff;
    text-decoration: none;
    background-color: transparent;
    }
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

        /* 제품분류 타이틀*/
        .product_title{
            width: 1100px;
            display: inline-flex;
            margin-top: 40px;
            margin-left: 30px
        }
    </style>
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/toptenrecipe.css">
    <link rel="stylesheet" href="resources/css/singleProduct.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->
    

</head>

    <!-- header-->
   <%@include file="../common/adminheader.jsp" %>
    <!-- header end-->


    <!-- 단일상품 타이틀 -->
    <div class="topTenRecipe">
        <div class="TOP">
            <div class="TOP10" style="width: 1100px; display: flex; margin: 0 auto; ">
                <div class="topImgdiv"><img src="resources/img/shopping.png" class="topImg"></div>
                <div class="Ttitle"><h4>사용자 레시피</h4></div>
                    <fieldset style="width:40%; margin-bottom: 0px; margin-top: 9px;">
	                    <form id="src_form" action="aUserSearchList" method="post"> 
	                    	<input type="hidden" name="mc_cate_num" value="${ 101 }">
	        				<input type="text" name="src_input" class="tbox" placeholder="검색어를 입력해주세요" id="keyword">
	        				<a href="javascript:SearchBtn()" class="btn_srch">검색</a>
        				 </form> 
    				</fieldset>
            </div>
        </div>
    </div>
    <script>
	function SearchBtn(){ //HTML을 최대한 유지하기 위해 a태그로 submit을 해준다.
		
		$('#src_form').submit();
	}
	</script>
    
    <!-- 단일상품 타이틀 end-->

     <!-- 상품 -->
     <!-- 고기 -->
     <div class="product_title" onclick="location.href='aUserSearchList?mc_cate_num=102&TvOrUser=user'">
        <img src="resources/img/korea.png" style="width: 30px; height: 30px; margin-right: 10px;"></img> 
        한식
        <img src="resources/img/arrow.png" style="width: 7px; height: 8px; margin-top: 8px; margin-left: 20px;">
    </div>
    	                   
      <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px; margin-bottom: 30px;">
		<c:forEach var="b" items="${ kolist }">
	        <div class="col-lg-3 col-md-6 mb-4" >
	        	     <c:url var="bdetail" value="aRecipeDetail">
							<c:param name="bId" value="${ b.mb_num }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
							<c:param name="TvOrUser" value="${ TvOrUser }"/>
					</c:url>
	            <div class="Rcard h-500 w-100">
	                <a href="${ bdetail }"><img src="resources/img/userRecipe/${b.getMb_rename() }" class="Rcard-img-top" style="height:200px;" onERROR="this.src='resources/img/errorimg.PNG' "></a>
	                <div class="Rcard-body">
	                    <h4 class="Rcard-title" style="cursor: pointer;"><a href="${ bdetail }" style="text-decoration: none;">${ b.mb_title }</a></h4>
	                    <p class="Rcard-text">${ b.mb_content }</p>
	                </div>
	            </div>
	        </div>
		</c:forEach>
      </div>

      <!-- 고기 end -->
      <hr style="width: 1100px; border: 1px dashed #dcdcdc;">
      
      <!-- 과일 -->

      <div class="product_title" onclick="location.href='aUserSearchList?mc_cate_num=103&TvOrUser=user'">
        <img src="resources/img/usa.png" style="width: 30px; height: 30px; margin-right: 10px;"></img> 
        양식
        <img src="resources/img/arrow.png" style="width: 7px; height: 8px; margin-top: 8px; margin-left: 20px;">
        </div>

      <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px; margin-bottom: 30px;">
		<c:forEach var="b" items="${ enlist }">
	        <div class="col-lg-3 col-md-6 mb-4" >
	        	     <c:url var="bdetail" value="aRecipeDetail">
							<c:param name="bId" value="${ b.mb_num }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
							<c:param name="TvOrUser" value="${ TvOrUser }"/>
					</c:url>
	            <div class="Rcard h-500 w-100">
	                <a href="${ bdetail }"><img src="resources/img/userRecipe/${b.getMb_rename() }" class="Rcard-img-top" style="height:200px;" onERROR="this.src='resources/img/errorimg.PNG' "></a>
	                <div class="Rcard-body">
	                    <h4 class="Rcard-title" style="cursor: pointer;"><a href="${ bdetail }" style="text-decoration: none;">${ b.mb_title }</a></h4>
	                    <p class="Rcard-text">${ b.mb_content }</p>
	                </div>
	            </div>
	        </div>
		</c:forEach>
      </div>

      <!-- 과일 end-->

      <hr style="width: 1100px; border: 1px dashed #dcdcdc;">

      <!-- 채소 -->
      <div class="product_title" onclick="location.href='aUserSearchList?mc_cate_num=104&TvOrUser=user'">
        <img src="resources/img/japan.png" style="width: 30px; height: 30px; margin-right: 10px;"></img> 
        일식
        <img src="resources/img/arrow.png" style="width: 7px; height: 8px; margin-top: 8px; margin-left: 20px;">
        </div>

      <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px; margin-bottom: 30px;">
		<c:forEach var="b" items="${ jplist }">
	        <div class="col-lg-3 col-md-6 mb-4" >
	        	     <c:url var="bdetail" value="aRecipeDetail">
							<c:param name="bId" value="${ b.mb_num }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
							<c:param name="TvOrUser" value="${ TvOrUser }"/>
					</c:url>
	            <div class="Rcard h-500 w-100">
	                <a href="${ bdetail }"><img src="resources/img/userRecipe/${b.getMb_rename() }" style="height:200px;" class="Rcard-img-top" onERROR="this.src='resources/img/errorimg.PNG' "></a>
	                <div class="Rcard-body">
	                    <h4 class="Rcard-title" style="cursor: pointer;"><a href="${ bdetail }" style="text-decoration: none;">${ b.mb_title }</a></h4>
	                    <p class="Rcard-text">${ b.mb_content }</p>
	                </div>
	            </div>
	        </div>
		</c:forEach>
      </div>

      <!-- 채소 end -->

      <hr style="width: 1100px; border: 1px dashed #dcdcdc;">

      <!-- 소스 . 면. .오일-->

      <div class="product_title" onclick="location.href='aUserSearchList?mc_cate_num=105&TvOrUser=user'">
        <img src="resources/img/china.png" style="width: 30px; height: 30px; margin-right: 10px;"></img> 
        중식
        <img src="resources/img/arrow.png" style="width: 7px; height: 8px; margin-top: 8px; margin-left: 20px;">
        </div>

      <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px; margin-bottom: 30px;">
		<c:forEach var="b" items="${ chlist }">
	        <div class="col-lg-3 col-md-6 mb-4" >
	        	     <c:url var="bdetail" value="aRecipeDetail">
							<c:param name="bId" value="${ b.mb_num }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
							<c:param name="TvOrUser" value="${ TvOrUser }"/>
					</c:url>
	            <div class="Rcard h-500 w-100">
	                <a href="${ bdetail }"><img src="resources/img/userRecipe/${b.getMb_rename() }" class="Rcard-img-top" onERROR="this.src='resources/img/errorimg.PNG' "
	                style="height:200px;"></a>
	                <div class="Rcard-body">
	                    <h4 class="Rcard-title" style="cursor: pointer;"><a href="${ bdetail }" style="text-decoration: none;">${ b.mb_title }</a></h4>
	                    <p class="Rcard-text">${ b.mb_content }</p>
	                </div>
	            </div>
	        </div>
		</c:forEach>
      </div>
      <!-- 소스 . 면. .오일 end -->

      <hr style="width: 1100px; border: 1px dashed #dcdcdc;">

      <!--수산 해산 건어물 -->

      <div class="product_title" onclick="location.href='aUserSearchList?mc_cate_num=106&TvOrUser=user'">
        <img src="resources/img/world.png" style="width: 30px; height: 30px; margin-right: 10px;"></img> 
        기타
        <img src="resources/img/arrow.png" style="width: 7px; height: 8px; margin-top: 8px; margin-left: 20px;">
        </div>

      <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px; margin-bottom: 30px;">
		<c:forEach var="b" items="${ etclist }">
	        <div class="col-lg-3 col-md-6 mb-4" >
	        	     <c:url var="bdetail" value="aRecipeDetail">
							<c:param name="bId" value="${ b.mb_num }"/>
							<c:param name="currentPage" value="${ pi.currentPage }"/>
							<c:param name="TvOrUser" value="${ TvOrUser }"/>
					</c:url>
	            <div class="Rcard h-500 w-100">
	                <a href="${ bdetail }"><img src="resources/img/userRecipe/${b.getMb_rename() }" class="Rcard-img-top" style="height:200px;" onERROR="this.src='resources/img/errorimg.PNG' "></a>
	                <div class="Rcard-body">
	                    <h4 class="Rcard-title" style="cursor: pointer;"><a href="${ bdetail }" style="text-decoration: none;">${ b.mb_title }</a></h4>
	                    <p class="Rcard-text">${ b.mb_content }</p>
	                </div>
	            </div>
	        </div>
		</c:forEach>
      </div>

      <!--수산 해산 건어물 end -->

      <hr style="width: 1100px; border: 1px dashed #dcdcdc;">

    
    <!-- 상품 end-->

    


        
    <!-- 페이징 처리 -->
<!--     <div class="pagination">
            
        <img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img">
       
        <span class="pagenum_currentpage">1</span>
        <span class="pagenum">2</span>
        <span class="pagenum">3</span>
        <span class="pagenum">4</span>
        <span class="pagenum">5</span> 
   
        
        <img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img">
        

        <a href="javascript:;"><img src="images/next.png" alt="다음 페이지로 이동"  class="nextpage_img"></a>
        <a href="javascript:;"><img src="images/doublenext.png" alt="마지막 페이지로 이동" class="lastpage_img"></a>
    </div>  -->
    <!-- 페이징처리 end-->

    <!--검색창-->
<!-- 	<fieldset>
        <input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" id="keyword">
        <a href="javascript:;" class="btn_srch">검색</a>
    </fieldset> -->
    <!-- 검색창 ends-->


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