<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/basket.css">
    <script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
      <!-- 헤더부분-->
      <%@include file="../common/header.jsp" %>

  <div id="mypageTop">
        <div id="topContent">
            <div id="user">
                <span id="gradeArea">
                    <span id="grade">${ loginUser.mem_grade }</span>
                </span> 
                <div id="nameArea" style="margin-left:0px;">
                	<div style="margin: 10px;">
                		<label id="lblname" style="position: relative; top: 1.5px;">${ loginUser.mem_name }</label> 
                		<label style="font-size: 14px;margin-top: 14px;position: relative;top: 3.5px;">님</label><br>
                	</div>
                 	<br><br>
                    <button id="allgrade" onclick="gradebtn()">전체등급 보기</button> 
                </div>   
            </div>
            <div id="order">
                <img src="resources/img/truck.png" style="height:50px; width:50px; border-radius: 100%; cursor: pointer;" onclick="location.href='mypageorder'"><br>
                <label style="cursor: pointer;" onclick="location.href='mypageorder'">주문 · 배송</label><br>
                <label id="ordernum"  style="cursor: pointer;" onclick="location.href='mypageorder'">0</label>
            </div>
            <div id="point">
                <img src="resources/img/point.png" style="height:50px; width:50px; border-radius: 100%;" onclick="location.href='mypagepoint'"><br>
                <label style="cursor: pointer;" onclick="location.href='mypagepoint'">적립금</label><br>
                <label style="cursor: pointer;" id="pointnum" onclick="location.href='mypagepoint'">0</label>
                <label style="cursor: pointer;" onclick="location.href='mypagepoint'">원</label>
            </div>
            <div id="good">
                <img src="resources/img/good.png" style="height:50px; width:50px; border-radius: 100%;" onclick="location.href='mypageloverecipe'"><br>
                <label style="cursor: pointer;"  onclick="location.href='mypageloverecipe'">찜한 레시피</label><br>
                <label style="cursor: pointer;" id="goodnum"  onclick="location.href='mypageloverecipe'">0</label>
            </div>
        </div>   
    </div>

    <div id="gradeModal">
        <div id="gradeContent">
            <div>
                <button type="button" class="btn_close1 off" onclick="closebtn()" style="float: right;margin-right: 20px;">레이어닫기</button>
                <h2 style="text-align: left; margin: 35px;">회원 등급별 혜택</h2>
            </div>
            <div>
            <table id="gradetbl">
                <thead>
                    <tr>
                        <th class="grade_th" style="width: 80px;font-weight: 100;">회원 등급</th>
                        <th class="grade_th t1"><img src="resources/img/silver.PNG" width="45px; height:45px;"><br>Silver</th>
                        <th class="grade_th t2"><img src="resources/img/gold.PNG" width="45px; height:45px;"><br>Gold</th>
                        <th class="grade_th t2"><img src="resources/img/Platinum.PNG" width="45px; height:45px;"><br>Platinum</th>
                        <th class="grade_th"><img src="resources/img/dia.PNG" width="45px; height:45px;"><br>Diamond</th>
                    </tr>
                    <tr>
                        <td class="grade_td">기준</td>
                        <td class="grade_td t1 font1">전월 결제<br> 20만원 미만</td>
                        <td class="grade_td t2 font2">전월 결제<br> 20만원 이상</td>
                        <td class="grade_td t2 font2">전월 결제<br> 40만원 이상</td>
                        <td class="grade_td font2">전월 결제<br> 60만원 이상</td>
                    </tr>
                    <tr>
                        <td>적립률</td>
                        <td class="grade_td t1 font1">결제 금액의 0.5%</td>
                        <td class="grade_td t2 font2">결제 금액의 1%</td>
                        <td class="grade_td t2 font2">결제 금액의 3%</td>
                        <td class="grade_td font2">결제 금액의 5%</td>
                    </tr>
                </thead>
            </table>
            <div id="caution_Content">
                <p style="font-weight:bold; font-size: 14px;">주의사항</p>
                <p>※멤버십 등급은 등급산정금액 기준으로 산정되며, 180일 동안 유지됩니다.</p>
                <p>(할인가 구매시 결제가 기준으로 적용)</p>
                <p style="color: rgb(196, 2, 2);">※등급 조건 충족 시, 익일 승급됩니다.</p>   
                <p>※회원 정보가 있어야만 구매 이력을 관리할 수 있으므로 반드시 회원가입을 하셔야 합니다.</p>
                <p>※취소 및 반품 시 등급변동(등급하향)이 있을 수 있습니다.</p>
                <p>※등급변동의 경우, 최대 24시간 소요될 수 있습니다.</p>
            </div>
        </div>
        </div>
    </div>
    
    <script>
	  //모달창 
	    function gradebtn(){
	        $("#gradeModal").show();
	    }
	
	    function closebtn(){
	        $('#gradeModal').css("display",'none');
	    }
    </script>
</body>
</html>