<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-auto">
		
  <h2 style="margin-top: 30px;"> | ${sessionScope.user.name }님 </h2>	
<h4 style="color:green;"> &nbsp;&nbsp;&nbsp;회원정보 확인을 위한 비밀번호 입력</h4>
	<br><br>
	<c:if test="${message != '' }">
  			<div class="form-group row justify-content-center">
    			<div class="col col-auto">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
 						<strong>${message }</strong>  비밀번호를 확인해주세요!
  						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    						<span aria-hidden="true">&times;</span>
  						</button>
					</div>
    			</div>
  			</div>
  		</c:if>
<form method="post" action="${path }/user/pwdcheck.do">
   <div class="form-group row">
    <label for="userid" class="col-sm-4 col-form-label">아이디</label>
    <div class="col-md">
      <input class="form-control" id="userid" name="userid" value="${user.userid }" readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="pwd" class="col-sm-4 col-form-label">비밀번호</label>
    <div class="col-md-8">
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
    </div>
  </div>

   <div class="form-group row justify-content-center">
    <div class="col col-auto">
    	<button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i>&nbsp;확인</button>
    </div>
   </div>
</form>

		</div>
	</div>
</div>

</body>
</html>