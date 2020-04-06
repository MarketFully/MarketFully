<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/point.css">
    <script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
      <!-- 헤더부분-->
      <%@include file="../common/mypageheader.jsp" %>

   <!--마이페이지 왼쪽 부분-->
    <div class="page_aticle aticle_type2">
        <div id="snb" class="snb_my">
	       <h2 class="tit_snb">마이컬리</h2>
	       <div class="inner_snb">
	           <ul class="list_menu_left">
	               <li>
	                   <a href="mypageorder">주문 내역</a>
	               </li>
	               <li>
	                   <a href="mypagereview">상품후기</a>
	               </li>
	               <li  class="on">
	                   <a href="mypagepoint">적립금</a>
	               </li>
	               <li> 
	                    <a href="mypageloverecipe">찜한 레시피</a>
	               </li>
	               <li>
	                    <a href="mypagechange">개인 정보 수정</a>
	               </li>
	           </ul>
	       </div>
    	</div>

      <!-- 적립금 부분 -->
    <div class="page_section section_point">
        <div class="head_aticle">
            <h2 class="tit">적립금 
                <span class="tit_sub">보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</span>
            </h2>
        </div>

        <div id="viewPointList">
            <div class="point_header">
                <div class="point_view">
                    <span class="subject no_day">현재 적립금</span>
                     <strong class="point">1,053 
                         <span style="float:none;margin-right:0px;" class="won">원</span>
                    </strong>
                </div> 
                <span class="disappear" style="float: none;">
                    <span class="subject no_day">                    
                        소멸예정 적립금 
                    </span> 
                    <span class="num" style="width: 176px;padding: 32px 44px 36px 0;">0 원</span> 
                </span>
            </div> 
            <table class="tbl tbl_type1" style="border-top: 2px solid #2e8b57; border-collapse: collapse">
                <thead>
                    <tr>
                        <th class="date">날짜</th> 
                        <th class="info">내용</th> 
                        <th class="expiration">유효기간</th> 
                        <th class="point">금액</th>
                    </tr>
                </thead> 
                <tbody>
                    <tr>
                        <td class="date">19.08.14</td> 
                        <td class="info">
                            <a href="orderdetail" class="link">[구매적립] 주문(1565671899735) 0.5% 적립</a> 
                        </td> 
                        <td class="expiration">
                            <span style="float:none;margin-right:0px;">20.09.30</span>
                        </td> 
                        <td class="point">
                            <span style="float:none;margin-right:0px;">+</span>100 원        
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
      </div>
    </div>
</body>
</html>