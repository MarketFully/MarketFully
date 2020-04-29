<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basket</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/myPage.css">
<link rel="stylesheet" href="resources/css/loverecipe.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<style>
.pagination {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
	margin-top: 100px;
}

.firstpage_img, .prevpage_img {
	display: inline-block;
	width: 30px;
	height: 30px;
	text-align: center;
	vertical-align: middle;
	float: left;
}

.pagenum_currentpage {
	border-radius: 3px;
	background: #2e8b57;
	color: #fff;
	display: inline-block;
	width: 25px;
	height: 25px;
	line-height: 25px;
	text-align: center;
	vertical-align: middle;
	margin: 0px 5px 0px 5px;
}

.pagenum {
	display: inline-block;
	width: 25px;
	height: 25px;
	line-height: 25px;
	text-align: center;
	vertical-align: middle;
	margin: 0px 5px 0px 5px;
}
</style>
<body>
	<!-- 헤더부분-->
	<%@include file="../common/mypageheader.jsp"%>
	<!--마이페이지 왼쪽 부분-->
	<div class="page_aticle aticle_type2">
		<div id="snb" class="snb_my">
			<h2 class="tit_snb">마이컬리</h2>
			<div class="inner_snb">
				<ul class="list_menu_left">
					<li><a href="myorderlist.bo?mem_num=${loginUser.mem_num}">주문
							내역</a></li>
					<li><a href="mypagereview">상품후기</a></li>
					<li class="on"><a
						href="mypageloverecipe.bo?mem_num=${loginUser.mem_num}">찜한 레시피</a>
					</li>
					<li><a href="mypagechange">개인 정보 수정</a></li>
				</ul>
			</div>
		</div>

		<!--찜한 레시피 내용부분-->
		<div class="page_section section_myinfo">
			<form id="recipeForm">
				<div class="head_aticle">
					<h2 class="tit">
						찜한 레시피
						<c:if test="${ pi.listCount > 0}">
							<button type="button" class="btn_alldelete" id="all_delete"
								style="margin-top: 6px; border-radius: 5px; background: #fff; border: 1px solid gray; width: 80px; height: 32px; font-weight: bold; font-size: 10px; font-family: MapoPeacefull; float: right;">전체삭제</button>
						</c:if>
					</h2>

				</div>
				

				<div id="main">
					<div id="content">
						<div class="user_form section_cart" id="allcheck"
							style="width: 820px;">
							<table class="tbl_comm tbl_header"
								style="font-family: MapoPeacefull;">
								<thead>
									<tr>
										<th style="width: 100px;"></th>
										<th style="width: 300px; text-align: center;">제목</th>
										<th style="width: 200px; text-align: center;">레시피</th>
										<th style="width: 100px; text-align: center;">관리</th>
									</tr>
								</thead>
							</table>
						
							<div id="viewGoods" style="font-family: MapoPeacefull;">								
								<div>
									<div class="view_goods">
									<c:if test="${ pi.listCount == 0}">
									<div style="border-bottom: 1px solid #dddfe1;padding: 50px 0;font-size: 13px;color: #757575;text-align: center;">
										찜한 레시피가 없습니다.
									</div>
									</c:if>
										<c:forEach var="re" items="${ flist }">
											<table class="tbl_goods goods" id="tdl" id="l_table">
												<c:if test='${re.me_num eq 1 && re.getTboard().mb_status.equals("Y")}'>
													<tbody>

														<tr class="tr_food">
  															<c:url var="bdetail" value="RecipeDetail">
																<c:param name="bId" value="${ re.getTboard().mb_num }"/>
																<c:param name="currentPage" value="${ pi.currentPage }"/>
																<c:param name="TvOrUser" value="tv"/>
															</c:url>
															<td class="goods_thumb" style="width: 100px;"><a
																href="${ bdetail }"
																class="thumb">    
																<img src="resources/img/tvRecipe/${re.getTboard().mb_rename }"
											                            onerror="this.src='resources/img/errorimg.PNG' " 
											                            alt="상품 이미지" style="width: 85px; height: 85px; padding-left: 25px;"></a>
															</td>
															
															
															<td class="goods_info"
																style="width: 300px; text-align: center;">
																<label
																class="name"
																style="vertical-align: middle; font-weight: normal;"><a href="${ bdetail }">${re.getTboard().mb_title}</a> </label>
															</td>
															<td class="goods_info"
																style="width: 200px; text-align: center; font-size: 14px;">
																<label>TV 속 레시피</label>
																<p class="txt txt_limit"></p>
															</td>
															<td class="goods_info"
																style="width: 100px; text-align: center;">
																<button type="button" class="btn_delete" id="sel_delete"
																	style="margin-top: 6px; border-radius: 5px; background: #fff; 
																	border: 1px solid gray; width: 70px; height: 28px; font-weight: bold;font-size: 10px; font-family: MapoPeacefull;"
																	 onclick="test3(${re.mb_bo_num },${re.me_num });">삭제</button>
															</td>

														</tr>
												</c:if>
												<c:if test='${re.me_num eq 2 && re.getUboard().mb_status.equals("Y")}'>
													<tbody>

														<tr class="tr_food">
														
															<c:url var="bdetail" value="RecipeDetail">
																<c:param name="bId" value="${ re.getUboard().mb_num }"/>
																<c:param name="currentPage" value="${ pi.currentPage }"/>
																<c:param name="TvOrUser" value="user"/>
															</c:url>
															<td class="goods_thumb" style="width: 100px;"><a
																href="${ bdetail }"
																class="thumb"> <img src="resources/img/userRecipe/${re.getUboard().mb_rename }"
											                            onerror="this.src='resources/img/errorimg.PNG' " 
											                            alt="상품 이미지" style="width: 85px; height: 85px; padding-left: 25px;"></a>
															</td>		
															<td class="goods_info"
																style="width: 300px; text-align: center;"><label
																class="name"
																style="vertical-align: middle; font-weight: normal;"><a href="${ bdetail }">${re.getUboard().mb_title}</a></label>
															</td>		
															<td class="goods_info"
																style="width: 200px; text-align: center; font-size: 14px;">
																<label>사용자 레시피</label>
																<p class="txt txt_limit"></p>
															</td>
															<td class="goods_info"
																style="width: 100px; text-align: center;">
																<button type="button" class="btn_delete" id="sel_delete"
																	style="margin-top: 6px; border-radius: 5px; background: #fff;
																	 border: 1px solid gray; width: 70px; height: 28px; font-weight:
																	  bold; font-size: 10px; font-family: MapoPeacefull;"
																	  onclick="test3(${re.mb_bo_num },${re.me_num });">삭제</button>
															
															</td>

														</tr>
												</c:if>
												</tbody>
											</table>
										</c:forEach>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 페이징 처리 -->
				<c:if test="${ pi.listCount > 0}">
				<div class="pagination">

					<c:if test="${ pi.currentPage eq 1 }">
						<img src="resources/img/arrow_left.png" alt="첫 페이지로 이동"
							class="firstpage_img" style="margin-right: 10px">
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url var="before"
							value="mypageloverecipe.bo?mem_num=${loginUser.mem_num}">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }"><img src="resources/img/arrow_left.png"
							alt="첫 페이지로 이동" class="firstpage_img" style="margin-right: 10px"></a>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<span class="pagenum_currentpage"> <font color="white"
								size="3"><b>${ p }</b></font>
							</span>
						</c:if>

						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination"
								value="mypageloverecipe.bo?mem_num=${loginUser.mem_num}">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<span class="pagenum"> <a href="${ pagination }">${ p }</a>
							</span>
						</c:if>
					</c:forEach>

					<c:if test="${ pi.currentPage eq pi.maxPage }">
						<img src="resources/img/arrow_right.png" alt="이전 페이지로 이동"
							class="prevpage_img" style="margin-left: 10px">
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url var="after"
							value="mypageloverecipe.bo?mem_num=${loginUser.mem_num}">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }"><img src="resources/img/arrow_right.png"
							alt="이전 페이지로 이동" class="prevpage_img" style="margin-left: 10px"></a>
					</c:if>
				</div>
				</c:if>
			</form>
		</div>

	</div>


	<!--전체동의-->
	<script>
		$("#chk_all").click(function() {
			var chk = $("#chk_all").prop("checked");
			if (chk) {
				$(".ico_check").prop("checked", true);
			} else {
				$(".ico_check").prop("checked", false);
			}
		});
	</script>

	<!--전체동의가 체크되있을 때 하나라도 풀리면 해제-->
	<script>
		$(".ico_check").click(function() {
			$("#chk_all").prop("checked", false);
		});
	</script>

	<!-- <script>
		//선택삭제
		$('.btn_delete').click(function() {
			if (confirm("정말 삭제하시겠습니까??") == true) { //확인
				$(this).closest("tr").remove()
			} else {
				return false;
			}
		});
	</script> -->

	<!-- 찜한리스트 전체 삭제  -->
	<script>
		$("#all_delete").click(
			function() {
				$('#recipeFrom')
						.attr('action', 'myrecipedelete.bo');
				if (confirm("정말 전체삭제 하시겠습니까??") == true) { //확인
					$.ajax({
						url : "myrecipedelete.bo",
						type : "post",
						data : {
							mem_num : "${loginUser.mem_num}"
						},
						dataType : "text",
						success : function(data) {
							if (data == "ok") {
								window.location.replace("mypageloverecipe.bo?mem_num=${loginUser.mem_num}");
							} else {
								window.location.replace("mypageloverecipe.bo?mem_num=${loginUser.mem_num}");
							}
						},
						error : function(request, status,
								errorData) {
							alert("error code : "
									+ request.status + "\n"
									+ "message: "
									+ request.responseText
									+ "error : "
									+ errorData);
						}
					})
				} else { //취소
					return false;
				}
			});
	</script>
	
	<script>
	function test3(mb_bo_num,me_num){
		$('#recipeFrom')
				.attr('action', 'myrecipeonedelete.bo');
		if (confirm("정말 삭제 하시겠습니까??") == true) { //확인
			$.ajax({
				url : "myrecipeonedelete.bo",
				type : "post",
				data : {
					mem_num : "${loginUser.mem_num}",
					mb_bo_num : mb_bo_num,
					me_num :  me_num
				},
				dataType : "text",
				success : function(data) {
					if (data == "ok") {
						window.location.replace("mypageloverecipe.bo?mem_num=${loginUser.mem_num}");
					} else {
						window.location.replace("mypageloverecipe.bo?mem_num=${loginUser.mem_num}");
					}
				},
				error : function(request, status,
						errorData) {
					alert("error code : "
							+ request.status + "\n"
							+ "message: "
							+ request.responseText
							+ "error : "
							+ errorData);
				}
			})
		} else { //취소
			return false;
		}
	
	}
	</script>

</body>
</html>