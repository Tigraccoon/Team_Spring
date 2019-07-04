<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>


<c:if test="${message != null }">
  <div class="form-group row justify-content-center">
    <div class="col col-auto">
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
 			<strong>${message }</strong>&nbsp;&nbsp;확인하고 다시 로그인해주세요.
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
    </div>
   </div>
</form>

		</div>
	</div>
</div>

</body>
</html>