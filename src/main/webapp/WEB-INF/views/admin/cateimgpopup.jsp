<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<center>
<br>
�����Ͻ� ī�װ� �� : <input type=text value="${catename}"/>
<form action="cateimgupload.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="upcatecode" value="${upcatecode}"/>
<img id="img" src='resources/img/errorimg.PNG' width="500" height="400">
<input id="input_img" type="file" name="uploadFile">
<input  type="submit" value="�Է��ϱ�">
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
            alert("Ȯ���ڴ� �̹��� Ȯ���ڸ� �����մϴ�.");
            return;
         }
         sel_file = f;
         var reader = new FileReader();
         reader.onload = function(e) {
            $("#img").attr("src", e.target.result); // img ���̴� ����
         }
         reader.readAsDataURL(f);
      });
   }
</script>
</html>