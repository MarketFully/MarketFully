<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%-- <%request.getAttribute("subcate"); %> --%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 이미지 슬라이드  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<title>Charts - SB Admin</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/main.css">
<title>mainpage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Draggable + Sortable</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/demos/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<style>
.jul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	margin-bottom: 10px;
	cursor: pointer;
}

.jli {
	margin: 5px;
	padding: 5px;
	width: 200px;
	cursor: pointer;
}

.mdl-button--fab {
	border-radius: 50%;
	font-size: 24px;
	height: 28px;
	margin: auto;
	min-width: 28px;
	width: 28px;
	padding: 0;
	overflow: hidden;
	background: rgba(158, 158, 158, .2);
	box-shadow: 0 1px 1.5px 0 rgba(0, 0, 0, .12), 0 1px 1px 0
		rgba(0, 0, 0, .24);
	position: relative;
	line-height: normal;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
        $(function () {
            $("#sortable").sortable({
                revert: true
            });
            $("#draggable").draggable({
                connectToSortable: "#sortable",
                helper: "clone",
                revert: "invalid"
            });
            $(".jul, .jli").disableSelection();
        });

       

        $(function () {
            $("#sortable3").sortable({
                revert: true
            });
            $("#draggable3").draggable({
                connectToSortable: "#sortable3",
                helper: "clone",
                revert: "invalid"
            });
            $(".jul, .jli").disableSelection();
        });
    </script>




</head>

<body>
	<div class="full">
		<div class="container">
			<!-- header -->
			<%@include file="../common/adminheader.jsp"%>
			<!--헤더 끝-->
			<hr>

			<div class="mdl-grid" style="margin-left: 10%;">
				<div class="mdl-cell mdl-cell--4-col">

					<div class="mdl-grid">
						<div class="mdl-cell mdl-cell--6-col">
							<ul class="jul">
								<li id="draggable" class="ui-state-highlight jli"><input
									type="text" style="width: 30px;" type="number" maxlength="3"
									placeholder="000"> <input type="text"
									style="width: 90px;" maxlength="6" placeholder="카테고리명">
									<button
										class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect">
										<i class="material-icons">zoom_in</i>
									</button>

									<button type="button" class="mdl-chip__action"
										onclick="deletecard(this);">
										<i class="material-icons">cancel</i>
									</button></li>
							</ul>
							
							<ul id="sortable" class="jul" style="min-height: 100px;">
							
							<c:forEach var="m" items="${maincate}">
								<li class="ui-state-default jli"><input type="text"
									style="width: 30px;" value="${m.catecode1}"> <input type="text"
									style="width: 90px;" value="${m.catename1}">
									<button
										class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect"
										onclick="categorysubmit(this);">
										<!--ㅎㅎㅎㅎ-->
										<i class="material-icons">zoom_in</i>
									</button>
									<button type="button" onclick="deletecard(this);"
										class="mdl-chip__action">
										<i class="material-icons">cancel</i>
									</button>
								</li>
								</c:forEach>
							</ul>

						</div>
						<div class="mdl-cell mdl-cell--6-col">
							<img src="resources/img/right.png"
								style="width: 100%; margin-top: 25%;">
						</div>
					</div>
				</div>
				<div class="mdl-cell mdl-cell--4-col">
					<div class="mdl-grid">
						<div class="mdl-cell mdl-cell--6-col" id="subcategory">
							선택된 상위 카테고리 : 없음
							<ul id="sortable2" class="jul" style="min-height: 100px;">
							</ul>
						</div>
						<div class="mdl-cell mdl-cell--6-col">
							<img src="resources/img/right.png"
								style="width: 100%; margin-top: 25%;">
						</div>
					</div>
				</div>
				<div class="mdl-cell mdl-cell--4-col">


					<ul id="sortable3" class="jul" style="min-height: 100px;">
							<c:forEach var="m2" items="${maincate}">
								<li class="ui-state-default jli"><input type="text"
									style="width: 30px;" value="${m2.catecode1}"> <input type="text"
									style="width: 90px;" value="${m2.catename1}">
									<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect"
									onclick="imguploadpopup('${m2.catecode1}','${m2.catename1 }');">
										<!--ㅎㅎㅎㅎ-->
										<i class="material-icons">post_add</i>
									</button>
								</li>
								</c:forEach>
					</ul>

				</div>
			</div>


		</div>
		<%-- ${subcate[5]}  --%>
		

		<script>
			
			
			 var datalist = new Array();
			
			/* console.log(datalist); */
			
			
			$(function(){
				
				$.ajax({
					url:"adminsubgory",
					dataType:"json",
					success:function(data){
						datalist=data;
						console.log(datalist);
					},error:function(request, status, errorData){
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText
								+ "error : " + errorData);
					}
				});
				
			});
			
		

			function deletecard(card) {

				//console.log($(card).parent()[0].id); 
				//console.log($(card).parent().children()[0].value);

				console.log($(card).parent().parent());

				if ($(card).parent().parent()[0].id == 'sortable') {
					for (var i = 0; i < datalist.length;) {
						if (datalist[i].upcate == $(card).parent().children()[0].value) {
							console.log(datalist[i]);
							console.log($(card).parent().children()[0].value);
							datalist.splice(i, 1);
							i = i - 1;
						}
						i++;
					}
				}
				if ($(card).parent()[0].id != 'draggable'
						&& $(card).parent()[0].id != 'draggable2') { //입력가능한 노란카드가 아닐경우

					$(card).parent().remove();
					alert($(card).parent().children()[1].value
							+ ' 카테고리가 삭제되었습니다.');
				}
			}

			function categorysubmit(card) { //하위카테고리 submit

				var text = "";
				if ($(card).parent()[0].id != 'draggable') { // 입력가능한 노란카드가 아닐경우

					if (document.getElementById("sortable2").children.length != 0) {//하위카테고리가 비어있지 않을경우

						for (var j = 0; j < datalist.length;) {//데이터리스트의 상위 카테고리코드 삭제
							if (datalist[j].upcate == document.getElementById("sortable2").children[0].children[2].value+"") { //부모의 카테고리 코드와 같으면
								datalist.splice(j, 1);
								j = j - 1;
							}
							j++;
						}

						for (var i = 0; i < document.getElementById("sortable2").children.length; i++) { //li태그안의 갯수만큼 반복

							var catecodetemp = document
									.getElementById("sortable2").children[i].children[0].value+""; // 하위 카테고리 코드
							var catenametemp = document
									.getElementById("sortable2").children[i].children[1].value; // 하위 카테고리 이름
							var maincatecodetemp = document
									.getElementById("sortable2").children[i].children[2].value + ""; //상위 카테고리 코드
							var yellow = document.getElementById("sortable2").children[i].children[3].value;
							var data = {
								upcate : maincatecodetemp,
								catecode2 : catecodetemp,
								catename2 : catenametemp,
								newli : 'n',
								Y_index : i
							};
							datalist.push(data);
						}
					}
					console.log($(card).parent().children()[0].value);
					text = '선택된 상위 카테고리 : '
							+ $(card).parent().children()[1].value
							+ '<ul class="jul">'
							+ '<li id="draggable2" class="ui-state-highlight jli">'
							+ '<input type="text" style="width:30px;" type="number" maxlength="3" placeholder="000">'
							+ '<input type="text" style="width:90px;" maxlength="6" placeholder="카테고리명">'
							+ '<input type="hidden" id="subplusid" value='
							+ $(card).parent().children()[0].value+""
							+ '>'
							+ '<input type="hidden" value="y">'
			
							+ '<button type="button" class="mdl-chip__action" onclick="deletecard(this);"><i class="material-icons">cancel</i></button>'
							+ '</li></ul>';
					text += '<ul id="sortable2" class="jul ui-sortable" style="min-height:100px;">';

					if(datalist[0]!=null){
						
					
					for (var i = 0; i < datalist.length; i++) {
						if (datalist[i].upcate == $(card).parent().children()[0].value) {
							if (datalist[i].newli == 'y') {
								text += '<li id=draggable2 class="ui-state-highlight jli ui-draggable">';
							} else {
								text += '<li class="ui-state-default jli ui-sortable-handle ">';
							}
							text += '<input type="text" style="width:30px;" value="'+datalist[i].catecode2+'">'
									+ '<input type="text" style="width:90px;" value="'+datalist[i].catename2+'">'
									+ '<input type="hidden" value= '+datalist[i].upcate+'>'
									+ '<input type="hidden" value= '+datalist[i].newli+'>'

									+ '<button type="button" onclick="deletecard(this);" class="mdl-chip__action"><i class="material-icons">cancel</i></button>';
							+'</li>';

						}
					}
					}
					text += '</ul>';
				}
				document.getElementById("subcategory").innerHTML = text;

				$(function() {
					$("#sortable2").sortable({
						revert : true
					});
					$("#draggable2").draggable({
						connectToSortable : "#sortable2",
						helper : "clone",
						revert : "invalid"
					});
					$(".jul, .jli").disableSelection();
				});

			}
			function productsubmit(card) {
				if ($(card).parent()[0].className == 'ui-state-highlight jli ui-draggable ui-draggable-handle') {

				} else {
					document.getElementById("sortable3").innerHTML = '<li class="ui-state-default jli">'
							+ $(card).parent().children()[1].value
							+ '재료 1</li>'
							+ '<li class="ui-state-default jli">'
							+ $(card).parent().children()[1].value
							+ '재료 2</li>'
							+ '<li class="ui-state-default jli">'
							+ $(card).parent().children()[1].value
							+ '재료 3</li>'
							+ '<li class="ui-state-default jli">'
							+ $(card).parent().children()[1].value
							+ '재료 4</li>'
							+ '<li class="ui-state-default jli">'
							+ $(card).parent().children()[1].value
							+ '재료 5</li>';
				}
			}
		</script>
		<div>
			<button
				class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
				onclick="milibogi();">
				미리보기</button>
			<button
				class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
				onclick="upload();">적용하기</button>
		</div>
		
</body>

<form id="upfrm" action="cateupload.do">
	<input type="text" id="maincatecode" name="maincatecode"> 
	<input type="hidden" id="maincatename" name="maincatename"> 
	<input type="hidden" id="maincateY-index" name="maincateY-index">
	<input type="hidden" id="subcatecode" name="subcatecode"> 
	<input type="hidden" id="subcatename" name="subcatename"> 
	<input type="hidden" id="subcateY-index" name="subcateY-index">
	<input type="hidden" id="parentmaincode" name="parentmaincode">
</form>

<script>
function upload(){
	document.getElementById("maincatecode").value="";
	document.getElementById("maincatename").value="";
	document.getElementById("subcatecode").value="";
	document.getElementById("subcatename").value="";
	document.getElementById("parentmaincode").value="";
	document.getElementById("maincateY-index").value="";
	document.getElementById("subcateY-index").value="";
	
	
	for(var i = 0;i < $("#sortable").children().length;i++){//페이지 왼쪽에 있는 메인카테고리 데이터 갯수만큼 반복
			
			document.getElementById("maincatecode").value += $("#sortable").children().eq(i)[0].children[0].value;
			document.getElementById("maincatename").value += $("#sortable").children().eq(i)[0].children[1].value;
			document.getElementById("maincateY-index").value+= i;
			
		if( !(i==$("#sortable").children().length-1)){
			document.getElementById("maincatecode").value += ",";
			document.getElementById("maincatename").value += ",";
			document.getElementById("maincateY-index").value += ",";		
		}
	}
	//datalist에 추가
	if(document.getElementById("sortable2").children.length!=0){//하위카테고리가 비어있지 않을경우
	
		if(datalist[0]!=null){
			
		
        for(var j=0;j<datalist.length;){//데이터리스트의 상위 카테고리코드 삭제
            if(datalist[j].upcate==document.getElementById("sortable2").children[0].children[2].value){ //뭐지
                datalist.splice(j,1);
                j=j-1;
            }
            j++;
        }
	}

    for(var i=0;i<document.getElementById("sortable2").children.length;i++){ //li태그안의 갯수만큼 반복

        var catecodetemp = document.getElementById("sortable2").children[i].children[0].value+""; // 하위 카테고리 코드
        var catenametemp = document.getElementById("sortable2").children[i].children[1].value; // 하위 카테고리 이름
        var maincatecodetemp = document.getElementById("sortable2").children[i].children[2].value+""; //상위 카테고리 코드
        var yellow = document.getElementById("sortable2").children[i].children[3].value;
        
        
        var data = {
                upcate:maincatecodetemp,
                catecode2:catecodetemp,
                catename2:catenametemp,
                newli: yellow, 
                Y_index: i
            };

        datalist.push(data);
        }
    }
	
		for(var i = 0;i < datalist.length;i++){//datalist 길이만큼 반복
		document.getElementById("subcatecode").value += datalist[i].catecode2;
		document.getElementById("subcatename").value += datalist[i].catename2;
		document.getElementById("parentmaincode").value += datalist[i].upcate;
		document.getElementById("subcateY-index").value += datalist[i].Y_index;
		
		if( !(i==datalist.length-1)){
				document.getElementById("subcatecode").value += ",";
				document.getElementById("subcatename").value += ",";
				document.getElementById("parentmaincode").value += ",";
				document.getElementById("subcateY-index").value += ",";
			}
		}
		
		
		var chkdata =  document.getElementById("maincatecode").value.split(',');
		for(var i = 1 ; i < chkdata.length;i++){
			
			for(j = 0; j < i ; j++){
				  tmpA =  chkdata[i];
				  tmpB = chkdata[j];
				  
				  if(tmpA == tmpB){
					  elart("카테고리 코드는 중복값이 존재할 수 없습니다!");
					  return false;
				  }
			}
		}
		/*
		  for(i = 1; i < strForm.elements.length; i++){
	      for(j = 0; j < i ; j++){
	      // 값비교
	         tmpA = strForm.elements[i].value;
	         tmpB = strForm.elements[j].value;

	         if(tmpA == tmpB){
	            alert("동일한 값이 있습니다");
	            return false;
	            break
	         }
	      }
	   }
*/
	document.getElementById("upfrm").submit();
	
}

function milibogi(){
	
	document.getElementById("maincatecode").value="";
	document.getElementById("maincatename").value="";
	document.getElementById("subcatecode").value="";
	document.getElementById("subcatename").value="";
	document.getElementById("parentmaincode").value="";
	document.getElementById("maincateY-index").value="";
	document.getElementById("subcateY-index").value="";
	
	
	for(var i = 0;i < $("#sortable").children().length;i++){//페이지 왼쪽에 있는 메인카테고리 데이터 갯수만큼 반복
			
			document.getElementById("maincatecode").value += $("#sortable").children().eq(i)[0].children[0].value;
			document.getElementById("maincatename").value += $("#sortable").children().eq(i)[0].children[1].value;
			document.getElementById("maincateY-index").value+= i;
			
		if( !(i==$("#sortable").children().length-1)){
			document.getElementById("maincatecode").value += ",";
			document.getElementById("maincatename").value += ",";
			document.getElementById("maincateY-index").value += ",";		
		}
	}
	//datalist에 추가
	if(document.getElementById("sortable2").children.length!=0){//하위카테고리가 비어있지 않을경우
	
		if(datalist[0]!=null){
			
		
        for(var j=0;j<datalist.length;){//데이터리스트의 상위 카테고리코드 삭제
            if(datalist[j].upcate==document.getElementById("sortable2").children[0].children[2].value){ //뭐지
                datalist.splice(j,1);
                j=j-1;
            }
            j++;
        }
	}

    for(var i=0;i<document.getElementById("sortable2").children.length;i++){ //li태그안의 갯수만큼 반복

        var catecodetemp = document.getElementById("sortable2").children[i].children[0].value+""; // 하위 카테고리 코드
        var catenametemp = document.getElementById("sortable2").children[i].children[1].value; // 하위 카테고리 이름
        var maincatecodetemp = document.getElementById("sortable2").children[i].children[2].value+""; //상위 카테고리 코드
        var yellow = document.getElementById("sortable2").children[i].children[3].value;
        
        
        var data = {
                upcate:maincatecodetemp,
                catecode2:catecodetemp,
                catename2:catenametemp,
                newli: yellow, 
                Y_index: i
            };

        datalist.push(data);
        }
    }
	
		for(var i = 0;i < datalist.length;i++){//datalist 길이만큼 반복
		document.getElementById("subcatecode").value += datalist[i].catecode2;
		document.getElementById("subcatename").value += datalist[i].catename2;
		document.getElementById("parentmaincode").value += datalist[i].upcate;
		document.getElementById("subcateY-index").value += datalist[i].Y_index;
		
		if( !(i==datalist.length-1)){
				document.getElementById("subcatecode").value += ",";
				document.getElementById("subcatename").value += ",";
				document.getElementById("parentmaincode").value += ",";
				document.getElementById("subcateY-index").value += ",";
			}
		}
	var temp = document.getElementById("maincatename").value;
	window.open('categorysee?maincatename='+temp,'_blank',
			'width=1500,height=300,top=50,left=150');
}

function imguploadpopup(up,catename){
	window.open('cateimgpopup?upcatecode='+up+'&catename='+catename,
			'_blank','width=500,height=300,top=300,left=300');
}

</script>

</html>
