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
      <h3>배송 관리</h3>
    <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
        <thead>
          <tr>
            <th class="mdl-data-table__cell--non-numeric">주문번호</th>
            <th>받는 사람</th>
            <th>휴대폰 번호</th>
            <th>운송장번호</th>
            <th>배송상태</th>
          </tr>
        </thead>
        <c:forEach var="sp" items="${ splist }">
                    <tbody class="item">
                        <tr>
                            <form action="updateShippingCode" id="insertfrm" method="POST">
                        	<td class="mdl-data-table__cell--non-numeric" >
                            <input type="hidden" name="or_num33" value="${sp.or_num }">
                        		${sp.or_num }
                        	</td> 
                            <td>${ sp.receiver_name}</td>
                            <td>${ sp.receiver_phone }</td>
                            <td><input required name="shipping_code" type="text" placeholder="운송장 번호 입력" value="${ sp.shipping_code}"></td>
                            <td>
                            	<select required name="shipping_status">
                            		<option value="" selected disabled hidden>선택 해주세요</option>
                            		<option value="배송준비중">배송준비중</option>
                            		<option value="배송중">배송중</option>
                            		<option value="배송완료">배송완료</option>
                            		<option value="배송취소">배송취소</option>
                            	</select>
                            </td>
                            <td><input type="submit" value="등록"></td>
                            </form>
                        </tr>
                    </tbody>
                    </c:forEach>
          
          
       
      </table>
      <br><br>
      
      
      <br><br>

          
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
