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
�����Ͻ� ī�װ� �� : <input type=text value="${catename}"/>
<form action="cateimgupload.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="upcatecode" value="${upcatecode}"/>
<input type="file" name="uploadFile">
<input type="submit" value="����">
</form>
</center>
</body>
</html>