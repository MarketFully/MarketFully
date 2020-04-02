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
    <link rel="stylesheet" href="resources/css/singleproduct.css">
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
                <div class="topImgdiv"><img src="resources/img/milk.png" class="topImg"></div>
                <div class="Ttitle"><h4>수산/해산/건어물</h4></div>
            </div>
        </div>

        <ul class="mList">
            <li class="current" data-tab="tab1"><a class="on">전체보기</a></li>
            <li class="m1" data-tab="tab2"><a>햄</a></li>
            <li class="m1" data-tab="tab3"><a>치즈</a></li>
            <li class="m1" data-tab="tab4"><a>버터</a></li>
            <li class="m1" data-tab="tab5"><a>우유</a></li>

        </ul>
    </div>
    <!-- 단일상품 타이틀 end-->

    <!-- 전체보기 -->
    <div style="width: 1200px; display: flex; margin: 0 auto;">
        <div id="tab1" class="product current">
        <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>

          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
    </div>
</div>
    <!-- 상품 (전체 end)-->

    <!-- 국산과일 start-->
    <div style="width: 1200px; display: flex; margin: 0 auto;">
        <div id="tab2" class="product">
        <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>

          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
    </div>
</div>
    <!-- 국산과일 end-->

    <!-- 수입과일  -->
    <div style="width: 1200px; display: flex; margin: 0 auto;">
        <div id="tab3" class="product">
        <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>

          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
    </div>
</div>
    <!-- 수입과일 end-->

    <!-- 냉동.건과일 start -->
    <div style="width: 1200px; display: flex; margin: 0 auto;">
        <div id="tab4" class="product">
        <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>

          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
    </div>
</div>


    <!-- 냉동.건과일end -->

    <!-- 양파 마늘 생강 파 s-->
    <div style="width: 1200px; display: flex; margin: 0 auto;">
        <div id="tab5" class="product">
        <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>

          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
          <div class="row" style="width: 1100px; display: flex; margin: 0 auto; margin-top: 15px;">

            <div class="col-lg-3 col-md-6 mb-4" >
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품1</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품2</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품3</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">상품4</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
    
          </div>
    </div>
</div>
<!-- 양파 마늘 생강 파 end-->


        
    <!-- 페이징 처리 -->
    <div class="pagination">
            
        <img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img">
       
        <span class="pagenum_currentpage">1</span>
        <span class="pagenum">2</span>
        <span class="pagenum">3</span>
        <span class="pagenum">4</span>
        <span class="pagenum">5</span> 
   
        
        <img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img">
    </div> 
    <!-- 페이징처리 end-->

    <!--검색창-->
    <fieldset>
        <input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" id="keyword">
        <a href="javascript:;" class="btn_srch">검색</a>
    </fieldset>
    <!-- 검색창 ends-->


	</div>
    <!--상품 end -->

    <!-- 탭 메뉴 스크립트-->
	<script>
		$(function() {
			$('ul.mList li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.mList li').removeClass('current');
				$('.product').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			})
		});
	</script>
</body>
</html>