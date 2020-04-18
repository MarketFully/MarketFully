<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 이미지 슬라이드  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/main.css">
    <title>mainpage</title>
</head>
<body>
    <div class="full">
        <div class="container">
            <!-- header -->
            <%@include file="common/header.jsp" %>
            <!-- end header -->

           <!-- 이미지 슬라이드 -->
           <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="resources/img/main/main_slide3.png" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="resources/img/main/main_slide1.png" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="resources/img/main/main_slide4.png" alt="Third slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="resources/img/main/main_slide2.png" alt="Fourth slide">
              </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="resources/img/main/main_slide5.png" alt="Fifth slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <!-- 이 레시피 어때요 -->
          <div class="HowRecipe">
            <div class="RTitle">
                <p class="RContent">이 레시피 어때요?</p>
            </div>
          </div>
          <div class="row">
		  <c:forEach var="b" items="${ mainrandomlist }">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/recipe13.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">${ b.mb_title }</a></h4>
                        <p class="Rcard-text">"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!"</p>
                    </div>
                    <div class="Rcard-footer">
                        <small class="text-muted">추천수</small>&nbsp;&nbsp;<small class="text-muted">9999</small><br>
                        <small class="text-muted1"><img src="resources/img/heart.png" style="float: right; margin-right: 10px;"></small>
                    </div>
                </div>
            </div>
		  </c:forEach>
          </div>
          <!-- 최근에 본 레시피 -->

          <div class="recentRecipe">
            <div class="RTitle">
                <p class="RContent">최근에 본 레시피</p>
            </div>
          </div>

          <div class="row1">
            <div class="col-lg-3 col-md-6 mb-4" style="margin-right: 10px;">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/recipe4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!"</p>
                    </div>
                    <div class="Rcard-footer">
                        <small class="text-muted">추천수</small>&nbsp;&nbsp;<small class="text-muted">9999</small><br>
                        <small class="text-muted1"><img src="resources/img/heart.png" style="float: right; margin-right: 10px;"></small>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4" style="margin-left: 10px; margin-right: 10px;">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/recipe5.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!"</p>
                    </div>
                    <div class="Rcard-footer">
                        <small class="text-muted">추천수</small>&nbsp;&nbsp;<small class="text-muted">9999</small><br>
                        <small class="text-muted1"><img src="resources/img/heart.png" style="float: right; margin-right: 10px;"></small>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4" style="margin-left: 10px;">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/recipe6.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!"</p>
                    </div>
                    <div class="Rcard-footer">
                        <small class="text-muted">추천수</small>&nbsp;&nbsp;<small class="text-muted">9999</small><br>
                        <small class="text-muted1"><img src="resources/img/heart.png" style="float: right; margin-right: 10px;"></small>
                    </div>
                </div>
            </div>
        </div>

        <!-- 단품으로 인기있는 상품 -->
        <div class="SingleProduct">
            <div class="RTitle">
                <p class="RContent">인기있는 단품 상품</p>
            </div>
          </div>

          <div class="row">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">10000원</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product1.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">9500원</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product2.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">20000원</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/product4.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">15000원</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 최근 뜨고 있는 레시피-->
        <div class="RecentBest">
            <div class="RTitle">
                <p class="RContent">최근 뜨는 레시피</p>
            </div>
          </div>

          <div class="row">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/recipe10.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!"</p>
                    </div>
                    <div class="Rcard-footer">
                        <small class="text-muted">추천수</small>&nbsp;&nbsp;<small class="text-muted">9999</small><br>
                        <small class="text-muted1"><img src="resources/img/heart.png" style="float: right; margin-right: 10px;"></small>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/recipe11.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!"</p>
                    </div>
                    <div class="Rcard-footer">
                        <small class="text-muted">추천수</small>&nbsp;&nbsp;<small class="text-muted">9999</small><br>
                        <small class="text-muted1"><img src="resources/img/heart.png" style="float: right; margin-right: 10px;"></small>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/recipe12.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!"</p>
                    </div>
                    <div class="Rcard-footer">
                        <small class="text-muted">추천수</small>&nbsp;&nbsp;<small class="text-muted">9999</small><br>
                        <small class="text-muted1"><img src="resources/img/heart.png" style="float: right; margin-right: 10px;"></small>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4">
                <div class="Rcard h-500 w-100">
                    <a href="#"><img src="resources/img/recipe14.png" class="Rcard-img-top"></a>
                
                    <div class="Rcard-body">
                        <h4 class="Rcard-title"><a href="#" style="text-decoration: none;">백종원의 찹스테이크 레시피</a></h4>
                        <p class="Rcard-text">"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!"</p>
                    </div>
                    <div class="Rcard-footer">
                        <small class="text-muted">추천수</small>&nbsp;&nbsp;<small class="text-muted">9999</small><br>
                        <small class="text-muted1"><img src="resources/img/heart.png" style="float: right; margin-right: 10px;"></small>
                    </div>
                </div>
            </div>
        </div>

        </div>
    </div>

    <footer><!--class="py-5 bg-dark"-->
        <!-- <img src="resources/img/footer_test.jpg" style="margin-top: 150px;"> -->
        <div style="display: inline-flex; margin-top: 200px;height: 200px;">
            <div class="footer_cc">
                <h4>고객센터</h4>
                <div class="foot_call">
                    <h3>
                        <span class="tel">1544-9970</span>
                    </h3>
                    <dl class="list">
                        <dt>365고객센터</dt>
                        <dd>오전 8시~오후 6시</dd>
                    </dl>
                </div>
            </div>
            <div class="footer_info">
                <p class="f_if">법인명(상호) : 주식회사 마켓풀리</p>
                <p class="f_if">사용자 등록 번호 : 111-11-11111</p>
                <p class="f_if">주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</p>
                <p class="f_if">팩스 : 000-0000-0000</p>
                <p class="f_if">이메일 : marcketfully@marcket.com</p>
            </div>
        </div>
        <img src="resources/img/footer1.jpg">
        <div class="footContainer">
            <p class=""></p>
        </div>
    </footer>

    <script> $('.carousel').carousel({ interval: 2000}) 
    
    document.getElementsByClassName("cate_hr")[0].remove();
    </script>


</body>
</html>