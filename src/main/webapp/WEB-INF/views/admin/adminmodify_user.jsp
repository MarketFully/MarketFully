<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
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
<link rel="stylesheet" href="css/main.css">
  <title>Shop Item - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
  .dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
  }
  
  /* The container <div> - needed to position the dropdown content */
  .dropdown {
    position: relative;
    display: inline-block;
  }
  
  /* Dropdown Content (Hidden by Default) */
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
  }
  
  /* Links inside the dropdown */
  .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
  }
  
  /* Change color of dropdown links on hover */
  .dropdown-content a:hover {background-color: #f1f1f1}
  
  /* Show the dropdown menu on hover */
  .dropdown:hover .dropdown-content {
    display: block;
  }
  
  /* Change the background color of the dropdown button when the dropdown content is shown */
  .dropdown:hover .dropbtn {
    background-color: #3e8e41;
  }

 
  </style>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
  <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</head>

<body>
   <!-- header -->
   <%@include file="../common/adminheader.jsp" %> 

  <!-- Page Content -->
  <div class="container">
      <h3>회원 관리</h3>
    <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
        <thead>
          <tr>
            <th class="mdl-data-table__cell--non-numeric">회원 번호</th>
            <th>회원 ID</th>
            <th>회원 이름</th>
            <th>회원 이메일</th>
            <th>적립금</th>
            <th>사용여부</th>
            <th>관리 </th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="m" items="${list }">
          <tr>
            <td class="mdl-data-table__cell--non-numeric">${m.mem_num }</td>
            <td>${m.mem_id }</td>
            <td>${m.mem_name }</td>
            <td>${m.mem_email }</td>
            <td>${m.mem_point }</td>
            <td>${m.mem_status }</td>
            <td> <button onclick="modify(${m.mem_num});"> 수정하기 </button></td>
          </tr>
        </c:forEach>
          
          
        </tbody>
      </table>
      <br><br>
      
      
      <br><br>
<c:if test="${ pi.currentPage eq 1 }">
					<img src="resources/img/arrow_left.png" style="width:25px;height:25px;vertical-align: middle;">
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url var="before" value="adminmodify_user">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href='${ before }'><img src="resources/img/arrow_left.png" style="width:25px;height:25px;vertical-align: middle;"></a> 
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="#2e8b57" size="4"><b>${ p }</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="adminmodify_user">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href='${ pagination }'>
						 <font color="#2e8b57" size="4"><b>
						 ${ p }
						 </b></font>
						 </a>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					<img src="resources/img/arrow_right.png" style="width:25px;height:25px;vertical-align: middle;">
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url var="after" value="adminmodify_user">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${after }"><img src="resources/img/arrow_right.png" style="width:25px;height:25px;vertical-align: middle;"></a>
				</c:if>
      
      <br><br>
      
      
                  <div>
                <fieldset>
                <form action="memsearch">
                
                    <select style="height: 31px;  border: 1px solid #dcdcdc; border-radius: 5px; margin-right: 20px; font-family: MapoPeacefull;" name="msearchType">
                        <option value="mid">아이디</option>
                        <option value="mname">이름</option>
                    </select>
                    <input type="text" class="sbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요" name="mkeyword">
                    <button type="submit" class="btn_srch" id="searchbtn">검색</button>
                </form>
                </fieldset>
                </div>
      <!-- /.container -->
  </div>
  </div>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<input type="hidden" id="modifynum">
</body>

<script>
function modify(mem_num){
	document.getElementById("modifynum").value = mem_num;
	window.open("usermodifypop?mem_num="+mem_num , "", "top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no","");
}
</script>


</html>
