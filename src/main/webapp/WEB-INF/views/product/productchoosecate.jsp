<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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

        /* 제품분류 타이틀*/
        .product_title{
            width: 1100px;
            display: inline-flex;
            margin-top: 40px;
            margin-left: 30px
        }

        /* 상세 분류 */
        .mList{
            width: 1100px;
            margin: 0 auto;
            display: inline-flex;
            margin-top: 10px;
            list-style: none;
            overflow: hidden;
        }

        .m1,.current{
            float: left;
            list-style: none;
        }

        .mList li a{
            overflow: hidden;
            float: left;
            padding: 0 13px 7px 12px;
            border-bottom: 1px solid #ddd;
            line-height: 20px;
            font-size: 12px;
            color: #333;
            letter-spacing: -0.3px;
            cursor: pointer;
            transition:0.3s;
        }

        .mList li a:hover{
            /* border-color:#2e8b57; */
            border-bottom:2px solid #2e8b57;
        }

        li .on{
            color:#2e8b57;
        }

        .product{
            display: none;
			background-color :#fff;
			/* padding: 6px 12px; */
			color:#000;
        }

        .product.current{
            display: block;
            margin: 0 auto;
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
                <div class="topImgdiv"><img src="resources/img/steak.png" class="topImg"></div>
                <div class="Ttitle"><h4>${maincatename }</h4></div>
            </div>
        </div>


        <ul class="mList">
            <li class="current"><a href="Productchoosecate?catenum=${sc[0].upcate }&maincatename=${maincatename}">전체보기</a></li>
            <c:forEach var="subcate" items="${sc }">
            <c:url var="subselect" value="productsubselect">
            	<c:param name="maincate" value="${subcate.upcate }"/>
            	<c:param name="subcate" value="${subcate.catecode2 }"/>
            	<c:param name="maincatename" value="${maincatename }"/>
            </c:url>
           	<li class="m1"><a href=${subselect }> ${subcate.catename2 }</a> </li>
            </c:forEach>
        </ul>
    </div>
    
    <!-- 단일상품 타이틀 end-->
    
    <!-- 전체보기 -->
    
    <div style="width: 1200px; display: flex; margin: 0 auto;">
        
        <div id="tab1" class="product current">
        <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

				<c:forEach var="R" begin="0" end="7" step="1">
					<c:if test="${pr[R]!=NULL }">
						<div class="col-lg-3 col-md-6 mb-4">
							<div class="Rcard h-500 w-100">
								<a href="ProductDetail?pr_code=${pr[R].pr_code }"><img src="resources/img/Productuploadimg/${pr[R].renameFileName }"
									class="Rcard-img-top" style="width: 90%;" ></a>

								<div class="Rcard-body">
									<h4 class="Rcard-title">
										<a href="ProductDetail?pr_code=${pr[R].pr_code }"
										 style="text-decoration: none;">${pr[R].pr_name }</a>
									</h4>
									<p class="Rcard-text">남은 재고 : ${pr[R].pr_entity }개 &nbsp;&nbsp; 가격 : ${pr[R].pr_price } 원</p>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${pr[R]==NULL }">
						<div class="col-lg-3 col-md-6 mb-4">
						</div>
					</c:if>
				<c:if test="${R ==3}">
					</div>
					<div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">
				</c:if>
				</c:forEach>
			</div>
</div>
    
          </div>

          
          
          
</div>
    <!-- 상품 (전체 end)-->

    


        
    <!-- 페이징 처리 -->
    <br>
    <div class="pagination">
            
     
        
        
              <!-- 이전 -->
              <c:if test="${ pi.currentPage eq 1 }">
               <img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img" 
               style="width:25px;height:25px; cursor:pointer;vertical-align: middle;">
            </c:if>
               <c:if test="${ pi.currentPage ne 1 }">
                  <c:url var="before" value="Productchoosecate">
                  <c:param name="catenum" value="${sc[0].upcate }"/>
                  <c:param name="maincatename" value="${maincatename }"/>
                    <c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
                  </c:url>
                  <a href="${before}"><img src="resources/img/arrow_left.png" style="width:25px;height:25px;vertical-align: middle;"></a>
               </c:if>
      
            <!-- 페이지 -->
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
               <c:if test="${ p eq pi.currentPage }">
                  <font color="#2e8b57" size="4"><b>${ p }</b></font>
               </c:if>
                     
               <c:if test="${ p ne pi.currentPage }">
                  <c:url var="pagination" value="Productchoosecate">
                  
                        <c:param name="currentPage" value="${ p }"/>
                        <c:param name="catenum" value="${sc[0].upcate }"/>
                  <c:param name="maincatename" value="${maincatename }"/>
                  </c:url>
                     <a href="${ pagination }">${ p }</a> &nbsp;
                  </c:if>
               </c:forEach>
      
               <!-- [다음] -->
                  <c:if test="${ pi.currentPage eq pi.maxPage }">
                  
                     <img src="resources/img/arrow_right.png" alt="다음 페이지로 이동" 
                      style="width:25px;height:25px;cursor:pointer;vertical-align: middle;" >
                     
                  </c:if>
                  <c:if test="${ pi.currentPage ne pi.maxPage }">
                     <c:url var="after" value="Productchoosecate">
                        <c:param name="catenum" value="${sc[0].upcate }"/>
                  		<c:param name="maincatename" value="${maincatename }"/>
                        <c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
                     </c:url> 
                     <a href="${after}"><img src="resources/img/arrow_right.png" style="width:25px;height:25px;vertical-align: middle;"></a>
                  </c:if>    
         
                 <!-- <a href="javascript:;"><img src="images/next.png" alt="다음 페이지로 이동"  class="nextpage_img"></a>
                 <a href="javascript:;"><img src="images/doublenext.png" alt="마지막 페이지로 이동" class="lastpage_img"></a> -->
             </div> 
             <!-- 페이징처리 end--> 
   
        
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