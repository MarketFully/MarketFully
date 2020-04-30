
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
    <!-- header-->
   <%@include file="../common/header.jsp" %>
    <!-- header end-->
  <!-- 단일상품 타이틀 -->
    <div class="topTenRecipe">
        <div class="TOP">
            <div class="TOP10" style="width: 1100px; display: flex; margin: 0 auto; ">
                <div class="topImgdiv"><img src="resources/img/shopping.png" class="topImg"></div>

                <div class="Ttitle"><h4>상품</h4></div>
            </div>
        </div>
    </div>
    <!-- 단일상품 타이틀 end-->
	<c:set var="l" value="0"/>
    <c:forEach var="ct" items="${mclist }" varStatus="" >
     <!-- 상품 -->
     <!-- 고기 -->
     
     <div class="product_title" onclick="location.href='Productchoosecate?catenum=${ct.catecode1}&maincatename=${ct.catename1 }'">
        <img src="resources/img/steak.png" style="width: 30px; height: 30px; margin-right: 10px;"></img> 
       ${ct.catename1 }
        <img src="resources/img/arrow.png" style="width: 7px; height: 8px; margin-top: 8px; margin-left: 20px;">
    </div>
       <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px; margin-bottom: 30px;">
<c:forEach var="j" begin="0" end="3" step="1">
        
     
        <c:if test="${fourproductlist[l].pr_cate1 != NULL }">
        <div class="col-lg-3 col-md-6 mb-4" style="cursor: pointer;"  onclick="location.href='ProductDetail?pr_code=${fourproductlist[l].pr_code}'">
            <div class="Rcard h-500 w-100">
                <a href="#"><img src="resources/img/Productuploadimg/${fourproductlist[l].renameFileName }" 
                class="Rcard-img-top" onERROR="this.src='resources/img/errorimg.PNG' "  style="height: 200px;"
 style='width:90%;'></a>
            
                <div class="Rcard-body">
                    <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">${fourproductlist[l].pr_name }</a></h4>
                    <p class="Rcard-text">${fourproductlist[l].pr_price }원 </p>
                </div>
            </div>
        </div>
        </c:if>
           <c:if test="${fourproductlist[l].pr_cate1 == NULL }">
        <div class="col-lg-3 col-md-6 mb-4">
        
        </div>
        
        </c:if>
        
        <c:set var="l" value="${l+1 }"/>
        </c:forEach>
        

    </c:forEach>
      <!-- 고기 end -->
     
      <!--수산 해산 건어물 end -->

      <hr style="width: 1100px; border: 1px dashed #dcdcdc;">

      <!-- 가공식품(햄, 치즈, 버터, 우유) -->

      
    <!-- 상품 end-->


        
    <!-- 페이징 처리 -->
    <div class="pagination">
            
    
   
        
        

        <!-- <a href="javascript:;"><img src="images/next.png" alt="다음 페이지로 이동"  class="nextpage_img"></a>
        <a href="javascript:;"><img src="images/doublenext.png" alt="마지막 페이지로 이동" class="lastpage_img"></a> -->
    </div> 
    <!-- 페이징처리 end-->

    <!--검색창-->
    <fieldset>
        <input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" id="keyword">
        <a href="javascript:;" class="btn_srch">검색</a>
    </fieldset>
    <!-- 검색창 ends-->


	</div>
    <!--tv 레시피 end-->

    <!-- 탭 메뉴 스크립트-->
	<script>
	
	</script>
</body>
</html>