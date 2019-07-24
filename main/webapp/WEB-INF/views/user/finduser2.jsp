<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 성공</title>
<%@include file="../include/header.jsp" %>
<style type="text/css">
.log{text-align: center; padding-top: 120px;}
.jy{color: red;}
h5{text-align: center;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="log">
<img src="${path }/img/join.jpg">
</div>
<div class="container-fluid">
 <div class="row justify-content-center">
  <div class="col col-auto">

  	<h5><strong>§ 아이디/비밀번호</strong>찾기에 성공하였습니다! § </h5>
  	<br>
  	<h6>보안을 위해 비밀번호를 아래와 같이 임시 비밀번호로 변경하였습니다.</h6>
  	<h6 class="jy">*&nbsp;개인정보 수정에서 비밀번호를 변경해주세요.</h6>
  	<br>
  	<b>아이디 : <strong>${userid }</strong></b><br>
  	<b>비밀번호 : <strong>${pwd }</strong></b><br>
  	<br>
  	<a href="${path }/user/login.go" class="btn btn-primary btn-block">재로그인 하기</a>
	
	
	
  </div>
 </div>
</div>
<div style="margin-top: 110px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>