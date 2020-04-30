<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/boarddetail.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 탭 메뉴 -->
    <style>
        .head_aticle {
            padding: 5px 0 1px;
        }

        .tit {
            height: 42px;
            font-weight: 700;
            font-size: 22px;
            line-height: 36px;
            color: #333;
            text-align: left;
            margin-bottom: 0px
        }

        .recipe_main {
            box-sizing: border-box;
            width: 100%;
            margin-left: 0px;
            border-bottom: 2px solid #2e8b57;
            border-top: 2px solid #2e8b57;
        }

        .cont_tit4 {
            width: 140px;
            display: inline-block;
            font-size: 15px;
            font-weight: normal;
            margin-left: 20px;
        }

        .cok_title {
            width: 610px;
            display: inline-block;
            background: #f5f5f5;
            border: 1px solid #e1e1e1;
            font-size: 16px;
            padding-left: 15px;
            height: 50px;
            vertical-align: middle;
            margin-top: -1px;
        }

        .cont_box {
            padding: 26px 30px;
        }

        .cont_guide,
        .noti {
            font-size: 14px;
            display: inline-block;
            line-height: 1.8;
            margin-top: 6px;
            color: #999;
            margin-bottom: 10px;
        }

        .Flist {
            list-style: none;
        }

        .btnAll,
        #btndel {
            display: inline-block;
            width: 90px;
            text-align: center;
            height: 35px;
            font-size: 14px;
            line-height: 35px;
            vertical-align: middle;
            background: #2e8b57;
            color: #fff !important;
            text-decoration: none;
            border: none;
            border-radius: 3px;
        }

        .foodForm {
            width: 500px;
            height: 30px;
            border: 1px solid #dcdcdc;
            border-radius: 3px;
            padding-left: 12px;
        }

        .material {
            width: 500px;
            height: 30px;
            border: 1px solid #dcdcdc;
            border-radius: 3px;
        }

        .btn_delete {
            border: none;
            width: 80px;
            height: 30px;
            border-radius: 3px;
            margin-left: 10px;
            background: #2e8b57;
            color: #fff;
        }

        .companyName_input {
            height: 25px;
            border: 1px solid #dcdcdc;
            border-radius: 3px;

        }

        .recipeNum {
            width: 120px;
            display: inline-block;
            font-size: 30px;
            font-weight: normal;
            vertical-align: top;
            color: #2e8b57;
            margin-left: 20px;
            margin-bottom: 0px;
            margin-top: 60px;
        }

        .recipeArea {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .stepplus {
            border: none;
            background: none;
            margin: 10px 0 0 0;
            padding: 0;
            font-size: 16px;
            color: #444;
            font-family: MapoPeacefull;
        }

        .formControl_step {
            height: 160px;
            width: 430px;
            resize: none;
            border: 1px solid #dcdcdc;
            border-radius: 3px;
        }

        .plusphoto {
            /*165*/
            width: 138px;
            height: 138px;
        }

        .recipeItem {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .step_plus {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .deletestep {
            width: 20px;
            height: 20px;
            margin-left: 20px;
            float: left;
            border: none;

        }
    </style>
    <title>Document</title>
</head>

<body>
    <!--header-->
	<%@include file="../common/header.jsp" %>
    <!-- header end-->

    <!-- boardDetail-->
    <div class="boardDetailview">
        <div class="boardDetail">
            <div class="sectionView">
                <div class="head_aticle">
                    <h2 class="tit">나만의 레시피 작성</h2>
                </div>

			<form action="TVrecipeinsert" id="insertfrm" method="POST" enctype="multipart/form-data">
                <div class="recipe_main" style="text-align: initial;">
                    <div id="divMainPhotoBox" is_over="0">
                        <img id="mainPhotoHolder" src="resources/img/photo.gif"
                            style="width: 200px; height: 200px; cursor:pointer;float: right; margin-top: 22px;">
                        <input type="file" id="mainImg" name="mainImg" class="mainImg" required
                            style="display: none;">
                    </div>
                    <div class="cont_line">
                        <p class="cont_tit4">레시피 제목</p>
                        <input type="text" name="mb_title" id="cok_title" value="" class="form-control" required
                            placeholder="예) 소고기 미역국 끓이기"
                            style="width:500px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
                    </div>
                    <div class="cont_line">
                        <p class="cont_tit4">요리 소개</p>
                        <input type="text" name="mb_content" id="cok_title" value="" class="form-control" required
                            placeholder="요리의 소개를 간단히 작성해주세요"
                            style="width:500px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
                    </div>
                   
                    <div class="cont_line">
                        <p class="cont_tit4">카테고리</p>
                        <select name="mc_cate_num"style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
                            <option value="1">강식당</option>
                            <option value="2">수미네 반찬</option>
                            <option value="3">집밥백선생</option>
                            <option value="4">최고의 요리비결</option>
                            <option value="5">현지에서 먹힐까?</option>
                            
                        </select>
                    </div>

                    <div class="cont_line">
                        <p class="cont_tit4">요리정보</p>

                        <select name="mb_serving" id="cok_portion" text="인원"
                            style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
                            <option value="">인원</option>
                            <option value="1">1인분</option>
                            <option value="2">2인분</option>
                            <option value="3">3인분</option>
                            <option value="4">4인분</option>
                            <option value="5">5인분</option>
                            <option value="6">6인분이상</option>
                        </select>

                        <select name="mb_time" id="cok_time" text="요리시간"
                            style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
                            <option value="">시간</option>
                            <option value="5">5분이내</option>
                            <option value="10">10분이내</option>
                            <option value="15">15분이내</option>
                            <option value="20">20분이내</option>
                            <option value="30">30분이내</option>
                            <option value="60">60분이내</option>
                            <option value="90">90분이내</option>
                            <option value="120">2시간이내</option>
                            <option value="999">2시간이상</option>
                        </select>

                        <select name="mb_level" id="cok_degree" text="난이도"
                            style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
                            <option value="">난이도</option>
                            <option value="1">누구나</option>
                            <option value="2">초급</option>
                            <option value="3">중급</option>
                            <option value="4">고급</option>
                            <option value="5">신의경지</option>
                        </select>
                    </div>

                    <hr style="width: 1100px; border: 1px dashed #dcdcdc;">

                    <div class="cont_box">
                        <span class="cont_guide" style="width:100%;">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</span>
                        <div class="cont_Flist">
                            <table class="table_career">
                                <thead>
                                    <tr>
                                        <th class="table_width_group">분류</th>
                                        <th class="table_width_material">재료</th>
                                        <th class="table_width_amount">상품</th>
                                        <th class="table_width_amount">양</th>
                                        <th class="table_width_amount">개수</th>
                                        <th class="table_width_delete">삭제</th>
                                    </tr>
                                </thead>
                                <tbobdy id="career_inventory">
                                    <tr name="tableList">
                                        <td class="table_list_add"> <!-- sikim -->
					                        <select name="CATE1" id="id_lang" text="분류" onchange="changemaincate(0)" 
					                            style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
					                            <option value="" selected disabled hidden>선택해주세요</option>
                                        <c:forEach var="m" items="${ maincate }">
					                            <option value="${ m.catecode1 }" >${ m.catename1 }</option>
					                    </c:forEach>
					                        </select>
                                        </td>

                                        <td class="table_list_add">
                                             <select name="CATE2" id="cate2" text="분류" onchange="changesubcate(0,this)"
					                            style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
					                        </select>
					                            <input type='hidden' name="pcode">
					                        
                                        </td>

                                        <td class="table_list_add">
                                        	<select name="product_list" id="product_list" text="분류" onchange='changeprsize(0,this);'
					                            style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">
					                        </select>
					                        
                                        </td>
                                        
                                        <td class="table_list_add">
                                            <input class="product_size" data-validation="required" name="pr_size" required
                                               required="required" type="text">
                                        </td>
                                        
                                        <td class="table_list_add">
                                            <input class="product_Num" data-validation="required" name="peach" required
                                                required="required" type="text">
                                        </td>

                                        <td class="button_set">
                                            <button class="btn_delete" name="delbutton">삭제</button>
                                        </td>

                                    </tr>
                                </tbobdy>

                            </table>
                        </div>

                        <div class="noti">※ 양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요.
                            <div class="noti_btn">
                                <button onclick="add_row()" type="button" class="btnAll" name="btnplus"
                                    style="width: 200px; margin-top: 10px;">
                                    	재료/양념 추가
                                </button>
                            </div>
                        </div>
                    </div>

                    <hr style="width: 1100px; border: 1px dashed #dcdcdc;">

                    <div class="food_content">
                        <p class="cont_tit4" style="font-size: 20px;">요리순서</p>
                        <div class="recipeArea" id="recipeArea">
                            <div class="recipeItem" name="step" id="test1">
                                <button style="width: 20px; height: 20px;" name="deletestep" style="border: none; "
                                    class="deletestep"></button>
                                <p class="recipeNum">Step</p>
                                <div id="divStepText" style="display:inline-block">
                                    <textarea required name="content" id="step_text" class="formControl_step"
                                        placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."></textarea>
                                     <textarea name="content" style="display: none">&&</textarea>
                                </div>
                                <div id="divStepUpload" style="display:inline-block">
                                    <div id="5" is_over="0">
                                        <img id="stepPhoto" src="resources/img/plus.gif" class="plusphoto"
                                            style="cursor: pointer">
                                        <input type="file" id="subImg" name="subImg" class="fileimg" onchange="LoadImg(this)" required
                                            style="display: block;">
                                    </div>
                                    
                                </div>
                            </div>
                        </div>

                        <div style="display: grid;  margin-top: 20px;">
                            <!-- <button type="button" class="btnAll" name="btnplus" style="width: 200px; margin-top: 10px;">순서 추가</button> -->
                            <button type="button" name="addstep" class="stepplus">
                                <span class="step_plus"></span><img src="resources/img/plusbtn.png"
                                    style="width:20px;height:20px; margin-right: 10px; vertical-align: bottom;">순서추가
                            </button>
                        </div>
                    </div>
                    <center>
                    
					<input type="submit" value="작성하기" id="joinokbtn" class="okbtn" style="background: #2e8b57; color: #fff !important; text-decoration: none; border: none;
					border-radius: 3px;
				    height: 30px;
				    margin-bottom: 10px;
				    width: 80px;">
                    </center>
	                </div>
	               </form>

            </div>
        </div>
    </div>
    
    <!-- boardDetail end-->

    <script>
    $(function(){
    	console.log("${subcatelist_product}");
    })
        
    // 재료 추가 
    	var l = 1;
    	var l2 = 1;
    
        $(document).on("click", "button[name=btnplus]", function () {
        	l = document.getElementsByName("CATE1").length;
        	l2 = document.getElementsByName("CATE2").length;
            var btnplusText = '<tr name ="tableList">' +

                '<td class="table_list_add">' +
                '<select name=CATE1 onchange="changemaincate('+l+')" style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">'+
                "<option selected disabled hidden>"+"선택해주세요"+"</option>";
                for(var j=0;j<maincatelist.length;j++){
                	btnplusText+= '<option value='+maincatelist[j].catecode1+'>' +
                	maincatelist[j].catename1+'</option>';
                }
                
                
                btnplusText+='</select>'+
                '</td>' +

                '<td class="table_list_add">' +
                '<select name="CATE2" id="cate2" onchange="changesubcate('+l2+',this)" text="분류" style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">'+
                '</select>' +
                '<input type="hidden" name="pcode">'+
                '</td>' +
              

                '<td class="table_list_add">' +
                '<select name="product_list" onchange="changeprsize('+l2+',this)" id="product_list" text="분류" style="width: 150px; height: 30px; border: 1px solid #dcdcdc; border-radius: 3px;">'+
                '</select>' +
                '</td>' +
                
                '<td class="table_list_add">' + 
                '<input  class="product_size" data-validation="required" name="pr_size" required="required" type="text">' +
                '</td>' +
                
                '<td class="table_list_add">' +
                '<input class="product_Num" data-validation="required" name="peach" required="required" type="text">' +
                '</td>' +

                '<td class="button_set">' +
                '<button class="btn_delete" name="delbutton">삭제</button>' +
                '</td>' +
                '</tr>';
            var trHtml = $('tr[name=tableList]:last');
            trHtml.after(btnplusText);
           //l = document.getElementsByName("CATE1").length;
        });

        // 재료 삭제 기능
        $(document).on("click", "button[name=delbutton]", function () {

            var trHtml = $(this).parent().parent();

            trHtml.remove(); //tr 테그 삭제

        });
        
        
        


        //첫 사진 
        // document.getElementById("stepPhoto").onclick = function () {
        //     document.getElementById('file').click();
        //     console.log("rothfl");
        //     console.log(document.getElementById('file'));
        // };

/*         $(document).on("click", "input[name=file]", function () {
            console.log("click");
            document.getElementById('file').click();
            console.log(document.getElementById('file'));
        });
 */



 
 
 
        var stepplus = document.getElementById("recipeArea").innerHTML;





        // 순서 추가
        $(document).on("click", "button[name=addstep]", function () {
         $('#recipeArea').append(stepplus);

        });
        
        
        
        //이미지 띄우기
        
	function LoadImg(value){
        	console.log(value);
        	
		if(value.files && value.files[0]){
			var reader = new FileReader();
		
			reader.onload = function (e) {
				$(value).parent().children('#stepPhoto').attr('src', e.target.result);
			}//reader
				
		reader.readAsDataURL(value.files[0]);
		}//if
	}
        
        
        
        

        // 순서 삭제
        $(document).on("click", "button[name=deletestep]", function () {

            console.log($(this).parent().parent().children());
            var trHtml = $(this).parent();
            console.log(trHtml);
            trHtml.remove(); //tr 테그 삭제
            l = document.getElementsByName("CATE1").length;
        });

        console.log($("#file").prev());

        // var sel_file;
        // $(document).ready(function () {
        //     $("#file").on("change", handleImgFileSelect); //input type file
        // });
        // function handleImgFileSelect(e) {
        //     var files = e.target.files;
        //     var filesArr = Array.prototype.slice.call(files);
        //     filesArr.forEach(function (f) {
        //         if (!f.type.match("image.*")) {
        //             alert("확장자는 이미지 확장자만 가능합니다.");
        //             return;
        //         }
        //         sel_file = f;
        //         var reader = new FileReader();
        //         reader.onload = function (e) {
        //             $("#file").prev().attr("src", e.target.result); // img 보이는 영역
        //         }
        //         reader.readAsDataURL(f);
        //     });
        // }

        // 이미지 & 파일 
        // $(function () {
        //     $('#stepPhoto').click(function (e) {
        //         e.preventDefault();
        //         $('#file').click();
        //     });
        // });



        $("#mainPhotoHolder").click(function (e) {
                e.preventDefault();
                $(".mainImg").click();
        });


        function Joinbtn(){
        	document.getElementById("insertfrm").submit()
        }

        var sel_file;
        $(document).ready(function() {
           $("#mainImg").on("change", handleImgFileSelect); //input type file
        });
        
        function handleImgFileSelect(e) {
           var files = e.target.files;
           var filesArr = Array.prototype.slice.call(files);
           filesArr.forEach(function(f) {
              if (!f.type.match("image.*")) {
                 alert("확장자는 이미지 확장자만 가능합니다.");
                 return;
              }
              sel_file = f;
              var reader = new FileReader();
              reader.onload = function(e) {
                 $("#mainPhotoHolder").attr("src", e.target.result); // img 보이는 영역
              }
              reader.readAsDataURL(f);
           });
        }
        
        var maincatelist = new Array();
        $(function(){
           $.ajax({
              url:"adminmaincategory",
              dataType:"json",
              success:function(data){

                 console.log(data);
                 maincatelist=data;
              },error:function(request, status, errorData){
                 alert("error code : " + request.status + "\n"
                       + "message : " + request.responseText
                       + "error : " + errorData);
              }
           });
           
        });
        
        
        
        function changemaincate(i){ //sikim
        	console.log("첫" + i);
        	document.getElementsByName("pr_size")[i].value="";
			document.getElementsByName("peach")[i].value="";
			document.getElementsByName("CATE2")[i].innerHTML="";
			document.getElementsByName("product_list")[i].innerHTML="";
			
        	var langSelect = document.getElementsByName("CATE1")[i];
       	    var selectValue = langSelect.options[langSelect.selectedIndex].value;
       	    var selectText = langSelect.options[langSelect.selectedIndex].text;
     		var longi=i;
        	console.log(selectValue);
        	console.log(selectText);
        	
        	/* if(selectValue == '${subcate[i].upcate}'){
        		 console.log('${subcate[i]}'); */
        		
        	
               $(function(){
            	  $.ajax({
                   url:"maincate_subcatesearch",
                   data:{selectValue:selectValue},
                   type:"post",
                   success:function(data){
						document.getElementsByName("CATE2")[longi].innerHTML="";
						document.getElementsByName("CATE2")[longi].innerHTML+="<option selected disabled hidden>"+"선택해주세요"+"</option>";
						for(var i = 0 ;i<data.length;i++){
						document.getElementsByName("CATE2")[longi].innerHTML+="<option value="+data[i].catecode2+">"+data[i].catename2+ "</option>";
		  	            }
                   },error:function(request, status, errorData){
                      alert("error code : " + request.status + "\n"
                            + "message : " + request.responseText
                            + "error : " + errorData);
                   }
                });
                
             }); 
        	}
        
        var pr_Array = new Array();
        	
        function changesubcate(i,t){
			document.getElementsByName("pr_size")[i].value="";
			document.getElementsByName("peach")[i].value="";
        	
        	console.log("서브 카테고리 실행?")
        	var langSelect = document.getElementsByName("CATE1")[i];
       	    var selectValue = langSelect.options[langSelect.selectedIndex].value;
        	var langSelect2 = document.getElementsByName("CATE2")[i];
       	    var selectValue2 = langSelect2.options[langSelect2.selectedIndex].value;
       	    var selectText2 = langSelect2.options[langSelect2.selectedIndex].text;
     		var longi=i;
        	console.log(selectValue2);
        	console.log(selectText2);
        
         $(function(){
      	  $.ajax({
             url:"maincate_subcatesearch_product",
             data:{'pr_cate1':selectValue, 'pr_cate2':selectValue2},
             type:"post",
             success:function(data){
            	 console.log(data);
            	 pr_Array=data;
            	 
					
            	 var prlist = new Array();
            	 	document.getElementsByName("product_list")[longi].innerHTML="";
//					document.getElementsByName("product_size")[longi].value=""; //sikim
					document.getElementsByName("product_list")[longi].innerHTML+="<option selected disabled hidden>"+"선택해주세요"+"</option>";
					for(var i = 0 ;i<data.length;i++){
						document.getElementsByName("product_list")[longi].innerHTML+="<option value="+data[i].pr_size+","+data[i].pr_code+">" +data[i].pr_name+"</option>"; 
						//document.getElementsByName("product_list")[longi].innerHTML
						//+="<option value="+data[i].pr_size+">" +data[i].pr_name+"<input name='pcode' type='hidden' value="+data[i].pr_code+"/>"+"</option>"; 
					
	  	            }
					
             },error:function(request, status, errorData){
                alert("error code : " + request.status + "\n"
                      + "message : " + request.responseText
                      + "error : " + errorData);
             }
          	});
       		}); 
        }
        
        	
					function changeprsize(i,t) {

						//console.log(document.getElementsByName("product_list")[i].value);
						//document.getElementsByName("product_list")[i]
						console.log(i);
						console.log(t.value.split(','));
						document.getElementsByName("pr_size")[i].value = t.value.split(',')[0]; // 양 표시
						document.getElementsByName("pcode")[i].value =t.value.split(',')[1];
							

						}
 
					
				</script>






</body>

</html>
