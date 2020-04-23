<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>mirotic</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <!-- <link rel="stylesheet" href="resources/css/basket.css"> -->
    <link rel="stylesheet" href="resources/css/order.css">
    <link rel="stylesheet" href="resources/css/join.css">
    
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
     <!-- 헤더부분-->
    <%@include file="../common/header.jsp" %>

    <!--장바구니 내용부분-->
    <div class="layout-page-header">
        <h1 class="layout-page-title" style="text-align: center;">주문서</h1>
        <div class="pg_sub_desc">
            <p>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
        </div>
    </div>
    <div id="main">
        <div id="content">
            <div class="user_form section_cart">
                <div class="titleArea1" style="text-align: left;">
                    <h2>상품 정보</h2>
                </div>
                <table class="tbl_comm tbl_header">
                    <thead>
                        <tr>
                            <th id="thSelect" style="width: 375px; padding-left: 10px;"></th> 
                            <th id="thInfo" style="width: 432px;">상품 정보</th> 
                            <th style="width: 115px;"></th> 
                            <th id="thCost" style="width: 110px;">상품금액</th> 
                            <th id="thDelete" style="width: auto; padding-right: 22px;">
                                <!-- <span class="screen_out">삭제선택</span> -->
                            </th>
                        </tr>
                    </thead>
                </table> 
                <div id="viewGoods">
                    <div>
                        <div class="view_goods"> 
                            <table class="tbl_goods goods">
                                <tbody>
                                 
                                	<c:forEach var="mybag" items="${cartList}" varStatus="index">
	                                    <tr>
	                                        <td header="thSelect" class="goods_check" style="width: 76px;"></td> 
	                                        <td header="thInfo" class="goods_thumb" style="width: 100px;">
	                                            <a class="thumb">
	                                            <img src="https://img-cf.kurly.com/shop/data/goods/1481095558837i0.jpg" alt="상품이미지" onerror="this.src='https://res.kurly.com/pc/temp/1801/noimg_100.gif'"></a>
	                                        </td> 
	                                        <td header="thInfo" class="goods_info" style="width: 488px;"> 
	                                            <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="name">${mybag.getPrd().pr_name }</a> 
	                                            <dl class="goods_cost" style="margin: 0px;"><dt class="screen_out"></dt> 
	                                                <dd class="selling_price">
	                                                    <span style="float:none;margin-right:0px;" class="num" style="font-size: 12px; font-weight: bold; margin-right: 0px;">${mybag.getPrd().pr_price}</span> 
	                                                    <span style="float:none;margin-right:0px;" class="txt"  style="font-size: 12px; font-weight: bold; margin-right: 0px;" >원</span>
	                                                </dd> 
	                                            </dl> 
	                                            <p class="txt txt_limit"></p> 
	                                        </td> 
	                                        <td header="thInfo" class="goods_condition" style="width: 112px;">
	                                            <div class="condition"></div>
	                                        </td> 
	                                        <td header="thCount" style="width: 86px;">
	                                        </td>
	                                        <td header="thCost"  style="width: 110px;">
	                                            <dl class="goods_total">
	                                                <dt class="screen_out">합계</dt> 
	                                                <dd class="result">
	                                                	<input type="hidden" value="${mybag.getPrd().pr_price }" id="pr_price">
	                                                    <span style="float:none;margin-right:0px;" class="num" style="margin: 0px;" id="total_price"></span> 
	                                                    <span style="float:none;margin-right:0px;" class="txt" style="margin: 0px;">원</span>
	                                                </dd>
	                                            </dl>
	                                        </td > 
	                                        <td style="width: auto;">
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                	
                                
                                    <tr>
                                        <td header="thSelect" class="goods_check" style="width: 76px;"></td>
                                        <td header="thInfo" class="goods_thumb" style="width: 100px;">
                                            <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="thumb">
                                            <img src="https://img-cf.kurly.com/shop/data/goods/1481095558837i0.jpg" alt="상품이미지" onerror="this.src='https://res.kurly.com/pc/temp/1801/noimg_100.gif'"></a>
                                        </td> 
                                        <td header="thInfo" class="goods_info" style="width: 488px;"> 
                                            <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="name">[선인 델리미트] 바베큐 백립 450g (냉동)</a> 
                                            <dl class="goods_cost" style="margin: 0px;"><dt class="screen_out">판매가격</dt> 
                                                <dd class="selling_price">
                                                    <span class="num" style="font-size: 12px; font-weight: bold; margin-right: 0px;">15,000</span> 
                                                    <span class="txt"  style="font-size: 12px; font-weight: bold; margin-right: 0px;" >원</span>
                                                </dd> 
                                            </dl> 
                                            <p class="txt txt_limit"></p> 
                                        </td> 
                                        <td header="thInfo"  style="width: 112px;">
                                            <div class="condition"></div></td> 
                                        <td header="thCount" style="width: 86px;"></td> 
                                        <td header="thCost"  style="width: 110px;">
                                            <dl class="goods_total">
                                                <dt class="screen_out">합계</dt> 
                                                <dd class="result">
                                                    <span class="num" style="margin: 0px;">15,000</span> 
                                                    <span class="txt" style="margin: 0px;">원</span>
                                                </dd>
                                            </dl>
                                        </td > 
                                        <td  style="width: auto;"></td>
                                    </tr>
                                     
                                    
                                </tbody>
                            </table>
                        </div>                        
                    </div> 
                </div>  
                <!-- 주문자 정보 start-->

                <form id="form" name="frmOrder" action="#" method="post" class="order_view">
                <div class="data_orderer">
                    <h2 style="text-align: left;">주문자 정보</h2>
                        <table class="goodsinfo_table" style="border-top: 2px solid #2e8b57; width: 100%;">
                            <tbody>
                                <tr class="fst">
                                    <th>보내는 분 *</th>
                                    <td>
                                        <input type="text" name="nameOrder" value required="required" msgr="보내는 분의 이름을 적어주세요"
                                        style="width: 162px;">
                                    </td>
                                </tr>
                                <tr class="field_phone">
                                    <th>휴대폰 *</th>
                                    <td>
                                        <input style="width:43px" type="text" name="mobileOrder[]" value size="3" maxlength="3" option="regNum" required label="주문자 휴대폰번호">
                                        <span class="bar" style="margin-right: 0px;">
                                            <span style="margin-right: 0px;"></span>
                                        </span>
                                        <input style="width:50px" type="text" name="mobileOrder[]" value size="4" maxlength="4" option="regNum" required label="주문자 휴대폰번호">
                                        <span class="bar" style="margin-right: 0px;">
                                            <span style="margin-right: 0px;"></span>
                                        </span>
                                        <input style="width:50px" type="text" name="mobileOrder[]" value size="4" maxlength="4" option="regNum" required label="주문자 휴대폰번호">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <input style="width: 360px;" type="text" id="email" name="email" value required option="regEmail">
                                        <p class="txt_guide">
                                            <span class="txt txt_case1" style="margin-right: 0px;">이메일을 통해 주문처리 과정을 보내드립니다</span>
                                            <span class="txt txt_case2" style="margin-right: 0px;">이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해 주세요</span>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                </div>
                <!-- 주문자 정보 end-->
                <!-- 배송 정보 start-->
                <div class="data_delivery" id="data_delivery">
                    <h2 style="text-align: left;">배송정보</h2>
                    <p>
                        *정기 배송 휴무일 : 택배배송(
                        <span style="margin-right: 0px; color: red;" >일요일</span>
                        )
                    </p>
                    <table class="goodsinfo_table">
                        <tbody>
                            <tr class="field_addressview">
                                <th>주소</th>
                                <td>
                                    <input id="zonecode" type="text" value="" style="width:50px;" readonly/>
                                    <input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" />
                                    <!-- <input type="text" id="address" value="" style="width:240px;" readonly/>
                                
                                    <input type="text" id="address_etc" value="" style="width:200px;"/> -->
                                </td>
                            </tr>
                            <tr class="field_recivename">
                                <th>수령인 이름 *</th>
                                <td>
                                    <input type="text" id="nameReceiver" name="nameReceiver" value required="required" style="width: 162px;">
                                </td>
                            </tr>
                            <tr class="field_phone">
                                <th>휴대폰 *</th>
                                <td>
                                    <input style="width:43px" type="text" name="mobileReceiver[]" value size="3" maxlength="3" option="regNum" required label="주문자 휴대폰번호">
                                    <span class="bar" style="margin-right: 0px;">
                                        <span style="margin-right: 0px;"></span>
                                    </span>
                                    <input style="width:50px" type="text" name="mobileReceiver[]" value size="4" maxlength="4" option="regNum" required label="주문자 휴대폰번호">
                                    <span class="bar" style="margin-right: 0px;">
                                        <span style="margin-right: 0px;"></span>
                                    </span>
                                    <input style="width:50px" type="text" name="mobileReceiver  []" value size="4" maxlength="4" option="regNum" required label="주문자 휴대폰번호">
                                </td>
                            </tr>
                            <tr class="field_ask">
                                <th>배송 요청사항</th>
                                <td class="td2_memo"><textarea id="deliveryMemo" maxlength="299"></textarea>
                                    <span id="counter">###</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                        </tbody>
                    </table>
                    <script>
                        $(function() {
                            $('#deliveryMemo').keyup(function (e){
                                var deliveryMemo = $(this).val();
                                $(this).height(((deliveryMemo.split('\n').length + 1) * 1.5) + 'em');
                                $('#counter').html(deliveryMemo.length + '/300');
                            });
                            $('#deliveryMemo').keyup();
                        });
                    /* 주소 찾기 start------------------------------*/    
                    </script>
                        <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

                        <script type="text/javascript">
                    
                            function openDaumZipAddress() {
                                new daum.Postcode({
                                    oncomplete:function(data) {
                                        // jQuery("#zonecode").val(data.zonecode);
                                        document.getElementById("zonecode").value = data.zonecode;
                                        // jQuery("#postcode1").val(data.postcode1);
                                        // jQuery("#postcode2").val(data.postcode2);
                                        // jQuery("#zonecode").val(data.zonecode);
                                        // jQuery("#address").val(data.address);
                                        // jQuery("#address_etc").focus();
                                        console.log(data);
                                    }
                                }).open();
                    
                            }
                        </script>
                </div>
                <!-- 배송 정보 end-->
                <!-- 결제 수단 start-->
                <div class="data_method">
                    <h2 style="text-align: left;">결제 수단</h2>
                    <table class="goodsinfo_table tbl_left">
                        <tbody>
                            <tr>
                                <th>일반결제</th>
                                <td class="noline" style="position: relative;">
                                    <label onclick="">
                                        <input type="radio" value="" checked="checked">신용카드
                                    </label>
                                    <label>
                                        <input type="radio" value="">휴대폰
                                    </label>
                                </td>
                            </tr>
                            <tr class="card_detail" style="display: table-row;">
                                <th></th>
                                <td>
                                    <div id="cardSelect">
                                        <div>
                                            <div class="card_select">
                                                <div class="select_box">
                                                    <!-- <strong class="tit">카드를 선택해주세요</strong> -->
                                                    <select name="card_code" class="list">
                                                        <option disabled="disabled" selected>카드를 선택해주세요</option>
                                                        <option value="61">현대</option>
                                                        <option value="41">신한</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                </td>
 
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 결제 수단 end-->
                
                
                <h2 style="text-align: left;">개인 정보 수집/제공</h2>
                <table class="goodsinfo_table height">
                    <tbody>
                        <tr>
                            <td class="reg_agree">
                                <div class="bg_dim" style="display: none;"></div>
                                <div class="check">
                                    <input type="checkbox" id="chk_all">
                                    <label for="chk_all">결제 진행 필수 동의</label><br><br>
                                    
                                    <label for="check1" class="check">개인정보 수집 및 이용 동의</label>
                                    <label for="check1"  style="color:#9c9c9c;">(필수)</label>
                                    <button onclick="chkDetail1();" class="detailbtn">약관보기></button><br><br>
            
                                </div>
                            </td>
                        </tr>
                    </tbody>

                    <table>
                        <tr>
                            <td class="td1"></td>
                            <td class="td2">
                                <button id="joinokbtn" class="okbtn" onclick="cashbtn();">결제하기</button>
                            <td class="td3"></td>
                        </tr>              
                    </table>
                    <div id="agreeModal1">
       
                        <div id="allchkContent">
                            <h2 style="text-align: left; margin: 35px;">개인정보 수입/이용 동의<br>(필수)</h2>
                            <div id="Content1">
                               <div class="box_tbl">
                                   <table cellpadding="0" cellspacing="0" width="100%">
                                       <thead>
                                           <tr>
                                               <th scope="row">수집 목적</th>
                                               <th scope="row">수집 항목</th>
                                               <th scope="row">보유 기간</th>
                                           </tr>
                                       </thead>
                                       <tbody>
                                           <tr>
                                               <td>
                                                온라인 쇼핑 구매자에 대한
                                                <br>
                                                상품 결제 및 배송
                                               </td>
                                               <td>
                                                주문자 정보(이름, 휴대폰 번호, 이메일), 결제정보, 수취인 정보(주소, 이름, 휴대폰 번호)
                                               </td>
                                               <td>
                                                업무 목적 달성 후 5일 내
                                                <br>
                                                (단, 타 법령에 따라 법령에서 규정한 기간 동안 보존)
                                               </td>
                                           </tr>
                                       </tbody>
                                   </table>
                                   <P class="txt_service">서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스를 이용하실 수 있습니다.</P>
    
                               </div>
                            </div>
                            <br><br>
                        <button onclick="allchkContentclose();" class="closebtn">확인</button>
                        </div>
                    </div>
                

                </table>
            </form>
                

                

                <p class="info_notice">
                    ‘입금확인’ 상태일 때는 주문내역 상세 페이지에서 직접 주문취소가 가능합니다.<br>
                    ‘입금확인’ 이후 상태에는 고객행복센터로 문의해주세요.
                </p>
            </div>
        </div>
    </div>
    <script>
        function chkDetail1(){
            $("#agreeModal1").show();
        }

        function allchkContentclose(){
            $('#agreeModal1').css("display",'none');
        }
    
        
      //주문결제
        function cashbtn(){
        	var IMP = window.IMP; // 생략가능
        	IMP.init('imp98905663');
        	
        	IMP.request_pay({
        	    pg : 'danal', // version 1.1.0부터 지원.
        	    pay_method : 'card',
        	    merchant_uid : 'merchant_' + new Date().getTime(),
        	    name : '주문명:결제테스트',
        	    amount : 14000,
        	    buyer_email : 'iamport@siot.do',
        	    buyer_name : '구매자이름',
        	    buyer_tel : '010-1234-5678',
        	    buyer_addr : '서울특별시 강남구 삼성동',
        	    buyer_postcode : '123-456',
        	    m_redirect_url : 'index.jsp'
        	}, function(rsp) {
        	    if ( rsp.success ) {
        	        var msg = '결제가 완료되었습니다.';
        	        msg += '고유ID : ' + rsp.imp_uid;
        	        msg += '상점 거래ID : ' + rsp.merchant_uid;
        	        msg += '결제 금액 : ' + rsp.paid_amount;
        	        msg += '카드 승인번호 : ' + rsp.apply_num;
        	    } else {
        	        var msg = '결제에 실패하였습니다.';
        	        msg += '에러내용 : ' + rsp.error_msg;
        	    }
        	    alert(msg);
        	});
        	
        }
      
      
        
    </script>
</body>
</html>