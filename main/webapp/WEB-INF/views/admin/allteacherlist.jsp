<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사관리</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	var keyword = '${keyword}';
	var class_name = '${class_name}';
	var align = '${align}';
	
	
	//강사
	$("#t-all-tab").click(function(){
		
		$("#t-list").attr("aria-labelledby", "t-all-tab");
		$('#t-all-tab a[href="#t-list"]').tab('show');
		
		list('1', '', '', '');
	});
	
	$("#t-non-tab").click(function(){
		
		$("#t-list").attr("aria-labelledby", "t-non-tab");
		$('#t-non-tab a[href="#t-list"]').tab('show');
		
		list('1', '', '-', '');
	});
	
	$("#t-gisa1-tab").click(function(){
		
		$("#t-list").attr("aria-labelledby", "t-gisa1-tab");
		$('#t-gisa1-tab a[href="#t-list"]').tab('show');
		
		list('1', '', '정보처리기사필기', '');
	});
	
	$("#t-gisa2-tab").click(function(){
		
		$("#t-list").attr("aria-labelledby", "t-gisa2-tab");
		$('#t-gisa2-tab a[href="#t-list"]').tab('show');
		
		list('1', '', '정보처리기사실기', '');
	});
	
	$("#t-web1-tab").click(function(){
		
		$("#t-list").attr("aria-labelledby", "t-web1-tab");
		$('#t-web1-tab a[href="#t-list"]').tab('show');
		
		list('1', '', '웹프로그래밍초급', '');
	});
	
	$("#t-web2-tab").click(function(){
		
		$("#t-list").attr("aria-labelledby", "t-web2-tab");
		$('#t-web2-tab a[href="#t-list"]').tab('show');
		
		list('1', '', '웹프로그래밍고급', '');
	});
	
});


function list(page, keyword, class_name, align){
	location.href="${path}/user/admin/allteacherslist.go?curPage="+page+"&keyword="+encodeURIComponent(keyword)+"&class_name="+encodeURIComponent(class_name)+"&align="+encodeURIComponent(align);
}
</script>
<style type="text/css">
.title{float:left; margin-right: 5px; margin-top: -6px; clear: both; opacity: 0.8;}
.title2 h2, .title2 h4 {dispaly:inline;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-10">		
				     <br>
                      <img src="${path }/img/log1.jpg" class="title">
                      <div class="title2">
                    <h2>강사 관리</h2> 
                 <div style="opacity: 0.8; margin-top: -7px;">Instructor Management</div>
                   </div>
					<br>
					
<div class="row">
	<div class="col col-8">
		<ul class="nav nav-phils" id="tTab" role="tablist">
		  <li class="nav-item">
		    <a class="nav-link" id="t-all-tab" data-toggle="tab" href="#t-list" role="tab" aria-controls="t-list" aria-selected="true" onclick="alltab">전체강사</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="t-non-tab" data-toggle="tab" href="#t-list" role="tab" aria-controls="t-list" aria-selected="false">미분류</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="t-gisa1-tab" data-toggle="tab" href="#t-list" role="tab" aria-controls="t-list" aria-selected="false">정보처리기사필기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="t-gisa2-tab" data-toggle="tab" href="#t-list" role="tab" aria-controls="t-list" aria-selected="false">정보처리기사실기</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="t-web1-tab" data-toggle="tab" href="#t-list" role="tab" aria-controls="t-list" aria-selected="false">웹프로그래밍초급</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="t-web2-tab" data-toggle="tab" href="#t-list" role="tab" aria-controls="s-list" aria-selected="false">웹프로그래밍고급</a>
		  </li>
		</ul>
	</div>
	
	<div class="col col-4 justify-content-end">
		<form class="form-inline my-2" method="post" action="${path }/user/admin/allteacherslist.go">
			<select class="form-control mr-sm-2" name="class_name">
			  <option selected value="%">전체강사</option>
			  <option value="-">미분류</option>
			  <option value="정보처리기사필기">정보처리기사필기</option>
			  <option value="정보처리기사실기">정보처리기사실기</option>
			  <option value="웹프로그래밍초급">웹프로그래밍초급</option>
			  <option value="웹프로그래밍고급">웹프로그래밍고급</option>
			</select>
		    <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="강사 검색" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i>&nbsp;검색</button>
		</form>
	</div>
</div>	
	<hr><br>
<div class="row">
	<div class="col col-12">
	<div class="tab-content" id="myTabContent">
	  <div class="tab-pane fade show active" id="t-list" role="tabpanel" aria-labelledby="s-all-tab">
	  
	<table class="table table-bordered" style="text-align: center;">
	<caption style="text-align: right; caption-side: top;"><strong>${usercount }</strong>&nbsp;명의 강사가 있습니다.</caption>
	<thead>
		<tr class="table-primary" style="width: 100%;">
			<th scope="col">
				아이디
				<button type="button" class="btn btn-light btn-sm" onclick="list('1', '${keyword}', '${class_name}', 'useridasc' )"><i class="fa fa-caret-up"></i></button>
				<button type="button" class="btn btn-light btn-sm" onclick="list('1', '${keyword}', '${class_name}', 'useriddesc' )"><i class="fa fa-caret-down"></i></button>
			</th>
			<th scope="col">
				이름
				<button type="button" class="btn btn-light btn-sm" onclick="list('1', '${keyword}', '${class_name}', 'nameasc' )"><i class="fa fa-caret-up"></i></button>
				<button type="button" class="btn btn-light btn-sm" onclick="list('1', '${keyword}', '${class_name}', 'namedesc' )"><i class="fa fa-caret-down"></i></button>
			</th>
			<th scope="col">전화번호</th>
			<th scope="col">이메일</th>
			<th scope="col">강좌명</th>
			<th scope="col">상세정보</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${teacherslist }">
			<tr>
				<td>${list.userid }</td>
				<td>${list.name }</td>
				<td>${list.tel }</td>
				<td>${list.email }</td>
				<td>${list.class_name }</td>
				<td>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#teacherinfo${list.userid}">
		  				상세정보
					</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	
	
	<!-- 페이지 -->
	<br><br>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	<c:if test="${pager.curBlock > 1 }">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous" onclick="list('1', '${keyword }', '${class_name}', '${align}')">
	        <span aria-hidden="true">&laquo;</span><!-- 처음 -->
	      </a>
	    </li>
	</c:if>
	<c:if test="${pager.curBlock > 1}">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous" onclick="list('${pager.prevPage}', '${keyword }', '${class_name}', '${align}')">
	        <span aria-hidden="true">&lt;</span><!-- 이전 -->
	      </a>
	    </li>
	</c:if>
	<c:forEach var="num" begin="${pager.blockBegin}" end="${pager.blockEnd}">
		<c:choose>
			<c:when test="${num == pager.curPage}"><!-- 현재 패이지 -->
				<li class="page-item active" aria-current="page">
					<span class="page-link">${num }<span class="sr-only">(current)</span></span>
				</li>
			</c:when>
			<c:otherwise>
			<li class="page-item"><!-- 페이지들 -->
	      		<a class="page-link" href="#" onclick="list('${num}', '${keyword }', '${class_name}', '${align}')">${num }</a>
	    	</li>
			</c:otherwise>
		</c:choose>
		</c:forEach>
	<c:if test="${pager.curBlock < pager.totBlock}">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next" onclick="list('${pager.nextPage}', '${keyword }', '${class_name}', '${align}')">
	        <span aria-hidden="true">&gt;</span><!-- 다음 -->
	      </a>
	    </li>
	</c:if>
	    
	<c:if test="${pager.curPage < pager.totPage}">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next" onclick="list('${pager.totPage}', '${keyword }', '${class_name}', '${align}')">
	        <span aria-hidden="true">&raquo;</span><!-- 끝 -->
	      </a>
	    </li>
	</c:if>
	  </ul>
	</nav>
	
	<br><br><br>
		</div>
	</div>
	</div>
</div>
					
	<button type="button" class="btn btn-block btn-primary" data-toggle="modal" data-target="#teacherinsert">
		  	강사 계정 생성
	</button>	
		</div>
	</div>
</div>

<!-- 상세정보 모달 -->

<c:forEach var="list" items="${teacherslist }">

		<form action="${path }/user/admin/updateteacher.do" method="post" name="updateform" id="updateform">
<div class="container-fluid">
  <div class="row justify-content-center">
	<div class="col col-10">
<div class="modal fade" id="teacherinfo${list.userid}" tabindex="-1" role="dialog" aria-labelledby="userinfoLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="userinfoLabel">상세정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  		<div class="form-group row">
	    		<label for="userid${list.userid}" class="col-md-3 col-form-label">ID</label>
	    		<div class="col-md-6">
	      			<input class="form-control" id="userid${list.userid}" name="userid" value="${list.userid}">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
	    		<label for="pwd${list.userid}" class="col-md-3 col-form-label">Password</label>
	    		<div class="col-md-6">
	      			<input type="text" class="form-control" id="pwd${list.userid}" name="pwd" placeholder="Password" autocomplete="off">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
	    		<label for="name${list.userid}" class="col-md-3 col-form-label">이름</label>
	    		<div class="col-md-6">
	      			<input class="form-control" id="name${list.userid}" name="name" placeholder="이름" autocomplete="off" value="${list.name }">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
	    		<label for="email${list.userid}" class="col-md-3 col-form-label">Email</label>
	    		<div class="col-md-6">
	      			<input type="email" class="form-control" id="email${list.userid}" name="email" value="${list.email }">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
	    		<label for="tel${list.userid}" class="col-md-3 col-form-label">전화번호</label>
	    		<div class="col-md-6">
	      			<input type="tel" class="form-control" id="tel${list.userid}" name="tel" placeholder="010-1234-5678" autocomplete="off"  value="${list.tel }">
	    		</div>
	  		</div>
	  		
	  		<div class="form-group row">
				<label for="zipcode${list.userid}" class="col-md-3 col-form-label">우편번호</label>
				 	<div class="col-md-6">
	  					<input name="zipcode" id="zipcode${list.userid}" class="form-control" autocomplete="off" placeholder="우편번호를 입력하세요."  value="${list.zipcode }">
					</div>
			</div>
			<div class="form-group row">
				<label for="address1${list.userid}" class="col-md-3 col-form-label">주소</label>
	    		<div class="col-md-6">
	  				<input name="address1" id="address1${list.userid}" class="form-control" placeholder="주소를 입력하세요."  value="${list.address1 }">
	  			</div>
			</div>
			<div class="form-group row">
				<label for="address2${list.userid}" class="col-md-3 col-form-label">상세주소</label>
	    		<div class="col-md-6">
					<input name="address2" id="address2${list.userid}" class="form-control" autocomplete="off" placeholder="상세 주소를 입력하세요."  value="${list.address2 }">
	  			</div>
			</div>
			<div class="form-group row">
				<label for="class_name${list.userid}" class="col-md-3 col-form-label">강의과목</label>
				<div class="col-md-6">
					<select class="form-control mr-sm-2" name="class_name">
				  	<c:choose>
					  <c:when test="${list.class_name == '정보처리기사필기'}">
					    <option value="-">미수강</option>
					  	<option selected value="정보처리기사필기">정보처리기사필기</option>
					  	<option value="정보처리기사실기">정보처리기사실기</option>
					  	<option value="웹프로그래밍초급">웹프로그래밍초급</option>
					  	<option value="웹프로그래밍고급">웹프로그래밍고급</option>
					  </c:when>	
					  <c:when test="${list.class_name == '정보처리기사실기'}">
					    <option value="-">미수강</option>
					  	<option value="정보처리기사실기">정보처리기사실기</option>
					  	<option selected value="정보처리기사실기">정보처리기사실기</option>
					  	<option value="웹프로그래밍초급">웹프로그래밍초급</option>
					  	<option value="웹프로그래밍고급">웹프로그래밍고급</option>
					  </c:when>
					  <c:when test="${list.class_name == '웹프로그래밍초급'}">
					    <option value="-">미수강</option>
					  	<option value="정보처리기사실기">정보처리기사실기</option>
					  	<option value="정보처리기사실기">정보처리기사실기</option>
					  	<option selected value="웹프로그래밍초급">웹프로그래밍초급</option>
					  	<option value="웹프로그래밍고급">웹프로그래밍고급</option>
					  </c:when>
					  <c:when test="${list.class_name == '웹프로그래밍고급'}">
					    <option value="-">미수강</option>
					  	<option value="정보처리기사실기">정보처리기사실기</option>
					  	<option value="정보처리기사실기">정보처리기사실기</option>
					  	<option value="웹프로그래밍초급">웹프로그래밍초급</option>
					  	<option selected value="웹프로그래밍고급">웹프로그래밍고급</option>
					  </c:when>
					  <c:otherwise>
					    <option selected value="-">미수강</option>
					  	<option value="정보처리기사필기">정보처리기사필기</option>
					  	<option value="정보처리기사실기">정보처리기사실기</option>
					  	<option value="웹프로그래밍초급">웹프로그래밍초급</option>
					  	<option value="웹프로그래밍고급">웹프로그래밍고급</option>
					  </c:otherwise>
				  	</c:choose>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 col-form-label">가입일</label>
	    		<div class="col-md-6">
					<fmt:formatDate value="${list.joindate }" pattern="yyyy-MM-dd HH:mm:ss E"/>
	  			</div>
			</div>
			<div class="form-group row">
				<label class="col-md-3 col-form-label">최종 로그인</label>
	    		<div class="col-md-6">
					<fmt:formatDate value="${list.lastlogin }" pattern="yyyy-MM-dd HH:mm:ss E"/>
	  			</div>
			</div>

      </div>
      <div class="modal-footer">
      	<input type="submit" value="강사 정보 수정" class="btn btn-primary">
      	<a href="${path}/user/deleteteacher.admin?userid=${list.userid}" class="btn btn-danger">강사삭제</a>
        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

	</div>
  </div>
</div>
		</form>
</c:forEach>

<!-- 강사생성 만들기 -->
<form action="${path }/user/admin/insertteacher.do" method="post">
<div class="container-fluid">
  <div class="row justify-content-center">
	<div class="col col-10">
<div class="modal fade" id="teacherinsert" tabindex="-1" role="dialog" aria-labelledby="teacherinsertLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="teacherinsertLabel">상세정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	
	  	<div class="form-group row">
    		<label for="userid" class="col-md-4 col-form-label">ID</label>
    		<div class="col-md-8">
      			<input class="form-control" id="userid" name="userid" placeholder="ID">
    		</div>
  		</div>
  		
  		<div class="form-group row">
    		<label for="pwd" class="col-md-4 col-form-label">Password</label>
    		<div class="col-md-8">
      			<input type="text" class="form-control" id="pwd" name="pwd" placeholder="Password" autocomplete="off">
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
      			<input type="email" class="form-control" id="email" name="email" placeholder="Email">
    		</div>
  		</div>
  		
  		<div class="form-group row">
    		<label for="tel" class="col-md-4 col-form-label">전화번호</label>
    		<div class="col-md-8">
      			<input type="tel" class="form-control" id="tel" name="tel" placeholder="010-1234-5678" autocomplete="off">
    		</div>
  		</div>
  		
  		<div class="form-group row">
			<label for="zipcode" class="col-md-4 col-form-label">우편번호</label>
			 	<div class="col-md-8">
  					<input name="zipcode" id="zipcode" class="form-control" autocomplete="off" placeholder="우편번호를 입력하세요.">
				</div>
		</div>
		<div class="form-group row">
			<label for="address1" class="col-md-4 col-form-label">주소</label>
    		<div class="col-md-8">
  				<input name="address1" id="address1" class="form-control" placeholder="주소를 입력하세요.">
  			</div>
		</div>
		<div class="form-group row">
			<label for="address2" class="col-md-4 col-form-label">상세주소</label>
    		<div class="col-md-8">
				<input name="address2" id="address2" class="form-control" autocomplete="off" placeholder="상세 주소를 입력하세요.">
  			</div>
		</div>
		<div class="form-group row">
    		<label for="class_name" class="col-md-4 col-form-label">강의과목</label>
    		<div class="col-md-8">
      		<select class="form-control" name="class_name" id="class_name">
			  <option selected value="정보처리기사필기">정보처리기사필기</option>
			  <option value="정보처리기사실기">정보처리기사실기</option>
			  <option value="웹프로그래밍초급">웹프로그래밍초급</option>
			  <option value="웹프로그래밍고급">웹프로그래밍고급</option>
			</select>
    		</div>
  		</div>
      </div>
      <div class="modal-footer">
      	<input type="submit" value="강사 계정 생성" class="btn btn-primary">
        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

	</div>
  </div>
</div>
</form>

</body>
</html>