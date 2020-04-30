<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
                    <a href="myorderlist.bo?mem_num=${loginUser.mem_num}">주문 내역</a>
               </li>
               <li>
                   <a href="mypagereview">상품후기</a>
               </li>
               <li> 
                   <a href="mypageloverecipe.bo?mem_num=${loginUser.mem_num}">찜한 레시피</a>
               </li>
               <li class="on">
                    <a href="informationchange">개인 정보 수정</a>
               </li>
           </ul>
       </div>
    </div>
     
      <!-- 개인정보 수정 부분-->
    <form action="mupdate.do" method="post" id="joinForm">
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
                    <td class="td2"><input type="text" name="mem_id" class="input" value="${ loginUser.mem_id }" style="padding: 0 9px; width: 280px; border: 1px solid #d4d4d4; color: #d4d4d4;" readonly></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">현재비밀번호</td>
                    <td class="td2"><input type="password" id="pwd" class="input" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3">
                    	<label id="lbl"></label>
                    </td>
                </tr>
                 <tr>
                    <td class="td1">새 비밀번호</td>
                    <td class="td2"><input type="password" name="mem_pwd" id="MEM_PWD" class="input" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">새 비밀번호 확인</td>
                    <td class="td2"><input type="password" name="newpassword_ok" id="MEM_PWD1" class="input" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3">
                    	<span id="pwCheckF" style="color: green;padding-left: 20px;" ></span>
                    	<span id="pwCheckFF" style="color:red;padding-left: 20px;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">이름*</td>
                    <td class="td2"><input type="text" name="mem_name" class="input" value="${ loginUser.mem_name }" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">이메일*</td>
                    <td class="td2"><input type="text" name="mem_email" class="input" value="${ loginUser.mem_email }" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">휴대폰*</td>
                    <td class="td2"><input type="text" name="mem_phone" class="input" value="${ loginUser.mem_phone }" style="padding: 0 9px; width: 280px;"></td>
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
                    <c:choose>
					<c:when test="${ loginUser.mem_gender eq '남' }">	
                        <input type="radio" name="mem_gender" id="man" checked style=" position: relative; top: 1.5px;" value="남"/><label for="man" style="position: relative;top: -1.5px;font-size:13px;" >남자</label>&nbsp;
                        <input type="radio" name="mem_gender" id="woman"  style=" position: relative; top: 1.5px;"  value="여"/><label for="woman" style="position: relative;top: -1.5px;font-size:13px;">여자</label>
                	</c:when>
                	<c:when test="${ loginUser.mem_gender eq '여' }">
                        <input type="radio" name="mem_gender" id="man" style=" position: relative; top: 1.5px;" value="남"/><label for="man" style="position: relative;top: -1.5px;font-size:13px;">남자</label>&nbsp;
                        <input type="radio" name="mem_gender" id="woman" checked style=" position: relative; top: 1.5px;" value="여"/><label for="woman" style="position: relative;top: -1.5px;font-size:13px;">여자</label>
           			</c:when>
           			<c:otherwise>
           				<input type="radio" name="mem_gender" id="man" style=" position: relative; top: 1.5px;" value="남"/><label for="man" style="position: relative;top: -1.5px;font-size:13px;">남자</label>&nbsp;
                        <input type="radio" name="mem_gender" id="woman" style=" position: relative; top: 1.5px;" value="여"/><label for="woman" style="position: relative;top: -1.5px;font-size:13px;">여자</label>
                        </c:otherwise>
					</c:choose>
                    </td>
                    <td class="td3"></td>
                </tr>

				<tr>
                    <td class="td1">생년월일</td>
                    <td class="td2"><input type="text" name="mem_birth" class="input" placeholder="  YYMMDD" value="${ loginUser.mem_birth }" style="padding: 0 9px; width: 280px;"></td>
                    <td class="td3"></td>
                </tr>  
            </table>
        </div>
        <div class="field_head head_type2">
            <h3 class="tit">이용약관동의*&nbsp;&nbsp;<label style="font-size: 12px; font-weight: lighter;">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</label></h3>
            
        </div>
           
        <div class="boardWrite">

			<div class="check_view" id="view_check">
				<label class="select_check check_agree "></label>
					<c:if test="${loginUser.mem_sms_agree eq 'Y' && loginUser.mem_email_agree eq 'Y'}">
						<input type="checkbox" id="sms_email" checked name="marketing">
					</c:if>
					<c:if test="${loginUser.mem_sms_agree ne 'Y' || loginUser.mem_email_agree ne 'Y'}">
						<input type="checkbox" id="sms_email" name="marketing">
					</c:if>
					<label for="sms_email">무료배송, 할인쿠폰 등 혜택/정보 수신</label> <span class="sub" style="float: left;"></span>(선택)
				<div class="check_event email_sms" style="margin-left: 30px;margin-top:5px;">
					<label class="select_check check_agree"  style="margin-right: 5px;"></label>
						<c:if test="${loginUser.mem_sms_agree eq 'Y'}">
							<input type="checkbox" id="smsok" checked class="styled-checkbox-black">
						</c:if>
						<c:if test="${loginUser.mem_sms_agree ne 'Y'}">
							<input type="checkbox" id="smsok" class="styled-checkbox-black">
						</c:if>
						<label for="smsok">SMS</label>				
					<label class="select_check check_agree"></label>
						<c:if test="${loginUser.mem_email_agree eq 'Y'}">
							<input type="checkbox" id="emailok" checked class="styled-checkbox-black">
						</c:if>
						<c:if test="${loginUser.mem_email_agree ne 'Y'}">
							<input type="checkbox" id="emailok" class="styled-checkbox-black">
						</c:if>
						<label for="emailok">이메일</label>
				</div>
			</div>
			 <input type="hidden" id="input_sms" class="checkcbox" checked name="mem_sms_agree">
             <input type="hidden" id="input_email" class="checkcbox"  name="mem_sms_agree"> 

        </div>
        
        <div id="avoidDbl" class="after" style="text-align:center;">
        	<c:url var="mdelete" value="mdelete.do">
				<c:param name="id" value="${ loginUser.mem_id }"/>
			</c:url>
			<%-- <input type="button" onclick="location.href='${ mdelete }';">탈퇴하기</button> --%>
            <input type="button" id="dropbtn" value="탈퇴하기"></button>&nbsp;&nbsp;
            <button id="changebtn" onclick="changebtn();"> <!--  onclick="location.href='join.html'" -->회원정보수정</button>
        </div>
    </div>
    
   
   
    </form>
 </div>
 
 	<!-- 회원 탈퇴 -->
    <script>
        $("#dropbtn").click(function(){
        	$('#joinForm').attr('action','mdelete.do');
            if (confirm("정말 탈퇴 하시겠습니까??") == true){    //확인
            	$.ajax({
                	url:"mdelete.do"
                	, type:"post"
                	, data:{id:"${loginUser.mem_id}"}
                	, success:function(){
                		//alert("성공");
                		window.location.replace("home.do");
                	}
                	, error:function(){
                		alert("회원탈퇴 실패");
                		window.location.replace("home.do");
                	}
                })
         }else{   //취소
             return false;
         } 
     });
        
        
    </script> 
    
    <!-- 선택 동의  -->
    <script>
    window.onload = function() {
        var agreepage = document.getElementById('view_check');
        var check = agreepage.getElementsByTagName('input');
        agreepage.addEventListener('click',function(e) {
            var target = e.target,
            checkNum = 0;
            if(target === check[0]) {
                if(target.checked) {
                    for(var i=1; i<check.length; i++) {
                        check[i].checked = true;
                    };
            } else {
                for(var i=1; i<check.length; i++) {
                    check[i].checked = false;
                };
            };
        } else {
            for(var i=1; i<check.length; i++) {
                if(check[i].checked) {
                    checkNum++;
                };
            };
            if(checkNum >= check.length - 1) {
                check[0].checked = true;
            } else {
                check[0].checked = false;
            };
        };
    });
    };
      
    
    //새 비밀번호 중복확인
	$(document).ready(function(){
		$('#MEM_PWD').keyup(function(){
			if($('#MEM_PWD').val()!=$('#MEM_PWD1').val()){
				$('#pwCheckFF').text(''); 
				$('#pwCheckFF').html("패스워드  불일치"); 
			}else{ 
				$('#pwCheckFF').text(''); 
				$('#pwCheckFF').html("<font color='green'>패스워드 일치</font>");
			} 
		}); 
		
		$('#MEM_PWD1').keyup(function(){
			if($('#MEM_PWD').val()!=$('#MEM_PWD1').val()){
				$('#pwCheckFF').text(''); 
				$('#pwCheckFF').html("패스워드  불일치"); 
			}else{ 
				$('#pwCheckFF').text(''); 
				$('#pwCheckFF').html("<font color='green'>패스워드 일치</font>");
			} 
		}); 
	}); 
    
	//새 비밀번호 실시간 유효성 체크 
	function pwCheck(MEM_PWD){ 
		$.ajax({ 
			type:"POST", 
			url: "pwCheck.do", 
			data : { mem_pwd: MEM_PWD }, 
			success:function(result){
				if(result == true){ 
					pwCheckF.innerHTML = "유효성 체크 문제 없음"; 
				}else{ 
					pwCheckF.innerHTML = "유효성 체크 범위 벗어남"; 
				} 
			}, 
		error:function(request,status){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			} 
			});
		}
    

		$("#pwd").change(function(){
	  		var pwd1 = $("#pwd").val();
	  		var pwd2 = ${ sessionScope.loginUser.mem_pwd  };
	  		
	  		if(pwd1 != ""){
	  			if(pwd1 == pwd2){
	  				$('#lbl').html("현재 비밀번호가 일치합니다.").css('color','green'); 
	  	  		}else{
	  	  			$('#lbl').html("현재 비밀번호를 확인해주세요").css('color','red'); 		
	  	  		}	
	  		}
		});
		
		 $("#changebtn").click(function(){
		    	var pwd1 = $("#pwd").val(); // 현재 비밀번호
		    	var pwd2 = $("#MEM_PWD").val(); // 새 비밀번호
		    	var pwd3 = $("#MEM_PWD1").val(); // 새 비밀번호 확인
		    	
		    	var pwd4 = ${ sessionScope.loginUser.mem_pwd };
		    	
	    		if(pwd1 == "" && pwd2 == "" && pwd3 == ""){ //세칸 다 비었을 경우
	    			 $('#MEM_PWD').val(pwd4);		
	    			location.href="mupdate.do";
	    			
	    		}else if(pwd1 == pwd4 && pwd2 == pwd3){ // 현재 비밀번호 , 새 비밀번호/새 비밀번호 확인이 맞을경우
	    			alert("회원정보 수정 완료");
	    			location.href="mupdate.do";
	    		}else if(pwd1 == pwd4 && pwd2 != pwd3){ // 현재 비밀번호는 맞고 새 비밀번호 / 새 비밀번호 확인이 틀릴경우
	    			alert("새 비빌번호를 확인해 주세요 ")
	    			return false;
	    		}else if(pwd1 != pwd4 && pwd2 != pwd3){ // 현재 비밀번호, 새 비밀번호/ 새 비밀번호 확인이 틀릴경우
	    			alert("새 비빌번호를 확인해 주세요 ")
	    			return false;
	    		}else if(pwd1 != pwd4 && pwd2 == pwd3){ // 현재 비밓번호는 틀리고, 새 비밀번호, 새 비밀번호 확인이 맞을경우
	    			alert("현재 비빌번호를 확인해 주세요 ")
	    			return false;
	    		}
	    		
                if(document.getElementById("smsok").checked== true){
    				document.getElementById("input_sms").value="Y"
    			}else{
    				document.getElementById("input_sms").value="N"
    			}
                
                if(document.getElementById("emailok").checked== true){
    				document.getElementById("input_email").value="Y"
    			}else{
    				document.getElementById("input_email").value="N"
    			}
		   });
	   
	</script>
	
</body>
</html>