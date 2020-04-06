<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/jquery.treeview.css" />
<link rel="stylesheet" href="resources/css/screen.css" />
<script src="resources/js/jquery.js" type="text/javascript"></script>
<script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
<script src="resources/js/jquery.treeview.js" type="text/javascript"></script>
<style>
        .container> ul, li {
            list-style: none;
        }

        .write_btn {
            width: 100px;
            text-align: center;
            height: 35px;
            font-size: 14px;
            line-height: 35px;
            vertical-align: middle;
            background: #2e8b57;
            color: #fff !important;
            text-decoration: none;
            border: none;
            font-family: MapoPeacefull;
            margin-top: 30px;
            float: right;
            margin-bottom: 200px;
        }
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <ul>
            <input type="text" placeholder="Search" id="searchbox"
                style="width: 220px; border: 2px solid #dedede; border-radius: 5px;height: 30px;">
        </ul>
        <ul>
            <ul id="tree">
                <!-- 한식 -->
                <li>
                    <input id="president" type="checkbox" class="check_fold" /><label for="president"
                        class="check_label">한식</label>
                    <ul id="checklist">
                        <li>
                            <input id="manager1" type="checkbox" /><label for="manager1">불고기</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">소고기</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">진간장</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">대파</label></li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager2" type="checkbox" /><label for="manager2">제육볶음</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">돼지고기</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">고추장</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">양파</label></li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager3" type="checkbox" /><label for="manager3">떡볶이</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">떡</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">고추장</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">고춧가루</label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <!-- 한식 end -->
                <!-- 양식 -->
                <li>
                    <input id="vicepresident" type="checkbox" class="check_fold" /><label for="vicepresident"
                        class="check_label">양식</label>
                    <ul id="checklist">
                        <li>
                            <input id="manager4" type="checkbox" /><label for="manager4">스테이크</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">소고기</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">소금</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">후추</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager5" type="checkbox" /><label for="manager5">피자</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">밀가루</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">꿀</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">치즈</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager6" type="checkbox" /><label for="manager6">돈까스</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">돼지고기</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">튀김가루</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">밀가루</label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <!-- 양식 end -->
                <!-- 중식 -->
                <li>
                    <input id="vicepresident" type="checkbox" class="check_fold" /><label for="vicepresident"
                        class="check_label">중식</label>
                    <ul id="checklist">
                        <li id="tree">
                            <input id="manager4" type="checkbox" /><label for="manager4">짜장면</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">면</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">춘장</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">양파</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager5" type="checkbox" /><label for="manager5">탕수육</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">밀가루</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">꿀</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">치즈</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager6" type="checkbox" /><label for="manager6">마파두부</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">돼지고기</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">튀김가루</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">밀가루</label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <!-- 중식 end -->
                <!-- 일식 -->
                <li>
                    <input id="vicepresident" type="checkbox" class="check_fold" /><label for="vicepresident"
                        class="check_label">일식</label>
                    <ul id="checklist">
                        <li id="tree">
                            <input id="manager4" type="checkbox" /><label for="manager4">우동</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">소고기</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">소금</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">후추</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager5" type="checkbox" /><label for="manager5">소바</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">밀가루</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">꿀</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">치즈</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager6" type="checkbox" /><label for="manager6">스시</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">돼지고기</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">튀김가루</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">밀가루</label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <!-- 일식 end -->
                <!-- 기타 -->
                <li>
                    <input id="vicepresident" type="checkbox" class="check_fold" /><label for="vicepresident"
                        class="check_label">기타</label>
                    <ul id="checklist">
                        <li id="tree">
                            <input id="manager4" type="checkbox" /><label for="manager4">쌀국수</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">소고기</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">소금</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">후추</label>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <input id="manager5" type="checkbox" /><label for="manager5">월남쌈</label>
                            <ul>
                                <li>
                                    <input id="assistantmanager1" type="checkbox" />
                                    <label for="assistantmanager1">밀가루</label>
                                </li>
                                <li>
                                    <input id="assistantmanager2" type="checkbox" />
                                    <label for="assistantmanager2">꿀</label>
                                </li>
                                <li><input id="assistantmanager3" type="checkbox" />
                                    <label for="assistantmanager3">치즈</label>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <!-- 기타 end-->
            </ul>
        </ul>

        <div style="margin-right: 250px;"> 
            <input type="submit" value="저장" class="write_btn" onclick="location.href=''">
        </div>
    </div>

    <script>

        // 카테고리 접었다 펴기
        $(function () {
            $("#tree").treeview({
                collapsed: true,
                animated: "medium",
                control: "#sidetreecontrol",
                persist: "location"
            });
        })
        new Array()


        // 검색기능
        $(document).ready(function () {
            $("#searchbox").keyup(function () {
                var k = $(this).val();
                $("#checklist > li > ul").hide();
                $("#checklist > li > ul > li").hide();

                var title = $("#checklist > li > ul > li");
                $(title[i]).parent().parent().parent().hide();



                for (var i = 0; i < title.length; i++) { //전체갯수만큼 반복


                    var st = title[i].children[1].innerHTML; //최하위 재료이름
                    $(title[i]).parent().show();//재료
                    $(title[i]).parent().parent().show(); //하위 카테고리
                    $(title[i]).parent().parent().parent().show(); //상위 카테고리


                    if (st.indexOf(k) != -1) { // -1 이 겹치는것이 하나도 없다는 뜻 => 검색될경우
                        $(title[i]).show();
                        $(title[i]).parent().parent().show();
                    }

                }
            })
        });



    </script>
</body>
</html>