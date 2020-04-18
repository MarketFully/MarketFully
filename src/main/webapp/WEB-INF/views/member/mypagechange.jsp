<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/change.css">
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
                    <a href="myorderlist.bo?mem_num=${loginUser.mem_num}">주문 내역</a>
               </li>
               <li>
                   <a href="mypagereview">상품후기</a>
               </li>
               <li>
                  <a href="mypagepoint">적립금</a>
               </li>
               <li> 
                     <a href="mypageloverecipe.bo?mem_num=${loginUser.mem_num}">찜한 레시피</a>
               </li>
               <li class="on">
                    <a href="mypagechange">개인 정보 수정</a>
               </li>
           </ul>
       </div>
    </div>
     
      <!-- 개인정보 수정하기 위해 비밀번호 확인-->
    <div class="page_section section_myinfo">
        <div class="head_aticle">
            <h2 class="tit">개인 정보 수정</h2>
        </div>

    <div class="conf_pw">
        <div class="tit">
            <h3 style="font-size: 20px;"><b>비밀번호 재확인</b></h3>
            <h5>회원님의 소중한 정보를 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</h5>
        </div>
        <div class="field_pw">
            <table style="margin: 0 255px 0 255px;">
                <tr>
                    <td style="width: 100px;"> <div class="tit_id">아이디</div></td>
                    <td style="width: 200px;"><span style="float:none;margin-right:0px;" class="txt_id">${ sessionScope.loginUser.mem_id }</span></td>
                </tr>
                <tr>
                    <td style="width: 100px;"><div class="tit_pw">비밀번호</div></td>
                    <td style="width: 200px;">  <div>
                       
                        <input type="password" name="confirm_password" id="confirm_password" class="inp_pw">
                    </div></td>
                </tr>
            </table>

        </div>
        
        <div class="group_btn">
            <span style="float:none;margin-right:0px;" class="inner_groupbtn">
                <button type="submit" class="btn btn_positive" id="okbtn">확인</button>
            </span>
        </div>
      </div>
    </div>
  </div>
  
  <script>
  	$("#okbtn").click(function(){
  		var pwd1 = $("#confirm_password").val();
  		var pwd2 = ${ sessionScope.loginUser.mem_pwd };
  		
  		
  		if(pwd1 != ""){
  			if(pwd1 == pwd2){
  	  			location.href="informationchange";
  	  		}else{
  	  			alert("비밀번호가 일치하지 않습니다.");
  	  		}	
  		}else{
  			alert("비밀번호를 입력해주세요.");
  		}
  		
  	}) 
  </script>
</body>
</html>