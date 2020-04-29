<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/orderdetail.css">
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
               <li class="on">
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
               <li>
                   <a href="mypagechange">개인 정보 수정</a>
               </li>
           </ul>
       </div>
    </div>
     
    <!--주문내역 상세부분-->
    <div class="page_section section_orderview">
        <div class="head_aticle" style="border-bottom:2px solid #2e8b57;padding-bottom: 30px; ">
            <h2 class="tit" style="margin-left: 0px;margin-bottom: 10px;">주문 내역 상세</h2>
            <label style="float: left; font-size: 15px;">주문번호 <%=request.getParameter("or_num") %></label>
        </div>
		<c:forEach var="orl" items="${ orlist }">
        <table class="tbl tbl_type1" style="border-top: none;">
            <tbody>
            <tr class="fst">
                <td class="tdname"></td>
                <td class="thumb">
                    <a> <img src="resources/img/Productuploadimg/${orl.product.renameFileName }"    
                     onerror="this.src='resources/img/errorimg.PNG' " 		 
                            		 alt="상품 이미지" class="image" style="width: 100px;height: 110px;"></a>
                </td>

                <td class="info" style="padding-left: 25px;">
                    <div class="name">
                        <a class="ordername">${orl.product.pr_name }</a><br>
                    </div>
                    <div class="desc" style="float: left;">
                        <span style="margin-right:0px;" class="price">${orl.product.pr_price * orl.pr_each}</span>
                        <span style="margin-right:0px;" class="ea">${orl.pr_each }개 구매</span>
                    </div>
                </td>

                <td class="progress end">
                    ${orl.or_status }
                </td>
                <td class="action">
                    <button type="button" class="btn btn_cart ga_tracking_event" onclick="cartLayerOpenAction()">장바구니 담기</button>
                </td>
                <td class="tdname"></td>
            </tr>
          
            </tbody>
        </table>
		</c:forEach>
        

        <div class="head_section">
            <h3 class="tit" style="float: left;margin-top: 40px;">
                결제 정보
            </h3>
        </div>

        <table class="tbl tbl_type2" style="border-bottom:1px solid gray">
            <tbody>
            <tr>
                <th class="ordertitle">총주문금액</th>
                <td class="ordercontent"><span style="margin-right:0px;" id="paper_goodsprice">${orlist[0].or_total -3000}</span>원
                </td>
            </tr>
            <tr>
                <th class="ordertitle">배송비</th>
                <td class="ordercontent">
                    <span style="margin-right:0px;" id="paper_delivery">3000</span>원
                </td>
            </tr>
            <tr>
                <th class="ordertitle">결제금액</th>
                <td class="ordercontent">
                    <strong class="emph"><span style="margin-right:0px;" id="paper_settlement">${orlist[0].or_total}</span>원</strong>
                </td>
            </tr>

            <tr>
                <th class="ordertitle">결제방법</th>
                <td class="ordercontent">신용카드 </td>
            </tr>
            </tbody>
        </table>

        <br>

        <div class="head_section" style="float: left;">
            <h3 class="tit">주문 정보</h3>
        </div>

        <table class="tbl tbl_type2" style="border-bottom:1px solid gray">          
            <tbody>
            <tr>
                <th class="ordertitle">주문 번호</th>
                <td class="ordercontent"> <%=request.getParameter("or_num") %></td>
            </tr>
            <tr>
                <th class="ordertitle">주문자명</th>
                <td class="ordercontent">${ loginUser.mem_name }</td>
            </tr>
            <tr>
                <th class="ordertitle">보내는 분</th>
                <td class="ordercontent"><%=request.getParameter("sender_name") %></td>
            </tr>
            <tr>
                <th class="ordertitle">결제일시</th>
                <td class="ordercontent"><%=request.getParameter("or_date") %></td>
            </tr>
            <tr>
                <th class="ordertitle">주문 처리상태</th>
                <td class="ordercontent">${orlist[0].or_status}</td>
            </tr>
            </tbody>
        </table>

        <br>

        <div class="head_section" style="float: left;">
            <h3 class="tit">배송 정보</h3>
        </div>

        <table class="tbl tbl_type2" style="border-bottom:1px solid gray">
            <tbody>
            <tr>
                <th class="ordertitle">받는 분</th>
                <td class="ordercontent">${orlist[0].shipping.receiver_name }</td>
            </tr>
            <tr>
                <th class="ordertitle">받는 분 핸드폰</th>
                <td class="ordercontent">
                    ${orlist[0].shipping.receiver_phone }
                </td>
            </tr>
            <tr>
                <th class="ordertitle">우편번호</th>
                <td class="ordercontent">00000 (000-000)</td>
            </tr>
            <tr>
                <th class="ordertitle">주소</th>
                <td class="ordercontent">
                    
                    <span style="margin-right:0px;" class="txt_sub2"> ${orlist[0].shipping.receiver_addr } </span>
                </td>
            </tr>
            <tr>
                <th class="ordertitle">배송 상태</th>
                <td class="ordercontent"> ${orlist[0].shipping.shipping_status }</td>
            </tr>
            <tr>
                <th class="ordertitle">배송 요청사항</th>
                <td class="ordercontent"> ${orlist[0].shipping.shipping_request }</td>
            </tr>
            </tbody>
        </table>
    </div>
   
    <div id="cartPut">
        <div class="cart_option cart_type3">
            <strong class="layer_name" style="text-align: left;">상품 선택</strong> 
            <div class="inner_option">
                <button type="button" class="btn_close1 off" onclick="closebtn()">레이어닫기</button> 
                <strong class="tit_cart" style="text-align: left;">[Dole] 실속 바나나 1.1kg</strong> 
                <div class="in_option">
                    <div class="list_goods">
                        <ul class="list list_nopackage" style="margin-bottom: 30px;">
                            <li class="on" style="text-align: left;">
                                <span style="margin-right:0px;" class="btn_position">
                                    <button type="button" class="btn_del">
                                        <span style="margin-right:0px;" class="txt">삭제하기</span>
                                    </button>
                                </span> 
                                <span style="margin-right:0px;float:none;" class="name">[Dole] 실속 바나나 1.1kg</span>
                                <div class="option">
                                    <span style="margin-right:0px;" class="count">
                                        <button type="button" class="btn down" id="down">수량내리기</button> 
                                        <input type="number" readonly="readonly" onfocus="this.blur()" class="inp" value="1" style="text-align: right;"> 
                                        <button type="button" class="btn up" id="up">수량올리기</button>
                                    </span> 
                                    <span style="margin-right:0px;" class="price">
                                        <span style="margin-right:0px;" class="dc_price">2980원</span> 
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div> 
                    <div class="total">
                        <div class="price" style="margin-bottom: 20px;">
                            <strong class="tit" style="padding: 7px;">합계</strong>
                            <span style="margin-right:0px;float: none;" class="sum">
                                <span style="margin-right:0px;float: none;" class="num" >2980</span> 
                                <span style="margin-right:0px;float: none;" class="won">원</span>
                            </span>
                        </div> 
                       
                    </div>
                </div> 
                <div class="group_btn off layer_btn2">
                    <span class="btn_type2" style="margin-right: 0px;">
                        <button type="button" class="txt_type" id="close" style="cursor: pointer;">취소</button>
                    </span> 
                    <span class="btn_type1" style="margin-right: 0px;">
                        <button type="button" class="txt_type" style="cursor: pointer;">장바구니 담기</button>
                    </span> 
                </div>
            </div>
        </div> 
    </div>
   </div>
    <!--모달창-->
    <script>
        function cartLayerOpenAction(){
            $(".cart_type3").show();
        }
        
        function closebtn(){
            $('.cart_type3').css("display",'none');
        }

        $("#close").click(function(){
            $('.cart_type3').css("display",'none');
        })
    </script>

      <!-- 수량 + / - -->
      <script>
        $("#up").click(function(){
        var num = $(".inp").val();
        var plusNum = Number(num) + 1;
        $(".inp").val(plusNum); 
        var sum = 2980;
        var allsum = plusNum * sum;
        $(".num").html(allsum);
        });
        
        $("#down").click(function(){
        var num = $(".inp").val();
        var minusNum = Number(num) - 1; 
        if(minusNum < 1){
           minusNum = 1;
        }
        var sum = 2980;
            if(minusNum <= 0) {
                $(".inp").val(num);
            } else {
                $(".inp").val(minusNum);           
            }
            var allsum = minusNum * sum;
            $(".num").html(allsum);
            
        });
    </script>
</body>
</html>