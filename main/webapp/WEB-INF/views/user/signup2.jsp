<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보 입력</title>
<%@include file="../include/header.jsp" %>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
function doSubmit(){
	var userid = $("#userid");
	var pwd = $("#pwd");
	var name = $("#name");
	var email = $("#email");
	var tel = $("#tel");
	var zipcode = $("#zipcode");
	var address1 = $("#address1");
	var address2 = $("#address2");
	
	if(pwd.val() == ""){	
		alert("비밀번호를 입력해주세요!");
		pwd.focus();	
		return;
	}
	if(name.val() == ""){	
		alert("이름을 입력해주세요!");
		name.focus();	
		return;
	}
	if(tel.val() == ""){	
		alert("전화번호를 입력해주세요!");
		tel.focus();	
		return;
	}
	if(zipcode.val() == ""){	
		alert("주소를 검색해주세요!");
		zipcode.focus();	
		return;
	}
	if(address2.val() == ""){	
		alert("상세주소를 입력해주세요!");
		address2.focus();	
		return;
	}
	
	document.form1.action="${path}/user/signup2.do";
	document.form1.submit();
}
</script>
</head>
<body>

<div class="container-fluid">
 <div class="row justify-content-center">
  <div class="col col-md-8">
	<form action="" method="post" name="form1" id="form1">
	
  		<div class="form-group row">
    		<label for="userid" class="col-md-4 col-form-label">ID</label>
    		<div class="col-md-8">
      			<input class="form-control" id="userid" name="userid" readonly="readonly" value="${userid }">
    		</div>
  		</div>
  		
  		<div class="form-group row">
    		<label for="pwd" class="col-md-4 col-form-label">Password</label>
    		<div class="col-md-8">
      			<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" autocomplete="off">
    		</div>
  		</div>
  		
  		<div class="form-group row">
    		<label for="name" class="col-md-4 col-form-label">이름</label>
    		<div class="col-md-8">
      			<input class="form-control" id="name" name="name" placeholder="이름" autocomplete="off">
    		</div>
  		</div>
  		
  		<div class="form-group row">
    		<label for="email" class="col-md-4 col-form-label">Email</label>
    		<div class="col-md-8">
      			<input type="email" class="form-control" id="email" name="email" readonly="readonly" value="${email }">
    		</div>
  		</div>
  		
  		<div class="form-group row">
    		<label for="tel" class="col-md-4 col-form-label">전화번호</label>
    		<div class="col-md-8">
      			<input type="tel" class="form-control" id="tel" name="tel" placeholder="010-1234-5678" autocomplete="off">
    		</div>
  		</div>
  		
  		<div class="form-group row">
			<label for="postcodify_search_button" class="col-md-4 col-form-label">우편번호</label>
			 	<div class="col-md-4">
  					<input name="zipcode" id="zipcode" class="postcodify_postcode5 form-control" autocomplete="off" readonly="readonly" placeholder="우편번호를 검색하세요.">
				</div>
				<div class="col-md-4">
					<input type="button" id="postcodify_search_button" class="btn btn-info btn-block" value="검색">
				</div>
		</div>
		<div class="form-group row">
			<label for="postcodify_search_button" class="col-md-4 col-form-label">주소</label>
    		<div class="col-md-8">
  				<input name="address1" id="address1" class="postcodify_address form-control" readonly="readonly" placeholder="주소를 검색하세요.">
  			</div>
		</div>
		<div class="form-group row">
			<label for="address2" class="col-md-4 col-form-label">상세주소</label>
    		<div class="col-md-8">
				<input name="address2" id="address2" class="postcodify_details form-control" autocomplete="off" placeholder="상세 주소를 입력하세요.">
  			</div>
		</div>
		<br>
		<div class="form-group row justify-content-center">
			<div class="col col-auto">
				<input type="button" value="회원가입" id="btnSubmit" class="btn btn-primary btn-lg" onclick="doSubmit()">
				<input type="reset" value="입력 초기화" class="btn btn-danger btn-lg">
			</div>
		</div>
	
	</form>
	
	
	
  </div>
 </div>
</div>


</body>
</html>