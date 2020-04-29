<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<center>
<br>
선택하신 카테고리 명 : <input type=text value="${catename}"/>
<form action="cateimgupload.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="upcatecode" value="${upcatecode}"/>
<img id="img" src='resources/img/errorimg.PNG'>
<input id="input_img" type="file" name="uploadFile">
<input  type="submit" value="ㄱㄱ">
</form>
</center>
</body>
<script>
var sel_file;
   $(document).ready(function() {
      $("#input_img").on("change", handleImgFileSelect); //input type file
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
            $("#img").attr("src", e.target.result); // img 보이는 영역
         }
         reader.readAsDataURL(f);
      });
   }
</script>
</html>