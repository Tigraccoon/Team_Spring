<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<%@include file="../include/header.jsp" %>
<script type="text/javascript">
function doSubmit(){
	var email = $("#email");
	var name = $("#name");

	if(email.val() == ""){	
		alert("이메일을 입력해주세요!");
		email.focus();	
		return;
	}
	if(name.val() == ""){	
		alert("이름을 입력해주세요!");
		name.focus();	
		return;
	}
	
	document.form1.submit();
}
</script>
<style type="text/css">
.log{text-align: center; padding-top: 129px;}
.find{width: 32%; margin-left: auto; margin-right: auto;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="log">
<img src="${path }/img/join.jpg">
</div>
<div class="container-fluid">
 <div class="row justify-content-center">
  <div class="col col-md-8">
  	
  
	<form action="${path }/user/finduser.do" method="post" id="form1" name="form1" class="find">
	
  		<c:if test="${cantfind != null }">
  			<div class="form-group row justify-content-center">
    			<div class="col col-auto">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
 						<strong>${cantfind }</strong>
  						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    						<span aria-hidden="true">&times;</span>
  						</button>
					</div>
    			</div>
  			</div>
  		</c:if>
  		
  		<div class="form-group row">
  		<label for="email" class="col-md-4 col-form-label">이름</label>
    		<div class="col-md-8">
      			<input class="form-control" name="name" id="name" placeholder="회원가입시 입력한  이름 " 
      			autocomplete="off">
    		</div>
  		</div>
  		<div class="form-group row">
    		<label for="userid" class="col-md-4 col-form-label">Email</label>
    		<div class="col-md-8">
      			<input type="email" class="form-control" id="email" name="email" 
      			       placeholder="회원가입시 입력한  이메일 " autocomplete="off">
    		</div>
  		</div>
  		
		<br>
		<div class="form-group row justify-content-center">
			<div class="col col-auto">
				<input type="button" value="ID/PW 찾기" id="btnSubmit" class="btn btn-primary btn-lg" 
				onclick="doSubmit()">
			</div>
		</div>
	
	</form>
	
  </div>
 </div>
</div>
<div style="margin-top: 140px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>