<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8" import="com.kh.market.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="resources/css/header.css">
	<link rel="stylesheet" href="resources/css/boarddetail.css">

    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->

    <title>Document</title>
    <style>
        .product_count{
            border:1px solid #ddd;
            border-radius: 50px;
            display: flex;
            align-items: center;
            padding: 6px 6px;
            width: 70px;
            height: 13px;
            float: right;
        }
        .input_num{
            border: 0px solid transparent;
            text-align: center;
        }

        .count_btn{
           border: none;
           background: none;
        }

        .proCount{
            display: inline; 
            /* float: right; */
        }
        
                /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 20%; /* Could be more or less, depending on screen size */                          
        }
        
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
        	
        tab_menu li:last-child a {
		    border-left: 0 none;
		}
		.tab_menu li {
		    float: left;
		    width: 410px;
		    height: 49px;
		    background-color: #fff;
		    list-style:none;
		}
		.tab_menu .on a {
		    border-bottom: 4px solid #2e8b57;
		    font-weight: 700;
		    color: #2e8b57;
		}
		.tab_menu a {
		    display: block;
		    overflow: hidden;
		    width: 99%;
		    height: 100%;
		    border: 1px solid #dddfe1;
		    font-size: 14px;
		    color: #666;
		    line-height: 44px;
		    text-align: center;
		}
		.tab_span{
			float:none;
			margin-right:0px;
		}
		a { 
		text-decoration:none;
		}
		#deletebtn{
			float:right;
	        font-weight: lighter;
	        font-size: 13px;
	        cursor:pointer;
	        border: 0px solid;
	        background: white;
	        font-family: MapoPeacefull;outline: none;
	    }
    </style>
</head>
<body>
    <!--header-->
    <%@include file="../common/header.jsp" %>
    <!-- header end-->

    <!-- boardDetail-->
    <div class="boardDetailview">
        <div class="boardDetail">
            <div class="sectionView">
                <div class="sectionInner">

                    <div class="detailImg">
                    	<c:if test="${b.mc_cate_num >=100 }">
                        <img src="resources/img/userRecipe/${b.getMb_rename() }" style="width:400px;" onERROR="this.src='resources/img/errorimg.PNG' ">
                        </c:if>
                        <c:if test="${b.mc_cate_num < 100 }">
                        <img src="resources/img/tvRecipe/${b.getMb_rename() }" style="width:400px;" onERROR="this.src='resources/img/errorimg.PNG' ">
                        </c:if>
                        <div>
                        <c:if test="${ !empty sessionScope.loginUser }">
                            <img src="resources/img/unheart.png" onclick="heartplus();" id="choice" class="choice">
                            <img src="resources/img/heart.png" onclick="heartminus();" id="unchoice" class="choice" style="display: none">
                        </c:if>
                        </div>
                    </div>

                    
                    <div class="goods_name">
                        <h3 class="name">${ b.mb_title}</h3>
                        <div class="good_list">
                            <ul>
                                <li>
                                    <div class="ment">조회수</div>
                                    <div class="ment_sub">${b.mb_count}</div>
                                </li>
                                <li>
                                    <div class="ment">추천수</div>
                                    <div class="ment_sub" id="rr">${ b.mb_thank }</div>
                                </li>

                                <li>
                                    <div class="ment">${b.mb_content}</div>
                                </li>
                                
                                <br>
                                <br><br>
                                
                                <li>
                                	<table style="width:100%;" id="l_table">
                                		<thead>
	                                		<tr>
	                                			<th class="col" style="width:340px;">상품</th>
	                                			<th class="col" style="width:100px;">가격</th>
	                                			<th class="col" style="width:100px;">수량</th>
	                                		</tr>
                                		</thead>
                                		<tbody>
                                			<c:forEach var="bp" items="${b.getBplist() }">
		                                		<tr id="product${bp.getPrd().getPr_code() }">
		                                			<td style="padding-top:17px">
			                                            <input type="checkbox" name="product" id="source" value="source" class="check"/>
			                                            <input type="hidden" value="${bp.getPrd().getPr_code() }" name="pr_code" id="pr_code"/>
			                                            <input type="hidden" value="${bp.getPrd().getPr_price() }" name="pr_price" id="pr_price"/>
			                                            <label for = "source" style="font-size:16px;" name="pr_name" id="pr_name">${bp.getPrd().getPr_name() }</label>
		                                            </td>
		                                            <td>
		                                            	<c:set var="t" value="${bp.getPrd().getPr_price() *bp.peach }"></c:set>
			                                            <label for = "source" style="font-size:16px;" id ="total_price"><c:out value="${t }"></c:out></label>
			                                            <label for = "source" style="font-size:16px;">원</label>
				                                    </td>
				                                    <td>        
			                                            <div class="proCount">
			                                                <div class="product_count">
			                                                    <button onclick="form_btn(-1, ${bp.getPrd().getPr_code() })" class="count_btn">-</button>
			                                                    <input type="text" id="pr_each" value="${bp.peach }" style="width: 30px;" class="input_num">
			                                                    <button onclick="form_btn(1, ${bp.getPrd().getPr_code() })" class="count_btn">+</button>
			                                                </div>
			                                            </div>
		                                			</td>
	                                			</tr>
                                           </c:forEach>
                                		</tbody>
                                	</table>

                                </li>
                                <li>
                                    <div class="price">
                                        <span class="total">합계 :</span>
                                        <span class="price">
                                            <strong  id="total">0</strong>
                                            <strong>원</strong>
                                        </span>
                                    </div>
                                </li>
                                
                                <li>
                                    <div style="display: flex; float: right; margin-top: 15px; margin-bottom: 30px;">
                                        <a href="#" onclick="saveRecipe();" class="bag">장바구니에 담기</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="#" onclick="miroticView();" class="bag">주문하기</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                
                
                <!-- 레시피 상단부분 (info) end -->
                <!-- 레시피 내용 s-->
                <div class="recipe_view">
                    <ul class="recipe_cotent">
                        <li class="recipe_tab">레시피내용</li>
                    </ul>
                    	<div class="turn"><p style="margin-left: 10px;">조리순서</p></div>
                    	
                    	<c:forEach var="be" items="${b.getBelist() }">
                       		<div class="step1">
	                            <div class="countR">${be.getSeq() } .</div>
	                            <div class="step1ment">${be.getContent() }</div>
	                            <c:if test="${b.mc_cate_num >=100 }">
	                            	<div class="stem1img"><img src="resources/img/userRecipe/${be.getRename()}" class="foodR"></div>
	                            </c:if>
	                            <c:if test="${b.mc_cate_num < 100 }">
	                            	<div class="stem1img"><img src="resources/img/tvRecipe/${be.getRename()}" class="foodR"></div>
	                            </c:if>
	                        </div>
                    	</c:forEach>
                       

                </div> <!-- class="recipe_view" -->

                  <div>
                    <ul class="recipe_cotent">
                        <li class="recipe_reply" data-tab="tab2" style="border-right: 1px solid #2e8b57;width: 85px;">댓글
                        <span class="tab_span">(${b.getBrlist().size()})</span>
                        </li>
                    </ul>
                </div>
                     <!-- 댓글 -->
                     <div id="tab1" class="reply current">
                     
                       <c:forEach var="br" items="${b.getBrlist() }">
                     	<div class="reply_body">
                     	
                            <h4 class="reply_head"><b class="reply_name">${br.getWriter()} 님</b>${br.cdate}     
                     	 	<input type="text" name="rId" value="${br.rId}" hidden>
                     	 	<c:url var="deleteReply" value="deleteReply">
								<c:param name="rId" value="${br.rId}"/>
								<c:param name="bId" value="${b.mb_num}"/>
								<c:param name="TvOrUser" value="${ TvOrUser }"/>
							</c:url>
                            <c:if test="${ loginUser.mem_id eq br.getWriter()}">
                             	<input type="button" value="삭제"  id="deletebtn" onclick="if(confirm('정말 삭제 하시겠습니까??') == true){ location.href='${deleteReply}';}">
                            </c:if>
                            </h4>
                            <p class="reply_main">${br.getContent() }</p>
                        </div>
                     </c:forEach>

                        
                         <div>
					            <div><p style="border-bottom: 2px solid #2e8b57; font-size: 20px; text-align:left;padding-bottom: 10px;"><strong>댓글</strong></p></div>
					            <div class="re">
					                <textarea id="content" style=" resize: none; width: 800px; height: 50px; font-family: MapoPeacefull; border: 1px solid #dedede; border-radius: 5px;"></textarea>
					                 <input type="button" value="등록" class="btn" id="replybtn"onclick="''" 
					                 style="float: none;margin-top: 0px;border-radius: 5px;margin-left: 15px;cursor:pointer;width:80px">
					            </div>
					        </div>
                    </div>
            </div>
            
        </div>
    </div>
    <!-- boardDetail end-->



	<!-- myModal 장바구니 -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
      	<label>여기에 대충 장바구니 정보 출력</label>
        <p>장바구니에 등록되었습니다.</p>
        <button onclick="location.href='basket'">장바구니로 이동하기</button>
        <button id="modalClose">계속하기</button>
      </div>

    </div>



    <script>

         // 폼값 증가&감소
         function form_btn(n, pr_code){
            
        	 var selector = "product"+pr_code+" td";
            
            text_val = Number($('#'+selector).children().children().children('#pr_each').val()); // 폼 값을 숫자열로 변환
            text_val += n; // 계산
            
            console.log(text_val);
            
            if(text_val < 0){
               text_val = 0;   // 만약 값이 0 미만이면 0로 되돌려준다, 1보다 작은 수는 나타나지 않게하기 위해   
            }
            
            $('#'+selector).children().children().children('#pr_each').val(text_val); // 수량을 바꾼다    
         
            var total_price = Number($('#'+selector).children('#pr_price').val())*text_val
            console.log('상품 총 가격 : '+total_price);
            $('#'+selector).children('#total_price').text(total_price);
            
            total_val();
            
        }	//form_btn

        
        // 가격을 계산하는 함수
        function total_val(){
        	
        	var total=0;
        	console.log('-- 가격 갱신 --');
        	
        	$.each($('label#total_price'), function(index, item){
        		console.log(index+'번째 상품 갱신된 가격 : '+ $(item).text());
        		total= Number($(item).text())+total;
        	})
        	
        	console.log('계산된 total : '+total);
        	$('#total').text(total);
        }
        
        
        
        
         //화면이 나오면 토탈값을 계산해준다.
         $(function(){
        	 
        	 var total=0;
        	 
        	 console.log('-- 처음 total계산 --');
        	 $.each($('input#pr_price'), function(index, item){
        		 console.log(index+'번째 상품 가격 : '+ Number($(item).val()));
        		 total = total + Number($(item).val());
        	 });
        	 
        	 console.log('계산된 total : '+ total);
        	 
        	 $('#total').text(total);
        	 
        	 total_val()
        	 
        	 console.log('${loginUser}');
         });
         
         $(function(){
        	 console.log("책책");
        	 var bId = '${bId}';
  			 var TvOrUser = '${TvOrUser}';
  			 var mem_num =  '${ loginUser.mem_num }';
  			 
        	 $.ajax({
        		 type:"POST", 
        		 url: "heartcheck",
        		 data : { bId : bId, TvOrUser : TvOrUser,mem_num : mem_num },
 				success:function(result){
					if(result == 'ok'){ 
						console.log('책책 누른적 있음');
						$('#choice').css("display", "none");
			        	$('#unchoice').css("display", "block");
						
						
					}else if(result == "fail"){ 
						console.log('책책 누른적 없음');
						$('#unchoice').css("display", "none");
			        	$('#choice').css("display", "block");
					}else if(resutl == "nologin"){
						
					}
				}, 
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				} 
        	 });
         });

         
         var modal = document.getElementById('myModal');
         var close = document.getElementById("modalClose");
         
	        // When the user clicks on <span> (x), close the modal
	        close.onclick = function() {
	            modal.style.display = "none";
	        }
	 
	        // When the user clicks anywhere outside of the modal, close it
	        window.onclick = function(event) {
	            if (event.target == modal) {
	                modal.style.display = "none";
	            }
	        }
	        
	        
         //장바구니 function
         function saveRecipe(){
        	 
        	 if(${empty loginUser}){
        		 alert('회원만 이용 가능합니다.');
        		 return false;
        	 }
        	 
        	 //넘겨야될 값을 배열로 만든다.
        	 var prcodeArr = [];	//상품코드
        	 var prnameArr = [];	//상품이름
        	 var prpriceArr= [];	//상품가격
        	 var preachArr = [];	//상품 갯수
        	 
        	 $('table tbody tr td').children('#pr_code').each(function(index){
        		 prcodeArr[index] = $(this).val();
        	 })
        	 
        	 $('table tbody tr td').children('#pr_name').each(function(index){
        		 prnameArr[index]=$(this).text();
        	 })
        	 
        	 $('table tbody tr td').children('#pr_price').each(function(index){
        		 prpriceArr[index]=$(this).val();
        	 })
        	 
        	 $('table tbody tr td div div').children('#pr_each').each(function(index){
        		 preachArr[index]=$(this).val();
        	 })
        	 
        	 
        	 console.log('test prcodeArr : '+prcodeArr);
        	 console.log('test prnameArr : '+prnameArr);
        	 console.log('test prpriceArr : '+prpriceArr);
        	 console.log('test preachArr : '+preachArr);
        	 
        	 console.log(typeof(prcodeArr));

        	 $.ajax({
        		url:"myCart"
 				, data:{ bTitle : '${b.mb_title}'
        	 			, bId: '${b.mb_num}' 
        	 			, me_num : '${me_num}'
 						, 'prcodeArr' : prcodeArr
 						, prnameArr : prnameArr
 						, prpriceArr : prpriceArr
 						, preachArr : preachArr
 				}
        	 	, dataType:"text"
 				, type:"post"
 				, success:function(data){
 					//성 공 시 모달창 띄우기
 					console.log('success : '+data);
 					
 		        	 $('#myModal').css("display", "block"); 					
 				}
        	 	, error:function(request,status,error){
        	 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	 	}
        	 });
        	 

        	 
         }//saveRecipe
         
         

         //주문 페이지로 이동
         function miroticView(){
         	//주문을 누르는 순간
         	if(${empty loginUser}){
        		 alert('회원만 이용 가능합니다.');
        		 return false;
        	 }
         	
         	
         	//넘겨야될 값을 list로 만든다.
	       	 var list=[];
	    	$.each($('#l_table tr'), function(index, item){
	       		var cart={};
	       		list.push({
		       		'pr_code' : $(item).children().children().children('#pr_code').val()
		       		, 'pr_each' : $(item).children().children().children().children('#pr_each').val()
	       			});
	    	})//$.each  
	       	 
	       	 
	       	 
     	   	 $.ajax({	
     	   			url:"miroticView"
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
         	//확인
         	
        		
         }//miroticView
         
         
         
         
	        
	         function heartplus(){
	        	 //var bId = ${bId};
	  			 var TvOrUser = '${TvOrUser}';
	  			 var mem_num =  '${ loginUser.mem_num }';
	  			 
	        	 console.log("test plus");
	        	 $('#choice').css("display", "none");
	        	 $('#unchoice').css("display", "block");
	        	 $.ajax({
	        		 type:"POST", 
	        		 url: "heartplus",
	        		 data : { bId : ${bId}, TvOrUser : TvOrUser, mem_num : mem_num}
	        	 , success:function(result){
						if(result == 'ok'){
							alert("찜한 레시피 추가 실패");
							console.log('좋아요 더하기 성공');
						}else{
							alert("찜한 레시피에 추가되었습니다");
							console.log(result);
							$('div#rr').text(result);
							console.log('좋아요 더하기 실패');
						} 
					}, 
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
	        	 });
	        	 
			 }
	         
	         function heartminus(){
	        	 var TvOrUser = '${TvOrUser}';
	        	 var mem_num =  '${ loginUser.mem_num }';
	        	 console.log("test minus");
	        	 $('#unchoice').css("display", "none");
	        	 $('#choice').css("display", "block");
	        	 $.ajax({
	        		 type:"POST", 
	        		 url: "heartminus",
	        		 data : { bId : ${bId}, TvOrUser : TvOrUser,mem_num : mem_num },
	 				success:function(result){
	 					if(result == 'ok'){
							alert("찜한 레시피 추가 실패");
							console.log('좋아요 더하기 성공');
						}else{
							alert("찜한 레시피에 추가되었습니다");
							console.log(result);
							$('div#rr').text(result);
							console.log('좋아요 더하기 실패');
						}  
					}, 
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					} 
	        	 });
	         }


	      // 댓글등록
	          $("#replybtn").on("click",function(){
       var content = $("#content").val();
       var mb_num = ${b.mb_num};   
       var writer =  '${ loginUser.mem_id }';
       var TvOrUser = '${TvOrUser}';
       
       if(writer == "" ){
          alert("로그인을 해주세요.")
          return;
       }else  if(content == ""){                  
          alert("댓글을 작성해주세요.");
          return;
       }
			
			$.ajax({
				url:"insertReply",
				data:{content:content,bId:mb_num,writer:writer,TvOrUser:TvOrUser},
				type:"post",
				success:function(data){
						if(data == "success"){

							window.location.reload();								  
							$("#content").val("");
						}
				},error:function(){
					console.log("등록 실패");
				}
		});
			
	});

	</script>

</body>
</html>
