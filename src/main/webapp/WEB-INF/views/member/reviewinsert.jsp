<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>basket</title>   
    <link rel="stylesheet" href="resources/css/myPage.css">
    <link rel="stylesheet" href="resources/css/reviewinsert.css">
    <script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
      <!-- 헤더부분-->
      <%@include file="../common/mypageheader.jsp" %>

   <!--마이페이지 왼쪽 부분-->
    <div class="page_aticle aticle_type2">
        <div id="snb" class="snb_my">
       <h2 class="tit_snb">마이컬리</h2>
       <div class="inner_snb">
           <ul class="list_menu_left">
               <li>
                    <a href="myorderlist.bo?mem_num=${loginUser.mem_num}">주문 내역</a>
               </li>
               <li class="on">
                   <a href="mypagereview">상품후기</a>
               </li>
               <li> 
                    <a href="mypageloverecipe.bo?mem_num=${loginUser.mem_num}">찜한 레시피</a>
               </li>
               <li>
                    <a href="mypagechange">개인 정보 수정</a>
               </li>
           </ul>
       </div>
    </div>

     <!--후기 작성 하는 곳 -->
    <div class="page_section section_write">
		<div class="head_aticle">
			<h2 class="tit">후기 작성</h2>
        </div>
			<div class="write_board">
				<div class="goods_info">
					<div class="thumb">
						<img src="resources/img/Productuploadimg/<%=request.getParameter("renamefile") %>"  onerror="this.src='resources/img/errorimg.PNG'" alt="상품 이미지" 
						style="width: 100px;height: 110px;max-width: none;">
					</div>
					<div class="desc">
						<div class="inner_desc">
							<div class="name_desc" style="text-align: left;font-size: 12px;font-weight: bold;color: #2e8b57; margin-bottom: 6px;">
								<%=request.getParameter("mcate") %> > <%=request.getParameter("scate") %>
							</div>
							<div class="name_main" style="text-align: left;"><%=request.getParameter("pr_name") %></div>
						</div>
					</div>
				</div>
	
			<form action="reviewinsert" method="post" enctype="multipart/form-data">
				<table class="tbl">
					<tbody>
					<tr>
						<th style="width: 110px; height: 54px; text-align: center;">제목</th>
						<td>
							<input type="text" id="reviewtit" name="re_title" placeholder="제목을 입력해주세요." class="inp " value="">
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">후기작성</th>
						<td>
							<div class="field_cmt">
								<textarea id="fieldCmt" name="re_content" cols="100" rows="10" placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며,
일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다. 
반품/환불 문의는 1:1문의로 가능합니다."></textarea>
								
							</div>
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">사진등록</th>
						<td>
							<div class="photo_add">

								<div class="inner_photo"></div>
								<span class="btn_upload">
									<input type="file" name="uploadFile" class="file_upload" onchange="photoUp($(this))" value="사진등록하기" accept="image/x-png,image/gif,image/jpeg">
								</span>
								<br>
								<p class="photo_notice" style="float:left;padding-bottom: 0px;">구매한 상품이 아니거나 캡쳐 사진을 첨부할 경우, 통보없이 삭제 및 적립 혜택이 취소됩니다.</p>
							</div>
							<div class="file_count">
							</div>
						</td>
					</tr>
					</tbody>
				</table>
				<input type="hidden" value="<%=request.getParameter("or_num") %>" name="or_num" id="or_num"/>
				<input type="hidden" value="<%=request.getParameter("pr_code") %>" name="prcode" id="prcode"/>
				<button type="submit" id="btnSubmit" class="btn_reg btn_disabled" style="cursor: pointer;">등록하기</button>
            </form>
            </div>   
	</div>
    </div>
</body>
</html>