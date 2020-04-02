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
            padding-top: 70px;
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
            border-bottom: 1px solid #dedede;
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


	</style>
    <link rel="stylesheet" href="resources/css/header.css">
    <!-- <link rel="stylesheet" href="css/topten.css"> -->
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->
</head>
<body>
    <!-- header-->
        <!-- header-->
    <%@include file="../common/header.jsp" %>
    <!-- header end-->
    <!-- header end-->

    <!-- 전체 카테고리 (ex : 한식 ) 타이틀 -->
    
    <div class="page_aticle">
        <div id="koreafood" class="KF_title">
            <div class="KF_inner">
                <div class="KF_main">
                    <span class="Kicon"><img src="resources/img/usa.png"></span>
                    <span class="kF_name">양식</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 전체 카테고리 (한식 ) 타이틀 end -->

    <!-- 전체 카테고리 목록 -->

    <div id="tab2" class="toptenTab" style="width: 1100px; margin: 0 auto;">
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
            <tbody class="item">
                <tr>
                    <td>1</td>
                    <td class="menu"><img src="resources/img/menu1.png" class="mimg"><p class="mtitle">순두부찌개 </p></td>
                    <td>admin</td>
                    <td>2018.07.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="menu"><img src="resources/img/menu2.png" class="mimg"><p class="mtitle">안동찜닭 황금레시피</p></td>
                    <td>admin</td>
                    <td>2019.10.10</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td class="menu"><img src="resources/img/menu3.png" class="mimg"><p class="mtitle">떡볶이</p></td>
                    <td>admin</td>
                    <td>2017.08.30</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td class="menu"><img src="resources/img/menu4.png" class="mimg"><p class="mtitle">찹스테이크</p></td>
                    <td>admin</td>
                    <td>2020.02.28</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>5</td> 
                    <td class="menu"><img src="resources/img/menu5.png" class="mimg"><p class="mtitle">스팸마요 덮밥</p></td>
                    <td>admin</td>
                    <td>2020.01.20</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>6</td> 
                    <td class="menu"><img src="resources/img/menu6.png" class="mimg"><p class="mtitle">치킨마요 덮밥</p></td>
                    <td>admin</td>
                    <td>2018.08.07</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>7</td> 
                    <td class="menu"><img src="resources/img/menu7.png" class="mimg"><p class="mtitle">야채볶음밥 달걀말이</p></td>
                    <td>admin</td>
                    <td>2020.01.01</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>8</td> 
                    <td class="menu"><img src="resources/img/menu8.png" class="mimg"><p class="mtitle">목살간장볶음</p></td>
                    <td>admin</td>
                    <td>2019.07.10</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>9</td> 
                    <td class="menu"><img src="resources/img/menu9.png" class="mimg"><p class="mtitle">소불고기</p></td>
                    <td>admin</td>
                    <td>2020.02.01</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>10</td> 
                    <td class="menu"><img src="resources/img/menu10.png" class="mimg"><p class="mtitle">짜파구리</p></td>
                    <td>admin</td>
                    <td>2020.02.06</td>
                    <td>1</td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 전체 카테고리 end-->

    <!-- 페이징 처리 -->
    <div class="pagination">
            
        <img src="resources/img/arrow_left.png" alt="첫 페이지로 이동" class="firstpage_img">
       
        <span class="pagenum_currentpage">1</span>
        <span class="pagenum">2</span>
        <span class="pagenum">3</span>
        <span class="pagenum">4</span>
        <span class="pagenum">5</span> 
   
        
        <img src="resources/img/arrow_right.png" alt="이전 페이지로 이동" class="prevpage_img">
        

        <!-- <a href="javascript:;"><img src="images/next.png" alt="다음 페이지로 이동"  class="nextpage_img"></a>
        <a href="javascript:;"><img src="images/doublenext.png" alt="마지막 페이지로 이동" class="lastpage_img"></a> -->
    </div> 
    <!-- 페이징처리 end-->

    <fieldset>
        <input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" id="keyword">
        <a href="javascript:;" class="btn_srch">검색</a>
    </fieldset>


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