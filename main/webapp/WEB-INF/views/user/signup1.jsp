<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@include file="../include/header.jsp" %>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
function doSubmit(){
	var userid = $("#userid");
	var email = $("#email");

	if(userid.val() == ""){	
		alert("아이디를 입력해주세요!");
		userid.focus();	
		return;
	}
	if(email.val() == ""){	
		alert("이메일을 입력해주세요!");
		email.focus();	
		return;
	}
	
	document.form1.submit();
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>


<div class="progress" style="height: 50px;">
	<div class="progress-bar bg-primary" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
		<a href="#" class="btn btn-block text-light"><i class="fa fa-map-marker"></i>&nbsp;아이디/이메일 중복확인</a>
	</div>
	<div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
		<a href="#" class="btn btn-block text-dark"><i class="fa fa-spinner"></i>&nbsp;상세 정보 입력</a>
	</div>
	<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
		<a href="#" class="btn btn-block text-dark"><i class="fa fa-spinner"></i>&nbsp;회원가입 완료</a>
	</div>
</div>

<br><hr><br><br>

<div class="container-fluid">
 <div class="row justify-content-center">
  <div class="col col-md-8">
  	
  
	<form action="${path }/user/signup1.do" method="post" id="form1" name="form1">
	
  		<c:if test="${hasUserid != null }">
  			<div class="form-group row justify-content-center">
    			<div class="col col-auto">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
 						<strong>${hasUserid }</strong> 다른 아이디를 입력해주세요.
  						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    						<span aria-hidden="true">&times;</span>
  						</button>
					</div>
    			</div>
  			</div>
  		</c:if>
  		<div class="form-group row">
    		<label for="userid" class="col-md-4 col-form-label">ID</label>
    		<div class="col-md-8">
      			<input class="form-control" id="userid" name="userid" placeholder="ID" autocomplete="off" value="${userid }">
    		</div>
  		</div>
  		<c:if test="${hasEmail != null }">
  			<div class="form-group row justify-content-center">
    			<div class="col col-auto">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
 						<strong>${hasEmail }</strong> 다른 이메일 주소를 입력해주세요.
  						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    						<span aria-hidden="true">&times;</span>
  						</button>
					</div>
    			</div>
  			</div>
  		</c:if>
  		<div class="form-group row">
    		<label for="email" class="col-md-4 col-form-label">Email</label>
    		<div class="col-md-8">
      			<input type="email" class="form-control" name="email" id="email" placeholder="email@example.com" autocomplete="off" value="${email }">
    		</div>
  		</div>
  		
  		
		<br>
		<div class="form-group row justify-content-center">
			<div class="col col-auto">
				<input type="button" value="다음" id="btnSubmit" class="btn btn-primary btn-lg" onclick="doSubmit()">
			</div>
		</div>
	
	</form>
	
	
	
  </div>
 </div>
</div>


</body>
</html>