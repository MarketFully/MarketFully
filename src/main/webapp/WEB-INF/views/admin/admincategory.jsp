<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 이미지 슬라이드  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <title>Charts - SB Admin</title>
    <link href="resources/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/main.css">
    <title>mainpage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery UI Draggable + Sortable</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="resources/demos/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
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
    background: rgba(158,158,158,.2);
    box-shadow: 0 1px 1.5px 0 rgba(0,0,0,.12), 0 1px 1px 0 rgba(0,0,0,.24);
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
           <%@include file="../common/adminheader.jsp" %>
            <!--헤더 끝-->
            <hr>

            <div class="mdl-grid" style="
            margin-left: 10%;">
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="mdl-grid">

                    <div class="mdl-cell mdl-cell--6-col">
                    <ul class="jul">
                        <li id="draggable" class="ui-state-highlight jli">
                            <input type="text" style="width:30px;" type="number" maxlength="3" placeholder="000">
                            <input type="text" style="width:90px;" maxlength="6" placeholder="카테고리명">
                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect">
                                <i class="material-icons">add</i>
                              </button>

                            <button type="button" class="mdl-chip__action" onclick="deletecard(this);"><i class="material-icons">cancel</i></button>
                        </li>
                    </ul>

                    <ul id="sortable" class="jul">
                        <li class="ui-state-default jli">
                            <input type="text" style="width:30px;" value="001">
                            <input type="text" style="width:90px;" value="한식">
                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect" 
                            
                        onclick="categorysubmit(this);"> <!--ㅎㅎㅎㅎ-->

                                <i class="material-icons">add</i>
                              </button>
                            <button type="button" onclick="deletecard(this);" class="mdl-chip__action"><i class="material-icons">cancel</i></button>
                        </li>
                        <li class="ui-state-default jli">
                            <input type="text" style="width:30px;" value="002">
                            <input type="text" style="width:90px;" value="중식">
                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect" 
                            onclick="categorysubmit(this);">
                                <i class="material-icons">add</i>
                              </button>
                            <button type="button" onclick="deletecard(this);" class="mdl-chip__action"><i class="material-icons">cancel</i></button>
                        </li>
                        <li class="ui-state-default jli">
                            <input type="text" style="width:30px;" value="003">
                            <input type="text" style="width:90px;" value="양식">
                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect"
                            onclick="categorysubmit(this);">
                                <i class="material-icons">add</i>
                              </button>
                       
                              <button type="button" class="mdl-chip__action" onclick="deletecard(this);" ><i class="material-icons">cancel</i></button>

                        </li>
                        <li class="ui-state-default jli">
                            <input type="text" style="width:30px;" value="004">
                            <input type="text" style="width:90px;" value="일식">
                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect"
                            onclick="categorysubmit(this);">
                                <i class="material-icons">add</i>
                              </button>
                            <button type="button" class="mdl-chip__action" onclick="deletecard(this);"><i class="material-icons">cancel</i></button>
                        </li>
                        <li class="ui-state-default jli">
                            <input type="text" style="width:30px;" value="005">
                            <input type="text" style="width:90px;" value="음식">
                            <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect"
                            onclick="categorysubmit(this);">
                                <i class="material-icons">add</i>
                              </button>
                            <button type="button" class="mdl-chip__action" onclick="deletecard(this);"><i class="material-icons">cancel</i></button>
                        </li>
                    </ul>

                    </div>
                    <div class="mdl-cell mdl-cell--6-col">
                     <img src="resources/img/right.png" style="width: 100%; margin-top: 25%;">
                    </ul>
                    </div>
                    </div>
                </div>
                <div class="mdl-cell mdl-cell--4-col">
                    <div class="mdl-grid">
                        <div class="mdl-cell mdl-cell--6-col" id="subcategory">
                                선택된 상위 카테고리 : 없음
                        <ul id="sortable2" class="jul">
                        </ul>
                    </div>
                    <div class="mdl-cell mdl-cell--6-col">
                        <img src="resources/img/right.png" style="width: 100%; margin-top: 25%;">
                    </div>
                    </div>
                    </div>
                <div class="mdl-cell mdl-cell--4-col">
                  

                    <ul id="sortable3" class="jul">

                    </ul>

                </div>
            </div>


        </div>

        <script>

            var datalist = new Array();

             //임시 데이터 생성
                var data = {
                    cateCode:'001',
                    subcateCode:'001',
                    cateName:'파전',
                    newli: 'n'
                }
                datalist.push(data);
                var data = {
                    cateCode:'001',
                    subcateCode:'002',
                    cateName:'볶음밥',
                    newli: 'n'
                }
                datalist.push(data);
                var data = {
                    cateCode:'001',
                    subcateCode:'003',
                    cateName:'전골',
                    newli: 'n'
                }
                datalist.push(data);
                var data = {
                    cateCode:'001',
                    subcateCode:'004',
                    cateName:'찌개',
                    newli: 'n'
                }
                datalist.push(data);
                var data = {
                    cateCode:'001',
                    subcateCode:'005',
                    cateName:'국밥',
                    newli: 'n'
                }
                datalist.push(data);
            
            for(var i=0;i<3;i++){ //임시 데이터 생성
                var data = {
                    cateCode:'002',
                    subcateCode:'00'+i,
                    cateName:'중식'+i,
                    newli: 'n'
                };
                datalist.push(data);
            }for(var i=0;i<2;i++){ //임시 데이터 생성
                var data = {
                    cateCode:'003',
                    subcateCode:'00'+i,
                    cateName:'양식'+i,
                    newli: 'n'
                };
                datalist.push(data);
            }for(var i=0;i<4;i++){ //임시 데이터 생성
                var data = {
                    cateCode:'004',
                    subcateCode:'00'+i,
                    cateName:'일식'+i,
                    newli: 'n'
                };
                datalist.push(data);
            }for(var i=0;i<3;i++){ //임시 데이터 생성
                var data = {
                    cateCode:'005',
                    subcateCode:'00'+i,
                    cateName:'음식'+i,
                    newli: 'n'
                };
                datalist.push(data);
            }


function deletecard(card){

//console.log($(card).parent()[0].id); 
//console.log($(card).parent().children()[0].value);
if($(card).parent()[0].id != 'draggable' && $(card).parent()[0].id != 'draggable2'){ //입력가능한 노란카드가 아닐경우

$(card).parent().remove();
alert($(card).parent().children()[1].value+' 카테고리가 삭제되었습니다.');
}
 }

 function categorysubmit(card){ //하위카테고리 입력

var text = "";
    if($(card).parent()[0].id != 'draggable'){ // 입력가능한 노란카드가 아닐경우

        if(document.getElementById("sortable2").children.length!=0){//하위카테고리가 비어있지 않을경우

            for(var j=0;j<datalist.length;){//데이터리스트의 상위 카테고리코드 삭제
                if(datalist[j].cateCode==document.getElementById("sortable2").children[0].children[2].value){ //뭐지
                    datalist.splice(j,1);
                    j=j-1;
                }
                j++;
            }

        for(var i=0;i<document.getElementById("sortable2").children.length;i++){ //li태그안의 갯수만큼 반복

            var catecodetemp = document.getElementById("sortable2").children[i].children[0].value; // 하위 카테고리 코드
            var catenametemp = document.getElementById("sortable2").children[i].children[1].value; // 하위 카테고리 이름
            var maincatecodetemp = document.getElementById("sortable2").children[i].children[2].value; //상위 카테고리 코드
            var yellow = document.getElementById("sortable2").children[i].children[3].value;
            var data = {
                    cateCode:maincatecodetemp,
                    subcateCode:catecodetemp,
                    cateName:catenametemp,
                    newli: yellow
                };
                

            datalist.push(data);
            }
        }

    text    = '선택된 상위 카테고리 : ' + $(card).parent().children()[1].value
            + '<ul class="jul">'
            + '<li id="draggable2" class="ui-state-highlight jli">'
            + '<input type="text" style="width:30px;" type="number" maxlength="3" placeholder="000">'
            + '<input type="text" style="width:90px;" maxlength="6" placeholder="카테고리명">'
            + '<input type="hidden" id="subplusid">'
            + '<input type="hidden" value="y">'
            + '<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect" onclick="productsubmit(this)">'
            + '<i class="material-icons">add</i>'
            + '</button>'
            + '<button type="button" class="mdl-chip__action" onclick="deletecard(this);"><i class="material-icons">cancel</i></button>'
            + '</li></ul>';
    text += '<ul id="sortable2" class="jul ui-sortable">';

var tempcode=0;
     for(var i=0;i<datalist.length;i++){
            if(datalist[i].cateCode == $(card).parent().children()[0].value){
                if(datalist[i].newli=='y'){
                    text+='<li id=draggable2 class="ui-state-highlight jli ui-draggable">';
                }else{ 
                text+=  '<li class="ui-state-default jli ui-sortable-handle ">';
                }
                   text += '<input type="text" style="width:30px;" value="'+datalist[i].subcateCode+'">'
                    + '<input type="text" style="width:90px;" value="'+datalist[i].cateName+'">'
                    + '<input type="hidden" value= '+datalist[i].cateCode+'>'
                    + '<input type="hidden" value= '+datalist[i].newli+'>'
                    + '<button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect"' 
                    + 'onclick="productsubmit(this);">'
                    + '<i class="material-icons">add</i>'
                    + '</button>'
                    + '<button type="button" onclick="deletecard(this);" class="mdl-chip__action"><i class="material-icons">cancel</i></button>';
                    + '</li>';
                    tempcode=datalist[i].cateCode;
                
            }
        }
        text +='</ul>';
     }
     document.getElementById("subcategory").innerHTML = text;
        document.getElementById("subplusid").value=tempcode;

     $(function () {
            $("#sortable2").sortable({
                revert: true
            });
            $("#draggable2").draggable({
                connectToSortable: "#sortable2",
                helper: "clone",
                revert: "invalid"
            });
            $(".jul, .jli").disableSelection();
        });

 }
 function productsubmit(card){
    if($(card).parent()[0].className=='ui-state-highlight jli ui-draggable ui-draggable-handle')
    {

    }else{
    document.getElementById("sortable3").innerHTML='<li class="ui-state-default jli">'+$(card).parent().children()[1].value+'재료 1</li>'
                        +'<li class="ui-state-default jli">'+$(card).parent().children()[1].value+'재료 2</li>'
                        +'<li class="ui-state-default jli">'+$(card).parent().children()[1].value+'재료 3</li>'
                        +'<li class="ui-state-default jli">'+$(card).parent().children()[1].value+'재료 4</li>'
                        +'<li class="ui-state-default jli">'+$(card).parent().children()[1].value+'재료 5</li>';
    }
 }

        </script>
        <div>
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="window.open('categorysee','_blank','width=1500,height=300,top=50,left=150')">
               미리보기
              </button>
              <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                적용하기
              </button>
        </div>
</body>

</html>
