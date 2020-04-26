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
    <link rel="stylesheet" href="resources/css/basket.css">
    
        <script src="resources/js/jquery-3.4.1.min.js"></script>
    
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
                                		<c:set var="total_price" value="${mybag.getPrd().pr_price * mybag.pr_each }"/>
                                		
	                                    <tr>
	                                    	<input type="hidden" id="pr_code" value="${mybag.pr_code }"/>
	                                    	<input type="hidden" id="pr_each" value="${mybag.pr_each }"/>
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
	                                                    <span style="float:none;margin-right:0px;" class="txt"  style="font-size: 12px; font-weight: bold; margin-right: 0px;">원</span>
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
	                                                	
	                                                    <span style="float:none;margin-right:0px;" class="num" style="margin: 0px;" id="total_price"><c:out value="${ total_price}"/></span> 
	                                                    <span style="float:none;margin-right:0px;" class="txt" style="margin: 0px;">원</span>
	                                                </dd>
	                                            </dl>
	                                        </td > 
	                                        <td style="width: auto;">
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            
                            
                            
                            
                            <div class="product_price_box--2_sRjHNYSb" style="height: 62px;">
                    <div class="product_price_detail--1ZRE4kKbD-">
                        <dl class="product_price--29YDGAO_uo">
                            <dt>총 상품금액</dt>
                            <dd style="margin-left: 0px;">
                                <span style="float:none;margin-right:0px;" class="price--JIZ5vfiqW7" style="margin-right: 0px;" id="total1">${tp.total1 }</span>원  
                            </dd>
                        </dl>
                        <label style="font-size: 30px;font-weight:bold;padding-right: 54px;color: rgb(189, 187, 187);">+</label>
                        <dl class="product_price--29YDGAO_uo">
                            <dt>배송비</dt>
                            <dd style="margin-left: 0px;">
                                <span style="float:none;margin-right:0px;" class="price--JIZ5vfiqW7" style="margin-right: 0px;">3000</span>원
                            </dd>
                        </dl>
                    </div>
                    
                    <strong class="product_price_total--3usHUQ97oy">총 주문금액
                        <span style="float:none;margin-right:0px;" class="txt_point--bAwRwaaTcp">
                            <span style="float:none;margin-right:0px;" class="price--JIZ5vfiqW7" id="total2">${tp.total2 }</span>원
                        </span>
                    </strong>
                            </div>
                            
                            
                            
                        </div>                         
                    </div> 	
                </div>
                <!-- 주문자 정보 start-->

               <!--  <form id="form" name="frmOrder" action="#" method="post" class="order_view" onsubmit="false"> -->
                <div class="data_orderer">
                    <h2 style="text-align: left;">주문자 정보</h2>
                        <table class="goodsinfo_table" style="border-top: 2px solid #2e8b57; width: 100%;">
                            <tbody>
                                <tr class="fst">
                                    <th>보내는 분 *</th>
                                    <td>
                                        <input type="text" name="mem_name" id="mem_name" required="required" msgr="보내는 분의 이름을 적어주세요"
                                        style="width: 162px;" value="${loginUser.mem_name}">
                                    </td>
                                </tr>
                                <tr class="field_phone">
                                    <th>휴대폰 *</th>
                                    <td>
                                        <input type="text" name="mem_phone" id="mem_phone" class="input" placeholder="주문자 휴대폰번호" required style="width: 162px;" msgr="보내는 분의 번호를 적어주세요"
                                        value="${loginUser.mem_phone}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                    	<input style="width: 360px;" type="text" id="mem_email" name="mem_email" class="input" placeholder="  이메일" required option="regEmail"
                                    	value="${loginUser.mem_email}">
                                    </td>
                                </tr>
                                <tr class="field_addressview">
	                                <th>주소</th>
	                                <td>
	                                    <input name="post" id="postcode1" class="postcodify_postcode5" type="text" style="width:50px;" readonly/>
	                                    <button id="postcodify_search_button1" class="btn btn-default" type="button">주소검색</button>
	                                    <br>
	                                    <input type="text" id="address1" name="address1" class="postcodify_address" style="width: 360px;">
	                                    <br>
	                                    <input type="text" id="extra_info1" name="address2" class="postcodify_extra_info" style="width: 360px;">
	                                    
                                        <p class="txt_guide">
                                            
                                        </p>
                                        <!--
                                        <p class="txt_guide">
                                            <span class="txt txt_case1" style="margin-right: 0px;">이메일을 통해 주문처리 과정을 보내드립니다</span>
                                            <span class="txt txt_case2" style="margin-right: 0px;">이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해 주세요</span>
                                        </p>
                                        -->
                                        
	                                </td>
                            </tr>
                                
                            </tbody>
                        </table>  
                </div>
                <!-- 주문자 정보 end-->
                
                <br><br>
                <!-- 배송 정보 start-->
                <div class="data_delivery" id="data_delivery">
                    <h2 style="text-align: left;">배송정보</h2>
                    
                    <table class="goodsinfo_table">
                        <tbody>
                            <tr class="field_addressview">
                                <th>주소</th>
                                <td>
                                    <input name="post" id="postcode2" class="postcodify_postcode5" type="text" style="width:50px;" readonly/>
                                    <button id="postcodify_search_button2" class="btn btn-default" type="button">주소검색</button>
                                    <br>
                                    <input type="text" id="address2" name="address" class="postcodify_address" style="width: 360px;">
                                    <br>
                                    <input type="text" id="extra_info2" name="address" class="postcodify_extra_info" style="width: 360px;">
                                </td>
                            </tr>
                            <tr class="field_recivename">
                                <th>수령인 이름 *</th>
                                <td>
                                	<input type="text" name="sender_name" id="sender_name" required="required" style="width: 162px;">
                                </td>
                            </tr>
                            <tr class="field_phone">
                                <th>휴대폰 *</th>
                                <td>
                                	<input type="text" name="sender_phone" id="sender_phone" class="input" placeholder="주문자 휴대폰번호" required style="width: 162px;" msgr="보내는 분의 번호를 적어주세요">
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
                                    <!-- 
                                    <label>
                                        <input type="radio" value="">휴대폰
                                    </label>
                                     -->
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <!-- 결제 수단 end-->
                
            <br><br><br>

	                    <table>
	                        <tr>
	                            <td class="td1"></td>
	                            <td class="td2">
	                                <button id="joinokbtn" class="okbtn" onclick="cashbtn();">결제하기</button>
	                               </td>
	                            <td class="td3"></td>
	                        </tr>              
	                    </table>
            </form>
   		 <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>            

                

                <p class="info_notice">
                    ‘입금확인’ 상태일 때는 주문내역 상세 페이지에서 직접 주문취소가 가능합니다.<br>
                    ‘입금확인’ 이후 상태에는 고객행복센터로 문의해주세요.
                </p>
            </div>
        </div>
    </div>
    <script>
    	   	
 		//주문금액 세팅
    	$(function(){
    		
    		//합계 
    		var amount_val=0;
    	  	$('span#total_price').each(function(index, item){
    		  amount_val += Number($(item).text());
    		  console.log('amount_val : '+amount_val);
    	  	}); //each $('span#total_price')
    	  
    		//총 상품금액
    		$('#total1').text(amount_val);
    		
    	  	//총 주문금액
    	  	$('#total2').text(amount_val+3000);
    	}); 
    	
    	
        //주소찾기 버튼
    	$(function(){
			$("#postcodify_search_button1").postcodifyPopUp({
		        insertPostcode5 : "#postcode1",
		        insertAddress : "#address1",
		        insertDetails : "#details1",
		        insertExtraInfo : "#extra_info1",
		        hideOldAddresses : false
		    });
			
			$("#postcodify_search_button2").postcodifyPopUp({
		        insertPostcode5 : "#postcode2",
		        insertAddress : "#address2",
		        insertDetails : "#details2",
		        insertExtraInfo : "#extra_info2",
		        hideOldAddresses : false
		    });
		});
    	
    	
    	
    	
        function chkDetail1(){
            $("#agreeModal1").show();
        }

        function allchkContentclose(){
            $('#agreeModal1').css("display",'none');
        }
    
        
      //주문결제
        function cashbtn(){
    	  
    	  //정보가 다 입력되었는지 확인
    	  
    	  
    	  
    	  
    	  //결제 관련 정보
    	  var pg_val='danal';
    	  var pay_method_val='card';
    	  var order_val=0;	//ajax처리후 완성
    	  var amount_val=0;
    	  $('span#total_price').each(function(index, item){
    		  amount_val += Number($(item).text());
    		  console.log('amount_val : '+amount_val);
    	  })
    	  amount_val+=3000;
    	  
    	  //보내는 사람 관련 정보
    	  var or_total = amount_val; //총 가격
    		var sender_name = $('#mem_name').val(); //이름
    		var sender_phone = $('#mem_phone').val();//번호
    		var sender_addr = $('#address1').val(); // 주소
    	  
    	  
    	  
    	  
		// 받는 사람 정보    	  
    	  var name_val=$('#sender_name').val();
    	  var phone_val=$('#sender_phone').val();
    	  var addr_val=$('#address2').val();
    	  var zip_val=$('#postcode2').val();
    	  var memo = $('#deliveryMemo').val();
    	  
    	  
    	  var orderList=[];
    	  $.each($('table.tbl_goods tr'), function(index, item){
    		  orderList.push({
  	        		'pr_code' : $(item).children('#pr_code').val() //상품코드
  	        		, 'pr_each' : $(item).children('#pr_each').val()//상품수량
	        		, 'or_total' : amount_val //총 가격
  	        		, 'sender_name' : sender_name //보내느 사람 이름
  	        		, 'sender_phone' : sender_phone //번호
  	        		, 'sender_addr' : sender_addr // 주소
    		  });
    	  })//each
    	  
    	  console.log('보내는 자료 : '+orderList);
    	  
    	  //결제 
    	  //결제 정보를 db에 입력한다.
        	        $.ajax({
        	        	url:"insertMirotic"
        	        	, data : JSON.stringify(orderList)
        	        	, dataType : "text"
        	        	, contentType : "application/json"
        	        	, method:"post"
        	        	, success:function(data){
        	        		//성공시 결제 메소드를 호출한다. 
        	        		//alert('data : '+data);
        	        		console.log('success : '+ data);
        	        		order_val = data;
        	        		console.log('amount_val : '+amount_val+'\n order_val : '+order_val+'\n name_val : '+name_val
        	        				+'\n phone_val : '+phone_val+'\n addr_val :'+addr_val+'\n zip_val : '+zip_val);
        	        		payment(pg_val, pay_method_val, order_val, amount_val, name_val, phone_val, addr_val, zip_val);
        	        	}//success
        	        	, error:function(request,status, error){
        	        		console.log('에라');
        	        	}
        	        })//ajax
    	  
    	  
    	  
    	  
      } //cashbtn
      
      
      
      
    	function payment(pg_val, pay_method_val, order_val, amount_val, name_val, phone_val, addr_val, zip_val){
        	var IMP = window.IMP; // 생략가능
        	IMP.init('imp98905663');
        	
        	IMP.request_pay({
        	    pg : pg_val, //'danal', // version 1.1.0부터 지원.
        	    pay_method : pay_method_val, //결제수단
        	    merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
        	    name : order_val,	//주문명
        	    amount : amount_val,	//가격
        	    buyer_email : 'marin223@naver.com', //주문자 email
        	    buyer_name : name_val,	//주문자 이름
        	    buyer_tel : phone_val,	//주문자 연락처
        	    buyer_addr : addr_val,	//주문자 주소
        	    buyer_postcode : zip_val,	//주문자 우편번호
        	}, function(rsp) {
        	    if ( rsp.success ) {
        	        var msg = '결제가 완료되었습니다.';
        	        msg += '고유ID : ' + rsp.imp_uid; //아임포트에서 부여하는 거래건 당 고유한 번호
        	        msg += '상점 거래ID : ' + rsp.merchant_uid; // 고유 주문번호
        	        msg += '결제 금액 : ' + rsp.paid_amount;	//
        	        msg += '카드 승인번호 : ' + rsp.apply_num;	//
        	        
        	        //성공시 주문상태를 db에 입력한다.
        	        $.ajax({
        	        	url:"successPayment"
        	        	, data : {
        	        			'receiver_name' : buyer_name
        	        			, 'receiver_addr' : buyer_addr
        	        			, 'receiver_tel' : buyer_tel
        	        			, 'shipping_request' : memo
        	        			, 'or_num' : order_val
        	        		}
        	        	, method : "post"
        	        	, success:function(data){
        	        		console.log(data);
        	        		alert('결제가 완료되었습니다.');
        	        		location.href="myorderlist.bo";
        	        	}//success
        	        	, error:function(data, request,status, error){
        	        		console.log(data);
        	        		alert('결제가 완료되지 않았습니다.');
        	        	}//error
        	        })//ajax
        	        
        	        
        	    } else {
        	        var msg = '결제에 실패하였습니다.';	//실패 메세지
        	        msg += '에러내용 : ' + rsp.error_msg;
        	        
        	        alert('결제가 완료되지 않았습니다. \n'+ msg);
        	        
        	        
        	        window.location.href = 'basket';
        	    }
        	    alert(msg);
        	});
        	
        }//payment
      
      
        
    </script>
</body>
</html>