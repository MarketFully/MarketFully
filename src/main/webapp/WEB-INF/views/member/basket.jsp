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
      <%@include file="../common/header.jsp" %>>

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
                                        <span style="float:none;margin-right:0px;" class="num_count" style="margin-right: 0px;">2</span>&nbsp;&nbsp;/&nbsp;
                                        <span style="float:none;margin-right:0px;" class="num_total" style="margin-right: 0px;">2</span>&nbsp;)
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
                                    <tr>
                                        <td header="thSelect" class="goods_check" style="width: 76px;">
                                            <label class="label_check checked">
                                            <input type="checkbox" name="" class="ico_check" value="5051" id="check1">
                                            <label for="check1"></label>
                                            </label></td> 
                                        <td header="thInfo" class="goods_thumb" style="width: 100px;">
                                            <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="thumb">
                                            <img src="https://img-cf.kurly.com/shop/data/goods/1481095558837i0.jpg" alt="상품이미지" onerror="this.src='https://res.kurly.com/pc/temp/1801/noimg_100.gif'"></a>
                                        </td> 
                                        <td header="thInfo" class="goods_info" style="width: 488px;"> 
                                            <a href="/shop/goods/goods_view.php?&amp;goodsno=5051" class="name">[존쿡 델리미트] 바베큐 백립 450g (냉동)</a> 
                                            <dl class="goods_cost" style="margin: 0px;"><dt class="screen_out">판매가격</dt> 
                                                <dd class="selling_price">
                                                    <span style="float:none;margin-right:0px;" class="num" style="font-size: 12px; font-weight: bold; margin-right: 0px;">15,000</span> 
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
                                                    <input type="text" readonly="readonly" class="inp_quantity" value="1"> 
                                                    <button type="button" class="btn btn_rise">
                                                        <img src="resources/img/plus.png" alt="추가"></button>
                                                </div>
                                            </div>
                                        </td> 
                                        <td header="thCost"  style="width: 110px;">
                                            <dl class="goods_total">
                                                <dt class="screen_out">합계</dt> 
                                                <dd class="result">
                                                    <span style="float:none;margin-right:0px;" class="num" style="margin: 0px;">15,000</span> 
                                                    <span style="float:none;margin-right:0px;" class="txt" style="margin: 0px;">원</span>
                                                </dd>
                                            </dl>
                                        </td > 
                                        <td header="thDelete" class="goods_delete" style="width: auto;">
                                            <button type="button" class="btn btn_delete" id="deletebtn">
                                            <img src="https://res.kurly.com/pc/ico/1801/btn_close_24x24_514859.png" alt="삭제"></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>                        
                    </div> 
                </div> 

                <div class="all_select select_option">
                    <button type="button" class="btn_delete" id="btnnnnn1">선택 삭제</button> 
                    <button type="button" class="btn_delete">품절 상품 삭제</button>
                </div>

                <div class="product_price_box--2_sRjHNYSb" style="height: 62px;">
                    <div class="product_price_detail--1ZRE4kKbD-">
                        <dl class="product_price--29YDGAO_uo">
                            <dt>총 상품금액</dt>
                            <dd style="margin-left: 0px;">
                                <span style="float:none;margin-right:0px;" class="price--JIZ5vfiqW7" style="margin-right: 0px;">15,000</span>원  
                            </dd>
                        </dl>
                        <label style="font-size: 30px;font-weight:bold;padding-right: 54px;color: rgb(189, 187, 187);">+</label>
                        <dl class="product_price--29YDGAO_uo">
                            <dt>배송비</dt>
                            <dd style="margin-left: 0px;">
                                <span style="float:none;margin-right:0px;" class="price--JIZ5vfiqW7" style="margin-right: 0px;">0</span>원
                            </dd>
                        </dl>
                    </div>
                    <strong class="product_price_total--3usHUQ97oy">총 주문금액
                        <span style="float:none;margin-right:0px;" class="txt_point--bAwRwaaTcp">
                            <span style="float:none;margin-right:0px;" class="price--JIZ5vfiqW7">15,000</span>원
                        </span>
                    </strong>
                 </div>
                    <div class="notice_cart">*적립금은 다음화면인 ‘주문서’에서 확인가능합니다.</div> 
                    <button type="button" class="btn_submit">주문하기 
                    </button> 
                </div>

                <p class="info_notice">
                    ‘입금확인’ 상태일 때는 주문내역 상세 페이지에서 직접 주문취소가 가능합니다.<br>
                    ‘입금확인’ 이후 상태에는 고객행복센터로 문의해주세요.
                </p>
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
        });
   
    </script>

    <!-- 전체동의가 체크되있을 때 하나라도 풀리면 해제 -->
    <script>           
        $(".ico_check").click(function(){
        $("#chk_all").prop("checked", false);
        });
    </script> 

    <!-- 수량 + / - -->
    <script>
        $(".btn_rise").click(function(){
        var num = $(".inp_quantity").val();
        var plusNum = Number(num) + 1;

        $(".inp_quantity").val(plusNum);     
        });
        
        $(".btn_reduce").click(function(){
        var num = $(".inp_quantity").val();
        var minusNum = Number(num) - 1;  
        
            if(minusNum <= 0) {
                $(".inp_quantity").val(num);
            } else {
                $(".inp_quantity").val(minusNum);          
            }
            
        });
    </script>

   <!--x 눌렀을때 삭제-->
   <script>
    $("#l_table tr>td:last>#deletebtn")
     .on('click', function(){
         if (confirm("정말 삭제하시겠습니까??") == true){    //확인
             $(this).parent().parent().remove();
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
                if($('#l_table tr').children().children().children().prop('checked')){
                    $('#l_table tr').remove();
                }//if
         }else{   //취소
             return false;
         }  
     });
     </script>
</body>
</html>