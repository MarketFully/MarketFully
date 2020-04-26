<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

   <!--장바구니 내용부분-->
    <div class="layout-page-header">
        <h1 class="layout-page-title">장바구니</h1>
        <div class="pg_sub_desc">
            <p>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
        </div>

    <div id="main">
        <div id="content">
            <div class="user_form section_cart">
                <table class="tbl_comm tbl_header" >
                    <thead>
                        <tr>
                            <th id="thSelect" style="width: 375px; padding-left: 10px;">
                                <div class="all_select">
                                    <label class="label_check checked">
                                    <input type="checkbox" name="allCheck" id="chk_all">
                                    <label for="chk_all"></label>
                                    </label> 
                                    <span style="float:none;margin-right:0px;" class="tit">전체선택 (
                                        <span style="float:none;margin-right:0px;" class="num_count" id="num_count" style="margin-right: 0px;">0</span>&nbsp;&nbsp;/&nbsp;
                                        <span style="float:none;margin-right:0px;" class="num_total" id="num_total" style="margin-right: 0px;">0</span>&nbsp;)
                                    </span>
                                </div>
                            </th> 
                            <th id="thInfo" style="width: 432px;">상품 정보</th> 
                            <th id="thCount" style="width: 115px;">수량</th> 
                            <th id="thCost" style="width: 110px;">상품금액</th> 
                            <th id="thDelete" style="width: auto; padding-right: 22px;">
                                <!-- <span style="float:none;margin-right:0px;" class="screen_out">삭제선택</span> -->
                            </th>
                        </tr>
                    </thead>
                </table> 
                <div id="viewGoods">
                    <div>
                        <div class="view_goods"> 
                            <table class="tbl_goods goods" id="l_table">
                                <tbody>
                                	<c:if test="${ empty cartList}">
                                   		<h1> 장바구니가 비었습니다. </h1>
                                   	</c:if>
                                	<c:forEach var="mybag" items="${cartList}" varStatus="index">
	                                    <tr>
	                                        <td header="thSelect" class="goods_check" style="width: 76px;">
	                                            <label class="label_check checked">
	                                            <input type="checkbox" name="" class="ico_check" id="check${index.index }">
	                                            <label for="check${index.index }"></label>
	                                            <input type="hidden" id="me_num" value="${mybag.me_num }"/>
	                                            <input type="hidden" id="mb_bo_num" value="${mybag.mb_bo_num }"/>
	                                            <input type="hidden" id="pr_code" value="${mybag.pr_code }"/>
	                                            </label></td> 
	                                        <td header="thInfo" class="goods_thumb" style="width: 100px;">
	                                            <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="thumb">
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
	                                            <div class="goods_quantity">
	                                                <div class="quantity" style="height: 22px;">
	                                                    <strong class="screen_out">수량</strong> 
	                                                    <button type="button" class="btn btn_reduce">
	                                                    <img src="resources/img/minus.png" alt="감소"></button> 
	                                                    <input type="text" readonly="readonly" class="inp_quantity" value="${mybag.pr_each}" id="pr_each"> 
	                                                    <button type="button" class="btn btn_rise">
	                                                        <img src="resources/img/plus.png" alt="추가"></button>
	                                                </div>
	                                            </div>
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
	                                        <td header="thDelete" class="goods_delete" style="width: auto;">
	                                            <button type="button" class="btn btn_delete" id="deletebtn">
	                                            <img src="https://res.kurly.com/pc/ico/1801/btn_close_24x24_514859.png" alt="삭제"></button>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>                        
                    </div> 
                </div> 

                <div class="all_select select_option">
                    <button type="button" class="btn_delete" id="btnnnnn1">선택 삭제</button> 
                    <!-- <button type="button" class="btn_delete">품절 상품 삭제</button>  -->
                </div>

                <div class="product_price_box--2_sRjHNYSb" style="height: 62px;">
                    <div class="product_price_detail--1ZRE4kKbD-">
                        <dl class="product_price--29YDGAO_uo">
                            <dt>총 상품금액</dt>
                            <dd style="margin-left: 0px;">
                                <span style="float:none;margin-right:0px;" class="price--JIZ5vfiqW7" style="margin-right: 0px;" id="total1" name="total1">0</span>원  
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
                            <span style="float:none;margin-right:0px;" class="price--JIZ5vfiqW7" id="total2" name="total2"></span>원
                        </span>
                    </strong>
                                           </div>
                                           
                 <c:if test="${ !empty cartList}">

                    <div class="notice_cart">*적립금은 다음화면인 ‘주문서’에서 확인가능합니다.</div> 
                    	<button type="button" class="btn_submit" onclick="miroticView()">주문하기</button>
	                </div>
	                <p class="info_notice">
	                    ‘입금확인’ 상태일 때는 주문내역 상세 페이지에서 직접 주문취소가 가능합니다.<br>
	                    ‘입금확인’ 이후 상태에는 고객행복센터로 문의해주세요.
	                </p>
               	</c:if>
            </div>
        </div>
    </div>
    
     <!-- 전체동의 -->
     <script>
        $("#chk_all").click(function(){
        	var chk = $("#chk_all").prop("checked");
	        if(chk) {
	        	$(".ico_check").prop("checked", true);
	        } else {
	        	$(".ico_check").prop("checked", false);
	        }
	        
	        //전체 체크시 체크되어있는 갯수를 총갯수와 맞춰줌
	        checkNum();
        });
   
    </script>

    <!-- 전체동의가 체크되있을 때 하나라도 풀리면 해제 -->
    <script>           
        $(".ico_check").click(function(){
        	$("#chk_all").prop("checked", false);
        	checkNum();
        });
    </script> 

    <!-- 수량 + / - -->
    <script>
        $(".btn_rise").click(function(){
	        var num = $(this).siblings(".inp_quantity").val();
	        var plusNum = Number(num) + 1;
	
	        $(this).siblings(".inp_quantity").val(plusNum);
			
	        calculate();
        }); //btn_rise
        
        $(".btn_reduce").click(function(){
	        var num = $(this).siblings(".inp_quantity").val();
	        var minusNum = Number(num) - 1;  
	        
	            if(minusNum <= 0) {
	            	$(this).siblings(".inp_quantity").val(num);
	            } else {
	            	$(this).siblings(".inp_quantity").val(minusNum);          
	            }
            
            calculate();
        }); //btn_reduce
    </script>

   <!--x 눌렀을때 삭제-->
   <script>
    $("#l_table tr>td:last>#deletebtn")
     .on('click', function(){
         if (confirm("정말 삭제하시겠습니까??") == true){    //확인
        	var me_num = $(item).parent().parent().children().children().children('#me_num').val();
     		var mb_bo_num = $(item).parent().parent().children().children().children('#mb_bo_num').val();
     		var pr_code = $(item).parent().parent().children().children().children('#pr_code').val();
     		
     		if( ${ !empty loginUser } ){ //로그인 중이면
        		$.ajax({
        			url:"selectDeleteMybag"
        			, data:{'me_num': me_num, 'mb_bo_num':mb_bo_num, 'pr_code':pr_code}
        			, method:"post"
        			, success:function(data){
        				console.log(data);
        			}//success
        			, error:function(request, status, error){
        				console.log('request :'+request);
             			console.log('status :'+status);
             			console.log('error :'+error);
        			}//error
        		}); //ajax
        		$(item).parent().parent().remove();
        		checkNum();
    		}else{	//비로그인
    			$(item).parent().parent().remove();
    			checkNum();
    		}//if else loginUser!=null
     		
         }else{   //취소
             return false;
         }  
     });

    //선택이 된거만 삭제 
     $("#btnnnnn1")
     .on('click', function(){
         if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                //지금은 선택할게 하나니까 하나면 충분하지만 
                //나중에는 반복문으로 prop('checked')가 true인 것을 전부 검색해서 다 지워야함
                $.each($('#l_table tr'), function(index, item){
                	if($(item).children().children().children().prop('checked')){
                		var me_num = $(item).children().children().children('#me_num').val();
                		var mb_bo_num = $(item).children().children().children('#mb_bo_num').val();
                		var pr_code = $(item).children().children().children('#pr_code').val();
                		
                		
                		if( ${ !empty loginUser } ){ //로그인 중이면
	                		$.ajax({
	                			url:"selectDeleteMybag"
	                			, data:{'me_num': me_num, 'mb_bo_num':mb_bo_num, 'pr_code':pr_code}
	                			, method:"post"
	                			, success:function(data){
	                				console.log(data);
	                			}//success
	                			, error:function(request, status, error){
	                				console.log('request :'+request);
	                     			console.log('status :'+status);
	                     			console.log('error :'+error);
	                			}//error
	                		}); //ajax
	                		$(item).remove();
	                		checkNum();
                		}else{	//비로그인
                			$(item).remove();
                			checkNum();
                		}//if else loginUser!=null
                	}// if checked
                })//each
                calculate();        
         }else{   //취소
             return false;
         }  
     });
    
    
    
    $(function(){
    	console.log('비로그인 : ${loginUser.mem_num}');
    	calculate();
    	checkNum();
    });
    
    
    //각 상품의 수량별로 가격을 계산하고 최종 가격등을 화면에 띄워줌
    function calculate(){
    	var total=0;
    	
    	$('input#pr_price').each(function(){
			var price = $(this).val();
			var each = 
    		$(this).parent().parent().parent().parent().children('td[header=thCount]').children().children().children('#pr_each').val();
			
			
    		console.log('가격 : '+ price);
    		console.log('수량 : '+ each)
    		
    		var total_price = price*each;
    		total += total_price;
    		
    		console.log('토탈 : '+total_price);
    		
    		$(this).siblings('#total_price').text(total_price);
    		
    	}); //each
    	
    	$('span#total1').text(total);
    	$('span#total2').text(total+3000);
    	
    }//calculate
    
    //전체 선택 개수 표시
 	function checkNum(){
    	var num_count=0;
    	var num_total=0;
 		$('#l_table tr').each(function(index, item){
    		if($(item).children().children().children().prop('checked')){
    			num_count+=1;
    		}
    		num_total=index;
    	});//each
    	
    	console.log('num_count :'+num_count +', num_total : '+num_total);
    	
    	$('#num_total').text(num_total+1);
    	$('#num_count').text(num_count);
    }   
    
    
    //주문 페이지로
    function miroticView(){
    	//주문을 누르는 순간
    	
    	//현재 장바구니에 설정된 값을 list 객체 배열에 담는다
    	var list=[];
    	$.each($('#l_table tr'), function(index, item){
       		var cart={};
       		list.push({
	       		'me_num' : $(item).children().children().children('#me_num').val()
	       		,'mb_bo_num' : $(item).children().children().children('#mb_bo_num').val()
	       		,'pr_code' : $(item).children().children().children('#pr_code').val()
	       		, 'pr_each' : $(item).children().children().children().children('#pr_each').val()
       			});
    	})//$.each  
    	
    	//확인
    	console.log(list);
    	console.log(JSON.stringify(list));
    	
    	//회원인 경우 현재 list를 MyBag에 업데이트 해서 그 값을 이용함
    	 $.ajax({	
   			url:"updateCart"
   			, data: JSON.stringify(list)
   			, dataType : "text"
   			, contentType : "application/json"
   			, method:"post"
   			, success:function(data){
   				console.log(data);
   				location.href="miroticView";
   			}//success
   			, error:function(request, status, error){
   				console.log('request :'+request);
        			console.log('status :'+status);
        			console.log('error :'+error);
   			}//error
   		}); //ajax 
   		
    }//miroticView
    
     </script>
</body>
</html>