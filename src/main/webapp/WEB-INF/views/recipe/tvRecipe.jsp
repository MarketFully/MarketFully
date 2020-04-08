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
		ㅏㅓㅗ라ㅗㅎ라ㅓㅎ
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
		$('ul .tab').children().attr('class','current');
		
	});
	
	
	
</script>
`
    <!-- 레시피 목록 반복문으로 돌린다 -->
	<div id="topRecipe">
        <div class="TopMenu">
		    <ul class="tab" style="margin-top: 30px;">
		    	<c:forEach var="clist" items="${clist }">
		    		<li><a href="javascript:tabChange(${clist.mc_cate_num});">${clist.mc_name }</a></li>
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
                
                	<c:forEach var="b" items="$(blist)">
	                    <tr>
	                    <%-- 
	                        <td>${b.MB_NUM} }</td>
	                        <td class="menu"><img src="resources/img/menu1.png" class="mimg"><p class="mtitle">"${b.MB_TITLE }" (${b.MB_RCOUNT }) </p></td>
	                        <td>${b.MB_WRITER }</td>
	                        <td>${b.MB_CDATE }</td>
	                        <td>${b.MB_COUNT }</td>
	                     --%>    
	                    </tr>
	                 </c:forEach>
	                    
                </tbody>
            </table>
		</div>

		<div id="tab2" class="toptenTab">
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
                    <tr>
                        <td>1</td>
                        <td class="menu"><img src="resources/img/menu1.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
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
                        <td class="menu"><img src="resources/img/menu3.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2017.08.30</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="menu"><img src="resources/img/menu4.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2020.02.28</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>5</td> 
                        <td class="menu"><img src="resources/img/menu5.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2020.01.20</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>6</td> 
                        <td class="menu"><img src="resources/img/menu6.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2018.08.07</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>7</td> 
                        <td class="menu"><img src="resources/img/menu7.png" class="mimg"><p class="mtitle"> <수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2020.01.01</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>8</td> 
                        <td class="menu"><img src="resources/img/menu8.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2019.07.10</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>9</td> 
                        <td class="menu"><img src="resources/img/menu9.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2020.02.01</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>10</td> 
                        <td class="menu"><img src="resources/img/menu10.png" class="mimg"><p class="mtitle"><수미네 반찬> "LA 갈비찜"</p></td>
                        <td>admin</td>
                        <td>2020.02.06</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="tab3" class="toptenTab">
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
                    <tr>
                        <td>1</td>
                        <td class="menu"><img src="resources/img/menu1.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이" </p></td>
                        <td>admin</td>
                        <td>2018.07.07</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="menu"><img src="resources/img/menu2.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2019.10.10</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="menu"><img src="resources/img/menu3.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2017.08.30</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="menu"><img src="resources/img/menu4.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2020.02.28</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>5</td> 
                        <td class="menu"><img src="resources/img/menu5.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2020.01.20</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>6</td> 
                        <td class="menu"><img src="resources/img/menu6.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2018.08.07</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>7</td> 
                        <td class="menu"><img src="resources/img/menu7.png" class="mimg"><p class="mtitle"> <현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
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
                        <td class="menu"><img src="resources/img/menu9.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2020.02.01</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>10</td> 
                        <td class="menu"><img src="resources/img/menu10.png" class="mimg"><p class="mtitle"><현지에서 먹힐까? 중국편>"짜장 떡볶이"</p></td>
                        <td>admin</td>
                        <td>2020.02.06</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="tab4" class="toptenTab">
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
                    <tr>
                        <td>1</td>
                        <td class="menu"><img src="resources/img/menu1.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면" </p></td>
                        <td>admin</td>
                        <td>2018.07.07</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="menu"><img src="resources/img/menu2.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"</p></td>
                        <td>admin</td>
                        <td>2019.10.10</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="menu"><img src="resources/img/menu3.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"</p></td>
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
                        <td class="menu"><img src="resources/img/menu5.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"</p></td>
                        <td>admin</td>
                        <td>2020.01.20</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>6</td> 
                        <td class="menu"><img src="resources/img/menu6.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"ㄴ</p></td>
                        <td>admin</td>
                        <td>2018.08.07</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>7</td> 
                        <td class="menu"><img src="resources/img/menu7.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"</p></td>
                        <td>admin</td>
                        <td>2020.01.01</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>8</td> 
                        <td class="menu"><img src="resources/img/menu8.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"</p></td>
                        <td>admin</td>
                        <td>2019.07.10</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>9</td> 
                        <td class="menu"><img src="resources/img/menu9.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"</p></td>
                        <td>admin</td>
                        <td>2020.02.01</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>10</td> 
                        <td class="menu"><img src="resources/img/menu10.png" class="mimg"><p class="mtitle"><최고의 요리비결> "유산슬라면"</p></td>
                        <td>admin</td>
                        <td>2020.02.06</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- tv 속 레시피 탭 별로 end-->

        
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
</html></html>