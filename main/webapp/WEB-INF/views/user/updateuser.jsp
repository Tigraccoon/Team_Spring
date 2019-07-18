<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../include/header.jsp" %>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#postcodify_search_button").postcodifyPopUp();
	$('#userinfo-tab a[href="#userinfo"]').tab('show');
	$('#myclass-tab a[href="#myclass"]').tab('show');
	$('#deluser-tab a[href="#deluser"]').tab('show');
});

function doUpdate(){
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
	
	alert("회원정보가 수정됩니다. 다시 로그인해주세요.");
	document.updateform.submit();
}

function doDelete(){
	if(confirm("정말 회원 탈퇴하시겠습니까?")==true){
		
		document.deleteform.submit();
	} else{
		return;
	}
	
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container-fluid">
 <div class="row justify-content-center">
  <div class="col-3">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="userinfo-tab" data-toggle="pill" href="#userinfo" role="tab" aria-controls="userinfo" aria-selected="true">회원정보관리</a>
      <a class="nav-link" id="myclass-tab" data-toggle="pill" href="#myclass" role="tab" aria-controls="myclass" aria-selected="false">내 강의</a>
      <a class="nav-link" id="deluser-tab" data-toggle="pill" href="#deluser" role="tab" aria-controls="deluser" aria-selected="false">회원 탈퇴</a>
    </div>
  </div>
  <div class="col-9">
    <div class="tab-content" id="v-pills-tabContent">
    <!-- 회원정보관리 -->
      <div class="tab-pane fade show active" id="userinfo" role="tabpanel" aria-labelledby="userinfo-tab">
      	<h2>회원 정보</h2>
 		<br><br>
		<form action="${path }/user/updateuser.do" method="post" name="updateform" id="updateform">
	  		<div class="form-group row">
	    		<label for="userid" class="col-md-3 col-form-label">ID</label>
	    		<div class="col-md-6">
	      			<input class="form-control" id="userid" name="userid" readonly="readonly" value="${user.userid }">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
	    		<label for="pwd" class="col-md-3 col-form-label">Password</label>
	    		<div class="col-md-6">
	      			<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" autocomplete="off">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
	    		<label for="name" class="col-md-3 col-form-label">이름</label>
	    		<div class="col-md-6">
	      			<input class="form-control" id="name" name="name" placeholder="이름" autocomplete="off" value="${user.name }">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
	    		<label for="email" class="col-md-3 col-form-label">Email</label>
	    		<div class="col-md-6">
	      			<input type="email" class="form-control" id="email" name="email" readonly="readonly"  value="${user.email }">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
	    		<label for="tel" class="col-md-3 col-form-label">전화번호</label>
	    		<div class="col-md-6">
	      			<input type="tel" class="form-control" id="tel" name="tel" placeholder="010-1234-5678" autocomplete="off"  value="${user.tel }">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
				<label for="postcodify_search_button" class="col-md-3 col-form-label">우편번호</label>
				 	<div class="col-md-3">
	  					<input name="zipcode" id="zipcode" class="postcodify_postcode5 form-control" autocomplete="off" readonly="readonly" placeholder="우편번호를 검색하세요."  value="${user.zipcode }">
					</div>
					<div class="col-md-3">
						<input type="button" id="postcodify_search_button" class="btn btn-info btn-block" value="검색">
					</div>
			</div>
			<div class="form-group row">
				<label for="postcodify_search_button" class="col-md-3 col-form-label">주소</label>
	    		<div class="col-md-6">
	  				<input name="address1" id="address1" class="postcodify_address form-control" readonly="readonly" placeholder="주소를 검색하세요."  value="${user.address1 }">
	  			</div>
			</div>
			<div class="form-group row">
				<label for="address2" class="col-md-3 col-form-label">상세주소</label>
	    		<div class="col-md-6">
					<input name="address2" id="address2" class="postcodify_details form-control" autocomplete="off" placeholder="상세 주소를 입력하세요."  value="${user.address2 }">
	  			</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 col-form-label">가입일</label>
	    		<div class="col-md-6">
					<fmt:formatDate value="${user.joindate }" pattern="yyyy-MM-dd HH:mm:ss E"/>
	  			</div>
			</div>
			<br>
			<div class="form-group row justify-content-center">
				<div class="col col-auto">
					<input type="hidden" value="${user.class_name }", name="class_name">
					<input type="button" value="회원 정보 수정" id="btnUpdate" class="btn btn-primary btn-lg" onclick="doUpdate()">
				</div>
			</div>
		</form>
      </div>
      
      <!-- 내 강의 -->
      <div class="tab-pane fade" id="myclass" role="tabpanel" aria-labelledby="myclass-tab">
	      <h2>내 강의</h2>
	 		<br><br>
      </div>
      <!-- 회원탈퇴 -->
      <div class="tab-pane fade" id="deluser" role="tabpanel" aria-labelledby="deluser-tab">
	      <h2>회원 탈퇴</h2>
	 		<br><br>
	 		
      		<form action="${path }/user/deleteuser.do" method="post" id="deleteform" name="deleteform">
      		<div class="form-group row justify-content-center">
				<div class="col col-auto">
      				<input type="hidden" value="${user.userid }" name="userid">
      				<input type="button" value="회원 탈퇴" id="btnDelete" class="btn btn-danger btn-lg" onclick="doDelete()">
      			</div>
      		</div>
      		</form>
      </div>
    </div>
  </div>
 </div>
</div>


</body>
</html>