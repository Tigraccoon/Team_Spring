<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>


<c:if test="${message1 != '' }">
  <div class="form-group row justify-content-center">
    <div class="col col-auto">
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
 			<strong>${message1 }</strong>&nbsp;&nbsp;${message2 }
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    			<span aria-hidden="true">&times;</span>
  			</button>
		</div>
    </div>
  </div>
</c:if>


<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-auto">

		<h2>로그인</h2>
<form method="post" action="${path }/user/login.do">
   <div class="form-group row">
    <label for="userid" class="col-sm-4 col-form-label">아이디</label>
    <div class="col-md">
      <input class="form-control" name="userid" id="userid" placeholder="ID">
    </div>
  </div>
  <div class="form-group row">
    <label for="pwd" class="col-sm-4 col-form-label">비밀번호</label>
    <div class="col-md-8">
      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
    </div>
  </div>

   <div class="form-group row justify-content-center">
    <div class="col col-auto">
    	<button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i>&nbsp;로그인</button>
    	&nbsp;&nbsp;<a href="${path }/user/finduser.go" class="btn btn-info"><i class="fa fa-key"></i>&nbsp;아이디/비밀번호 찾기</a>
    	&nbsp;&nbsp;<a href="${path }/user/signup.go" class="btn btn-info"><i class="fa fa-user-plus"></i>&nbsp;회원가입</a>
    </div>
   </div>
</form>

		</div>
	</div>
</div>

</body>
</html>