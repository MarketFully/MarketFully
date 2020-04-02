<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <h3>사용자 관리</h3>
    <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
        <thead>
          <tr>
            <th class="mdl-data-table__cell--non-numeric">사용자 Id</th>
            <th>이름</th>
            <th>닉네임</th>
            <th>가입일</th>
            <th>적립금</th>
            <th>작성 레시피 수</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">최미경</td>
            <td>abc123</td>
            <td>미경센세</td>
            <td>2020-03-22</td>
            <td>$2.90</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">신지영</td>
            <td>abc123</td>
            <td>H반 일진</td>
            <td>2020-03-22</td>
            <td>$1.25</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">정창원</td>
            <td>abc123</td>
            <td>수퍼맨</td>
            <td>2020-03-22</td>
            <td>$2.35</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">최미경</td>
            <td>abc123</td>
            <td>미경센세</td>
            <td>2020-03-22</td>
            <td>$2.90</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">신지영</td>
            <td>abc123</td>
            <td>H반 일진</td>
            <td>2020-03-22</td>
            <td>$1.25</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">정창원</td>
            <td>abc123</td>
            <td>수퍼맨</td>
            <td>2020-03-22</td>
            <td>$2.35</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">최미경</td>
            <td>abc123</td>
            <td>미경센세</td>
            <td>2020-03-22</td>
            <td>$2.90</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">신지영</td>
            <td>abc123</td>
            <td>H반 일진</td>
            <td>2020-03-22</td>
            <td>$1.25</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">정창원</td>
            <td>abc123</td>
            <td>수퍼맨</td>
            <td>2020-03-22</td>
            <td>$2.35</td>
            <td>3</td>
          </tr>
          <tr>
            <td class="mdl-data-table__cell--non-numeric">정창원</td>
            <td>abc123</td>
            <td>수퍼맨</td>
            <td>2020-03-22</td>
            <td>$2.35</td>
            <td>3</td>
          </tr>
          
        </tbody>
      </table>
      <center>

          <a href="#" class="btn btn-success">&lt;</a>
          <a href="#" class="btn btn-success">1</a>
      <a href="#" class="btn btn-success">2</a>
      <a href="#" class="btn btn-success">3</a>
      <a href="#" class="btn btn-success">4</a>
      <a href="#" class="btn btn-success">5</a>
      <a href="#" class="btn btn-success">6</a>
      <a href="#" class="btn btn-success">7</a>
      <a href="#" class="btn btn-success">8</a>
      <a href="#" class="btn btn-success">9</a>
      <a href="#" class="btn btn-success">&gt;</a>
    </center>
      
      
      
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

</body>



</html>
