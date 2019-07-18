<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생관리</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	var keyword = '${keyword}';
	var align = '${align}';
	
	$("#all-tab").click(function(){
		
		$("#userlist").attr("aria-labelledby", "all-tab");
		$('#all-tab a[href="#userlist"]').tab('show');
		
		list('1', '', '');
	});
	
});
function list(page, keyword, align){
	location.href="${path}/user/teacher/studentslist.go?curPage="+page+"&keyword="+encodeURIComponent(keyword)+"&align="+encodeURIComponent(align);
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-10">
<br>
<h2>수강생관리</h2>
<br>
<div class="row">
<div class="col col-8">
	
<ul class="nav nav-phils" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link" id="all-tab" data-toggle="tab" href="#userlist" role="tab" aria-controls="userlist" aria-selected="true">${user.class_name} </a>
  </li>
</ul>
</div>

<div class="col col-4 justify-content-end">

<form class="form-inline my-2" method="post" action="${path }/user/teacher/studentslist.go">
    <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="수강생 검색" aria-label="Search">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i>&nbsp;검색</button>
</form>
	
</div>
</div>

<hr><br>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="userlist" role="tabpanel" aria-labelledby="all-tab">
  
<table class="table table-bordered" style="text-align: center;">
<caption style="text-align: right; caption-side: top;"><strong>${usercount }</strong>&nbsp;명의 수강생이 있습니다.</caption>
<thead>
	<tr class="table-primary" style="width: 1000px;">
		<th scope="col">
			아이디
			<button type="button" class="btn btn-light btn-sm" onclick="list('1', '${keyword}', 'useridasc' )"><i class="fa fa-caret-up"></i></button>
			<button type="button" class="btn btn-light btn-sm" onclick="list('1', '${keyword}', 'useriddesc' )"><i class="fa fa-caret-down"></i></button>
		</th>
		<th scope="col">
			이름
			<button type="button" class="btn btn-light btn-sm" onclick="list('1', '${keyword}', 'nameasc' )"><i class="fa fa-caret-up"></i></button>
			<button type="button" class="btn btn-light btn-sm" onclick="list('1', '${keyword}', 'namedesc' )"><i class="fa fa-caret-down"></i></button>
		</th>
		<th scope="col">전화번호</th>
		<th scope="col">이메일</th>
		<th scope="col">강좌명</th>
		<th scope="col">상세정보</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="list" items="${userslist }">
		<tr>
			<td>${list.userid }</td>
			<td>${list.name }</td>
			<td>${list.tel }</td>
			<td>${list.email }</td>
			<td>${list.class_name }</td>
			<td>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#userinfo${list.userid}">
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
      <a class="page-link" href="#" aria-label="Previous" onclick="list('1', '${keyword }', '${align}')">
        <span aria-hidden="true">&laquo;</span><!-- 처음 -->
      </a>
    </li>
</c:if>
<c:if test="${pager.curBlock > 1}">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous" onclick="list('${pager.prevPage}', '${keyword }', '${align}')">
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
      		<a class="page-link" href="#" onclick="list('${num}', '${keyword }', '${align}')">${num }</a>
    	</li>
		</c:otherwise>
	</c:choose>
	</c:forEach>
<c:if test="${pager.curBlock < pager.totBlock}">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next" onclick="list('${pager.nextPage}', '${keyword }', '${align}')">
        <span aria-hidden="true">&gt;</span><!-- 다음 -->
      </a>
    </li>
</c:if>
    
<c:if test="${pager.curPage < pager.totPage}">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next" onclick="list('${pager.totPage}', '${keyword }', '${align}')">
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
</div>

<!-- 상세정보 모달 -->
<c:forEach var="list" items="${userslist }">

<div class="container-fluid">
  <div class="row justify-content-center">
	<div class="col col-10">
<div class="modal fade" id="userinfo${list.userid}" tabindex="-1" role="dialog" aria-labelledby="userinfoLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="userinfoLabel">상세정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  <table class="table" style="width: 100%; text-align: left;">
	<tr class="table-success">
		<th>
    		<label>ID</label>
		</th>
		<td>
   			${list.userid }
		</td>
	</tr>
	<tr class="table-success">	  		
	  	<th>
    		<label>이름</label>
		</th>
		<td>
   			${list.name }
		</td>
	</tr>
	<tr class="table-success">
		<th>
    		<label>전화번호</label>
		</th>
		<td>
   			${list.tel }
		</td>
	</tr>
	<tr class="table-success">
		<th>
    		<label>이메일</label>
		</th>
		<td>
   			${list.email }
		</td>
	</tr>
	<tr class="table-success">
		<th>
    		<label>강좌명</label>
		</th>
		<td>
   			${list.class_name }
		</td>
	</tr>
	<tr class="table-success">
		<th>
    		<label>우편번호</label>
		</th>
		<td>
   			${list.zipcode }
		</td>
	</tr>
	<tr class="table-success">
		<th>
    		<label>주소</label>
		</th>
		<td>
   			${list.address1 }
		</td>
	</tr>
	<tr class="table-success">
		<th>
    		<label>상세주소</label>
		</th>
		<td>
   			${list.address2 }
		</td>
	</tr>
	<tr class="table-success">
		<th>
    		<label>가입일</label>
		</th>
		<td>
   			<fmt:formatDate value="${user.joindate }" pattern="yyyy-MM-dd HH:mm:ss E"/>
		</td>
	</tr>
	<tr class="table-success">
		<th>
    		<label>최종 로그인</label>
		</th>
		<td>
   			<fmt:formatDate value="${user.lastlogin }" pattern="yyyy-MM-dd HH:mm:ss E"/>
		</td>
	</tr>
  </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

	</div>
  </div>
</div>
</c:forEach>


</body>
</html>