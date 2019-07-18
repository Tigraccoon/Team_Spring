<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 성공</title>
<%@include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="container-fluid">
 <div class="row justify-content-center">
  <div class="col col-auto">
  	
  	<h2><strong>아이디/비밀번호</strong>찾기에 성공하였습니다!</h2>
  	<br>
  	<h3>보안을 위해 비밀번호를 아래와 같이 임시 비밀번호로 변경하였습니다.</h3>
  	<h3>개인정보 수정에서 비밀번호를 변경해주세요.</h3>
  	<br>
  	<b>아이디 : <strong>${userid }</strong></b><br>
  	<b>비밀번호 : <strong>${pwd }</strong></b><br>
  	<br>
  	<a href="${path }/user/login.go" class="btn btn-primary btn-block">로그인</a>
	
	
	
  </div>
 </div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>