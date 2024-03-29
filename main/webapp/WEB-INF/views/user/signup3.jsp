<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<%@include file="../include/header.jsp" %>
<style type="text/css">
.log{text-align: center; padding-top: 85px;}
.progress{width: 50%; height: auto; margin-left: auto; margin-right: auto;}
.join{width: 30%; margin-left: auto; margin-right: auto;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="progress" style="height: 50px;">
 	<div class="progress-bar bg-primary" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
 		<a href="${path }/user/signup1.go" class="btn btn-block text-dark"><i class="fa fa-check"></i>&nbsp;아이디/이메일 중복확인</a>
 	</div>
	<div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
		<a href="${path }/user/signup2.go" class="btn btn-block text-dark"><i class="fa fa-check"></i>&nbsp;상세 정보 입력</a>
	</div>
 	<div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
 		<a href="#" class="btn btn-block text-light"><i class="fa fa-star"></i>&nbsp;회원가입 완료</a>
 	</div>
</div>
  	
<div class="log">
<img src="${path }/img/join.jpg">
</div>
<br><br>
 	
<div class="container-fluid">
 <div class="row justify-content-center">
  <div class="col col-auto">
  	
  	<h2><strong>${userid }</strong>님 회원가입에 성공하였습니다.</h2>
  	<br>
  	<a href="${path }/user/login.go" class="btn btn-primary btn-block">로그인 하기</a>
  </div>
 </div>
</div>
<div style="margin-top: 100px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>