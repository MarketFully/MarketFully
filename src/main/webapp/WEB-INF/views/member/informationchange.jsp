<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/join.css">
    <link rel="stylesheet" href="resources/css/informationchange.css">
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
               <li>
                  <a href="mypagepoint">적립금</a>
               </li>
               <li> 
                    <a href="mypageloverecipe">찜한 레시피</a>
               </li>
               <li class="on">
                    <a href="mypagechange">개인 정보 수정</a>
               </li>
           </ul>
       </div>
    </div>
     
      <!-- 개인정보 수정 부분-->
    <div class="page_section section_myinfo" style="text-align:left;ipo">
        <div class="head_aticle" style="margin-bottom: 0px;">
            <h2 class="tit" style="margin-left: 0px; margin-bottom: 0px;">개인 정보 수정</h2>
            <label>기본 정보</label>
            <label style="float: right; font-size: 10px;">*필수입력사항</label>
        </div>
        <div class="boardWrite">
            <table class="tbl">
                <tr>
                    <td class="td1">아이디*</td>         
                    <td class="td2"><input type="text" name="input_id" class="input"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">현재비밀번호</td>
                    <td class="td2"><input type="password" name="password" class="input"></td>
                    <td class="td3"></td>
                </tr>
                 <tr>
                    <td class="td1">새 비밀번호</td>
                    <td class="td2"><input type="password" name="newpassword" class="input"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">새 비밀번호 확인</td>
                    <td class="td2"><input type="password" name="newpassword_ok" class="input"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">이름*</td>
                    <td class="td2"><input type="text" name="input_name" class="input"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">이메일*</td>
                    <td class="td2"><input type="text" name="input_email" class="input"></td>
                    <td class="td3"><button id="emailbtn" onclick="location.href='#'" class="btn">인증번호받기</button></td>
                </tr>
                <tr>
                    <td class="td1">휴대폰*</td>
                    <td class="td2"><input type="text" name="input_phone" class="input"></td>
                    <td class="td3"></td>
                </tr>
            </table>
        </div>
        <div class="field_head head_type2">
            <h3 class="tit">추가정보</h3>
        </div>
        <div class="boardWrite">
			<table>

                <tr>
                    <td class="td1">성별</td>
                    <td class="td2">
                        <input type="radio" name="radio" id="man"/><label for="man">남자</label>&nbsp;
                        <input type="radio" name="radio" id="woman"/><label for="woman">여자</label></td>
                    <td class="td3"></td>
                </tr>

				<tr>
                    <td class="td1">생년월일</td>
                    <td class="td2"><input type="text" name="input_birthday" class="input" placeholder="  YY/MM/DD"></td>
                    <td class="td3"></td>
                </tr>  
            </table>
        </div>
        <div class="field_head head_type2">
            <h3 class="tit">이용약관동의*&nbsp;&nbsp;<label style="font-size: 12px; font-weight: lighter;">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</h3>
            
        </div>
           
        <div class="boardWrite">

			<div class="check_view">
				<label class="select_check check_agree "></label>
					<input type="checkbox" id="sms_email" name="marketing">
					<label for="sms_email">무료배송, 할인쿠폰 등 혜택/정보 수신</label> <span class="sub" style="float: left;"></span>(선택)
				</label>
				<div class="check_event email_sms" style="margin-left: 30px;margin-top:5px;">
					<label class="select_check check_agree"  style="margin-right: 5px;">
						<input type="checkbox" id="smsok" name="sms" class="styled-checkbox-black" value="n">
						<label for="smsok">SMS</label>
					</label>
					<label class="select_check check_agree">
						<input type="checkbox" id="emailok" name="mailling" class="styled-checkbox-black" value="n">
						<label for="emailok">이메일</label>
					</label>
				</div>
			</div>

        </div>
        
        <div id="avoidDbl" class="after" style="text-align:center;">
            <button id="dropbtn" onclick="location.href='main.html'">탈퇴하기</button>&nbsp;&nbsp;
            <button id="changebtn" onclick="location.href='join.html'">회원정보수정</button>
        </div>
    </div>
 </div>
     <!-- 전체동의 -->
     <script>
        $("#sms_email").click(function(){
        var chk = $("#sms_email").prop("checked");
        if(chk) {
        $(".styled-checkbox-black").prop("checked", true);
        } else {
        $(".styled-checkbox-black").prop("checked", false);
        }
    });
    </script>

    <!-- 전체동의가 체크되있을 때 하나라도 풀리면 해제 -->
    <script>           
        $(".styled-checkbox-black").click(function(){
        $("#sms_email").prop("checked", false);
        });
    </script>

    <!--탈퇴하기 버튼 클릭시-->
    <script>
        $("#dropbtn").click(function(){
            if (confirm("정말 탈퇴 하시겠습니까??") == true){    //확인
         }else{   //취소
             return false;
         }  
     });
    </script>
</body>
</html>