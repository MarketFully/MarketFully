<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>join</title>   
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/join.css">
    <script src="resources/js/jquery-3.4.1.min.js"></script>
    <script src="resources/js/join.js"></script>
    <style>
    	#agreeModal2{
		    display: none;
		    position: fixed;
		    z-index: 10; 
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: rgb(0,0,0);
		    background-color: rgba(0,0,0,0.4);
		    text-align: center;
		   
		}
		
		#allchkContent2{
		    height: 640px;
		    width: 440px;
		    border:none;
		    background-color: white;
		    border-radius: 5px;
		    font-size: 18px;
		    margin: 85px auto;
		    padding-top: 2px;
		    text-align: center;
		    display: inline-block
		}
		
		#Content2{
		    height: 350px;
		    overflow: scroll;
		    overflow-x: hidden;
		    font-size: 12px; 
		    text-align: left; 
		    margin: 70px 15px 0 18px;
		}
		
		input[type='checkbox']{
		    display:none; 
		    cursor:pointer;
		    
		}
		
		input[type='checkbox'] + label:before{
		    content: '\2714';
		    font-size: 12px;
		    border: 0.1em solid #2e8b57;
		    border-radius: 0.2em;
		    display: inline-block;
		    width: 1em;
		    height: 1em;
		    padding-left: 0.2em;
		    padding-bottom: 0.27em;
		    margin-right: 0.2em;
		    vertical-align: middle;
		    color: transparent;
		    transition: .1s;
		}
		
		
		
		input[type='checkbox']:checked + label:before{
		    background-color: #2e8b57;
		    border-color: #2e8b57;
		    color: #fff;
		}
		
		.check{
		    margin-left: 23px;
    </style>
</head>
<body  style="text-align:left;">
    <!-- 헤더부분-->
    <%@include file="../common/header.jsp" %>
    
    <!-- 회원가입부분 -->
    <div id="join_full">
        <h2 style="text-align: center; margin: 35px;">회원가입</h2><br>
        <div id="join_write"> 
            <table class="tbl">
                <tr>
                    <td class="td1">아이디*</td>         
                    <td class="td2"><input type="text" name="input_id" class="input" placeholder="  아이디" required></td>
                    <td class="td3"><button id="loginokbtn" onclick="location.href='main.html'" class="btn">중복확인</button></td>
                </tr>
                <tr>
                    <td class="td1">비밀번호*</td>
                    <td class="td2"><input type="password" name="password" class="input" placeholder="  비밀번호(8자이상)" required></td>
                    <td class="td3"></td>
                </tr>
                    <td class="td1">비밀번호확인*</td>
                    <td class="td2"><input type="password" name="password_ok" class="input" placeholder="  비밀번호 확인" required></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">이름*</td>
                    <td class="td2"><input type="text" name="input_name" class="input" placeholder="  이름" required></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">이메일*</td>
                    <td class="td2"><input type="text" name="input_email" class="input" placeholder="  이메일" required></td>
                    <td class="td3"><button id="emailbtn" onclick="location.href='main.html'" class="btn">인증번호받기</button></td>
                </tr>
                <tr>
                    <td class="td1"></td>
                    <td class="td2"><input type="text" name="email_ok" class="input"></td>
                    <td class="td3"><button id="emailokbtn" onclick="location.href='main.html'" class="btn" 
                    style="border:1px solid #2e8b57;background-color: white;border-radius: 5px;color: #2e8b57;">인증번호확인</button></td>
                </tr>
                <tr>
                    <td class="td1">휴대폰*</td>
                    <td class="td2"><input type="text" name="input_phone" class="input" placeholder="  휴대폰" required></td>
                    <td class="td3"></td>
                </tr>
                <tr>
                    <td class="td1">배송 주소</td>
                    <td class="td2"><button id="addressbtn" onclick="location.href='main.html'" class="btn">주소검색</button></td>
                    <td class="td3"></td>
                </tr>
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
        
            <hr>

            <div id="chk_agree">              
                <h3>이용약관동의*
                    <label style="font-size: 12px; color:rgb(155, 153, 153); font-weight: lighter;">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</label>
                </h3>
                <input type="checkbox" id="chk_all">
                <label for="chk_all">전체동의</label><br><br>
                <input type="checkbox" id="check1" class="checkcbox">
                <label for="check1" class="check">이용약관 동의</label>
                <label for="check1"  style="color:#9c9c9c;">(필수)</label>
                <button onclick="chkDetail1();" class="detailbtn">약관보기></button><br><br>
                <input type="checkbox" id="check2" class="checkcbox">
                <label for="check2" class="check">개인정보 수집 및 이용 동의</label>
                <label for="check2"  style="color:#9c9c9c;">(필수)</label>
                <button onclick="chkDetail2();" class="detailbtn">약관보기></button><br><br>  
                <input type="checkbox" id="check3" class="checkcbox">
                <label for="check3" class="check">본인은 만 14세 이상입니다.</label>
                <label for="check3" style="color:#9c9c9c;">(필수)</label><br><br>  
                <input type="checkbox" id="check5" class="checkcbox">
                <label for="check5" class="check">무료배송, 할인쿠폰 등 혜택/정보 수신</label>
                <label for="check5" style="color:#9c9c9c;">(선택)</label><br><br>
                <div class="check_event email_sms" style="margin-left: 30px;">
					<label class="select_check check_agree ">
                        <input type="checkbox" id="check6" class="checkcbox">
                        <label for="check6" class="check">SMS</label>
					</label>
					<label class="select_check check_agree ">
                        <input type="checkbox" id="check7" class="checkcbox">
                        <label for="check7" class="check">이메일</label>
					</label>
				</div>
            </div>
            <br>
            <table>
                <tr>
                    <td class="td1"></td>
                    <td class="td2">
                        <button type="submit" id="joinokbtn" onclick="Joinbtn()" class="okbtn">가입하기</button>
                    <td class="td3"></td>
                </tr>              
            </table>
        </div>   
    </div>

    <div id="agreeModal1">
       
        <div id="allchkContent">
            <h2 style="text-align: left; margin: 35px;">이용약관</h2>
            <div id="Content1">
            제1조(목적)<br>
            
            이 약관은 주식회사 컬리 회사(전자상거래 사업자)가 운영하는 인터넷사이트 마켓컬리(이하 "컬리"라 한다)에서 제공하는 전자상거래 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 컬리와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.<br>
            *PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다.
            <br><br>
            
            제2조(정의)<br>
            ① "컬리"란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.<br>
            ② "이용자"란 "컬리"에 접속하여 이 약관에 따라 "컬리"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
            ③ ‘회원’이라 함은 "컬리"에 회원등록을 한 자로서, 계속적으로 "컬리"가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
            ④ ‘비회원’이라 함은 회원에 가입하지 않고 "컬리"가 제공하는 서비스를 이용하는 자를 말합니다.<br>
            ⑤ "휴면회원"이라 함은 "컬리"의 ‘회원’중 1년 이상 서비스 이용 기록이 없는 자를 말합니다. 휴면 회원은 "컬리"의 정책에 따라 서비스 이용이 제한 될 수 있으며, 다시 서비스를 이용하기 위하여는 거래 안전 등을 위하여 "컬리"가 정하는 본인확인 절차 등을 이행하여야 올바른 ‘회원’의 서비스를 이용할 수 있습니다.
            <br><br>
            
            제3조 (약관 등의 명시와 설명 및 개정) <br>  
            ① "컬리"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호/모사전송번호/전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 컬리의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
            ② "컬리"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회/배송책임/환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>            
            ③ "컬리"는「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>           
            ④ "컬리"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "컬리"는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
            ⑤ "컬리"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 "컬리"에 송신하여 "컬리"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
            ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
        <br>
            </div>
            <br><br>
        <button onclick="allchkContentclose();" class="closebtn">확인</button>
        </div>
    </div>

    <div id="agreeModal2">
       
        <div id="allchkContent2">
            <h2 style="text-align: left; margin: 35px;">이용약관</h2>
            <div id="Content2">
                제1조 (수집하는 개인정보)<br>
                이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 풀리마켓 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 풀리마켓는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.<br>
                <br>
                회원가입 시점에 풀리마켓이 이용자로부터 수집하는 개인정보는 아래와 같습니다.
                - 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.<br>
                - 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.<br>
                서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
                풀리마켓 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.<br>
                <br>
                서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.<br>
                구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
                2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
                풀리마켓에서 제공하는 위치기반 서비스에 대해서는 '풀리마켓 위치정보 이용약관'에서 자세하게 규정하고 있습니다.<br>
                이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.<br><br>
                
                제2조 (수집한 개인정보의 이용)<br>
                풀리마켓 및 풀리마켓 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.<br>
                - 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.<br>
                - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.<br>
                - 법령 및 풀리마켓 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.<br>
                - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.<br>
                - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.<br>
                - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.<br>
                - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.<br><br>
                제3조 (개인정보의 파기)<br>
                회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.<br>
                단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.<br>         
                이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.<br>
                부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.<br>
                부정이용으로 징계를 받기 전에 회원 가입 및 탈퇴를 반복하며 서비스를 부정 이용하는 사례를 막기 위해 탈퇴한 이용자의 휴대전화번호를 복호화가 불가능한 일방향 암호화(해시 처리)하여 6개월간 보관합니다. QR코드 서비스에서 연락처를 등록한 이후 QR코드 삭제 시, 복구 요청 대응을 위해 삭제 시점으로 부터 6개월 보관합니다. 스마트 플레이스 서비스에서 휴대전화번호를 등록한 경우 분쟁 조정 및 고객문의 등을 목적으로 업체 등록/수정 요청시, 또는 등록 이후 업체 삭제 요청 시로부터 최대 1년간 보관 할 수 있습니다.<br>
                전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 풀리마켓는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.<br>
                - 전자상거래 등에서 소비자 보호에 관한 법률<br>
                계약 또는 청약철회 등에 관한 기록: 5년 보관<br>
                대금결제 및 재화 등의 공급에 관한 기록: 5년 보관<br>
                소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관<br>
                - 전자금융거래법<br>
                전자금융에 관한 기록: 5년 보관<br>
                - 통신비밀보호법<br>
                로그인 기록: 3개월<br>
                회원탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 법령에서 보존의무를 부과한 정보에 대해서도 해당 기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다.<br>
                전자적 파일 형태의 경우 복구 및 재생이 되지 않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로 파기합니다.<br>      
                참고로 풀리마켓은 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.<br>
            ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br>
        <br>
            </div>
            <br><br>
        <button onclick="allchkContentclose2();" class="closebtn">확인</button>
        </div>
    </div>
    
    <script>
	    function chkDetail2(){
	        $("#agreeModal2").show();
	    }
	
	    function allchkContentclose2(){
	        $('#agreeModal2').css("display",'none');
	    }
    </script>
</body>
</html>