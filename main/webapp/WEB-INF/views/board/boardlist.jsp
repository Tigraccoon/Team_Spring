<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 후기</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function list(page, keyword){
	location.href="${path}/board/boardlist.do?curPage="+page+"&keyword="+encodeURIComponent(keyword);
} 
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-10">
<br>
<h2>강의 후기</h2>
<br>
<form class="form-inline my-4 offset-md-9" method="post" action="${path }/board/boardlist.do">
      <input class="form-control mr-sm-4" name="keyword" type="search" placeholder="게시물 검색" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i>&nbsp;검색</button>
</form>
<br>

<table class="table table-bordered" style="text-align: center;">
<caption style="text-align: right;"><strong>${map.count }</strong>&nbsp;개의 글이 있습니다.</caption>
<thead>
	<tr class="table-primary" style="width: 1000px;">
		<th scope="col">번호</th>
		<th scope="col">작성자</th>
		<th scope="col" width="50%">제목</th>
		<th scope="col">조회수</th>
		<th scope="col">날짜</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="list" items="${map.b_list }">
	<!-- 일반글 -->
		<c:if test="${list.b_show == 'Y' && list.b_secret == 'N'}">
		<tr>
			<th scope="row">${list.b_num }</th>
			<td>${list.b_writer }</td>
			<td style="text-align: left;">
				<a href="${path }/board/view.do?b_num=${list.b_num}">${list.b_subject } 
					<c:if test="${list.c_count > 0 }">
						<label style="color: black">(${list.c_count })</label>
					</c:if>
				</a>
			</td>
			<td>${list.b_readcount }</td>
			<td><fmt:formatDate value="${list.b_date }" pattern="yyyy-MM-dd hh:mm:ss E"/></td>
		</tr>
		</c:if>
	<!-- 비밀글 -->
		<c:if test="${list.b_show == 'Y' && list.b_secret == 'Y'}">
			<c:if test="${user.userid == list.b_writer }">
			<tr>
				<th scope="row">${list.b_num }</th>
				<td>${list.b_writer }</td>
				<td style="text-align: left;">
					<a href="${path }/board/view.do?b_num=${list.b_num}">
					<i class="fa fa-lock"></i>&nbsp;${list.b_subject } 
						<c:if test="${list.c_count > 0 }">
							<label style="color: black">(${list.c_count })</label>
						</c:if>
					</a>
				</td>
				<td>${list.b_readcount }</td>
				<td><fmt:formatDate value="${list.b_date }" pattern="yyyy-MM-dd hh:mm:ss E"/></td>
			</tr>
			</c:if>
			<c:if test="${user.userid != list.writer }">
			<tr>
				<th>${list.b_num }</th>
				<td>${list.b_writer }</td>
				<td colspan="5"><i class="fa fa-lock"></i>&nbsp;비밀 게시물입니다.</td>
			</tr>
			</c:if>
		</c:if>
		
	</c:forEach>
</tbody>
</table>


<!-- 페이지 -->
<br><br>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
<c:if test="${map.pager.curBlock > 1 }">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous" onclick="list('1', '${map.keyword}')">
        <span aria-hidden="true">&laquo;</span><!-- 처음 -->
      </a>
    </li>
</c:if>
<c:if test="${map.pager.curBlock > 1}">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous" onclick="list('${map.pager.prevPage}', '${map.keyword}')">
        <span aria-hidden="true">&lt;</span><!-- 이전 -->
      </a>
    </li>
</c:if>
<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
	<c:choose>
		<c:when test="${num == map.pager.curPage}"><!-- 현재 패이지 -->
			<li class="page-item active" aria-current="page">
				<span class="page-link">${num }<span class="sr-only">(current)</span></span>
			</li>
		</c:when>
		<c:otherwise>
		<li class="page-item"><!-- 페이지들 -->
      		<a class="page-link" href="#" onclick="list('${num}', '${map.keyword}')">${num }</a>
    	</li>
		</c:otherwise>
	</c:choose>
	</c:forEach>
<c:if test="${map.pager.curBlock < map.pager.totBlock}">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next" onclick="list('${map.pager.nextPage}', '${map.keyword}')">
        <span aria-hidden="true">&gt;</span><!-- 다음 -->
      </a>
    </li>
</c:if>
    
<c:if test="${map.pager.curPage < map.pager.totPage}">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next" onclick="list('${map.pager.totPage}', '${map.keyword}')">
        <span aria-hidden="true">&raquo;</span><!-- 끝 -->
      </a>
    </li>
</c:if>
  </ul>
</nav>
<br>

<button id="btnWrite" class="btn btn-block btn-primary">글쓰기</button><br>

<br><br><br>
			
		</div>
	</div>
</div>

</body>
</html>