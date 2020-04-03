<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="topImgdiv"><img src="resources/img/winner.png" class="topImg"></div>
                <div class="Ttitle"><h4>TOP10 레시피</h4></div>
            </div>
        </div>
    </div>
    <!-- top10 메뉴 타이틀 end-->


	<div id="topRecipe">
        <div class="TopMenu">
		<ul class="tab" style="margin-top: 30px;">
			<li class="current" data-tab="tab1"><a href="#">TV 속 레시피</a></li>
			<li data-tab="tab2"><a href="#">사용자 레시피</a></li>
		</ul>
        </div>
		<div id="tab1" class="toptenTab current">
			<table class="recipe" id="tv_recipe">
                <thead>
                    <tr>
                        <th class="col">순위</th>
                        <th class="colT">제목</th>
                        <th class="col">작성자</th>
                        <th class="col">작성일</th>
                        <th class="col">조회수</th>
                    </tr>
                </thead>
                <tbody class="item">
                    <tr onclick="location.href='RecipeDetail'">
                        <td>1</td>
                        <td class="menu"><img src="resources/img/menu1.png" class="mimg"><p class="mtitle"><강식당2> "김치밥이 피오씁니다." </p></td>
                        <td>admin</td>
                        <td>2018.07.07</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="menu"><img src="resources/img/menu2.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2019.10.10</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="menu"><img src="resources/img/menu3.png" class="mimg"><p class="mtitle"><냉장고를 부탁해> "이연복 까르복나라"</p></td>
                        <td>admin</td>
                        <td>2017.08.30</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="menu"><img src="resources/img/menu4.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"</p></td>
                        <td>admin</td>
                        <td>2020.02.28</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>5</td> 
                        <td class="menu"><img src="resources/img/menu5.png" class="mimg"><p class="mtitle"><백종원>"분식집st 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2020.01.20</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>6</td> 
                        <td class="menu"><img src="resources/img/menu6.png" class="mimg"><p class="mtitle"><집밥 백선생 시즌3>"꽃게찜"</p></td>
                        <td>admin</td>
                        <td>2018.08.07</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>7</td> 
                        <td class="menu"><img src="resources/img/menu7.png" class="mimg"><p class="mtitle"><살림 9단의 만물상>"신효섭의 다이어트 찜닭"</p></td>
                        <td>admin</td>
                        <td>2020.01.01</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>8</td> 
                        <td class="menu"><img src="resources/img/menu8.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2019.07.10</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>9</td> 
                        <td class="menu"><img src="resources/img/menu9.png" class="mimg"><p class="mtitle"><알토란>"김하진의 소고기떡국"</p></td>
                        <td>admin</td>
                        <td>2020.02.01</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>10</td> 
                        <td class="menu"><img src="resources/img/menu10.png" class="mimg"><p class="mtitle"><백종원>"고추 마늘 치킨"</p></td>
                        <td>admin</td>
                        <td>2020.02.06</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table>
		</div>

		<div id="tab2" class="toptenTab">
			<table class="recipe" id="tv_recipe">
                <thead>
                    <tr>
                        <th class="col">순위</th>
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
        


	</div>
    <!--top 10 레시피 end-->

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