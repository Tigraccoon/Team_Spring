<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 후기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<%@ include file="../include/header.jsp" %>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    <script src="${path }/include/summernote/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#b_content').summernote({
		placeholder: '본문을 입력하세요.',
		height : 500, 
	    minHeight : null,
	    maxHeight : null,
		lang : 'ko-KR'
	});
	
	$("#btnUpdate").click(function(){
		
		var b_subject = $("#b_subject");
		var b_content = $("#b_content");

		if(b_subject.val() == ""){	
			alert("제목을 입력해주세요!");
			b_subject.focus();	
			return;
		}
		if(b_content.val() == ""){	
			alert("내용을 입력해주세요!");
			b_content.focus();	
			return;
		}
		
		document.updateform.action="${path}/board/boardupdate.do";
		document.updateform.submit();
	});
	
	$("#btnDelete").click(function(){
		
		if(confirm("정말 삭제하시겠습니까?")==true){
			
			document.updateform.action="${path}/board/boarddelete.do";
			document.updateform.submit();
		} else{
			return;
		}
	});
	
	
});

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<!-- 글보기 -->
<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-10">
<table class="table table-bordered"  style="width: 100%;">
	<tr class="table-primary" style="text-align: center;">
		<td width="25%">${var.b_num }</td>	
		<td width="50%">${var.b_subject }</td>
		<td width="25%">${var.b_writer }</td>
	</tr>
	<tr class="table-primary" style="text-align: center;">
		<td width="25%">조회수&nbsp;&nbsp;${var.b_readcount }</td>
		<td width="50%">
		강의 평점&nbsp;&nbsp;
			<c:choose>
				<c:when test="${var.b_point == 5 }"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></c:when>
				<c:when test="${var.b_point == 4 }"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i></c:when>
				<c:when test="${var.b_point == 3 }"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></c:when>
				<c:when test="${var.b_point == 2 }"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></c:when>
				<c:otherwise><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></c:otherwise>
			</c:choose>
		</td>
		<td width="25%"><fmt:formatDate value="${var.b_date }" pattern="yyyy-MM-dd hh:mm:ss E"/></td>
	</tr>
	<tr class="table-primary">
		<td colspan="3" height="500%">${var.b_content }</td>
	</tr>
	<tr class="table-primary" style="text-align: center;">
		<td colspan="3">
<c:if test="${user.userid == var.b_writer }">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#boardupdate">
  				수정
			</button>
</c:if>	
			<a href="${path }/board/boardlist.do" class="btn btn-info">리스트</a>
		</td>
	</tr>
</table>


<!-- 댓글쓰기 -->
<br><hr><br>
<form action="${path }/board/c_insert.do" method="post" id="commentInsertform" name="commentInsertform">
	<table class="table" style="width: 100%; text-align: left;">
		<tr class="table-success">
			<th colspan="2">댓글쓰기</th>
		</tr>
		<tr class="table-success">
			<td width="80%">
				<input name="c_writer" id="c_writer" value="${user.userid }" readonly="readonly" class="form-control">
				<br>
				<textarea rows="3" cols="80" placeholder="댓글을 입력하세요" id="c_content" class="form-control" name="c_content"></textarea>
			</td>
			<th style="text-align: center;">
			<br>
				<div class="custom-control custom-switch">
	   				<input type="checkbox" id="c_secret" name="c_secret" value="Y" class="custom-control-input">
      				<label class="custom-control-label" for="c_secret">&nbsp;비밀댓글</label>
	    		</div>
	    		<br>
				<input type="hidden" name="b_num" id="b_num" value="${var.b_num }">
				<input type="submit" id="btnCommentInsert" class="btn btn-block btn-primary" value="확인">
			</th>
		</tr>
	</table>
</form>
<br><hr><br>

<!-- 댓글 리스트 -->

<table class="table" style="width: 100%; text-align: left;">
	<tr class="table-primary">
		<th>댓글</th>
	</tr>
	
<!-- 댓글이 없을때 -->
<c:if test="${c_count == 0 }">
	<tr class="table-primary">
		<th>댓글이 없습니다.</th>
	</tr>
</c:if>
	
<!-- 댓글이 있을때 -->
<c:if test="${c_count > 0}">
	
<c:forEach items="${war }" var="war">
<!-- 일반 댓글 -->
 <c:if test="${war.c_show == 'Y' && war.c_secret == 'N' }">
 <tr class="table-primary">
		<td>
			<b>${war.c_writer }</b>&emsp;&emsp;&emsp;
			<i>(<fmt:formatDate value="${war.c_date }" pattern="yyyy-MM-dd hh:mm:ss E"/>)</i>
			<c:if test="${user.userid == war.c_writer }">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#commentupdate${war.c_num}" style="text-align: right;">
	  				댓글 수정
				</button>
			</c:if>	
			<br>
			${war.c_content }
		</td>
	</tr>
 </c:if>
 <!-- 비밀 댓글 -->
 <c:if test="${war.c_show == 'Y' && war.c_secret == 'Y' }">
	<tr class="table-primary">
		<td>
			<b>${war.c_writer }</b>&emsp;&emsp;&emsp;
			<i>(<fmt:formatDate value="${war.c_date }" pattern="yyyy-MM-dd hh:mm:ss E"/>)</i>
			<c:if test="${user.userid == war.c_writer }">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#commentupdate${war.c_num}" style="text-align: right;">
	  				댓글 수정
				</button>
			</c:if>	
			<br>
			<c:if test="${user.userid == war.c_writer || user.userid == var.b_writer}">
				<i class="fa fa-lock"></i>&nbsp;${war.c_content }
			</c:if>
			<c:if test="${user.userid != war.c_writer && user.userid != var.b_writer}">
				<i class="fa fa-lock"></i>&nbsp;비밀 댓글입니다.
			</c:if>
		</td>
	</tr>

<!-- 댓글수정모달 원위치 -->

</c:if>
</c:forEach>
</c:if>
</table>

		</div>
	</div>
</div>

<!-- 댓글 수정 모달 -->

<c:forEach items="${war }" var="mo">

<form action="${path}/board/c_update.do" method="post" id="commentupdateform" name="commentupdateform">
<div class="container-fluid">
  <div class="row justify-content-center">
	<div class="col col-10">
<div class="modal fade" id="commentupdate${mo.c_num}" tabindex="-1" role="dialog" aria-labelledby="commentupdateLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="commentupdateLabel">댓글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  <table class="table" style="width: 100%; text-align: left;">
	<tr class="table-success">
		<td width="100%">
			<input name="c_writer" id="c_writer${mo.c_num}" value="${user.userid }" readonly="readonly" class="form-control">
			<br>
			<textarea rows="3" cols="80" placeholder="댓글을 입력하세요" id="c_content${mo.c_num}" class="form-control" name="c_content">${mo.c_content}</textarea>
			<input type="hidden" name="c_num" id="c_num${mo.c_num}" value="${mo.c_num }">
      		<input type="hidden" name="b_num" id="b_num${mo.c_num}" value="${var.b_num }">
		</td>
	</tr>
  </table>
      </div>
      <div class="modal-footer">
      <div class="custom-control custom-switch">
	 		 <c:choose>
	 		  <c:when test="${mo.c_secret == 'Y' }">
	 		 	<input type="checkbox" checked="checked" id="c_secret${mo.c_num}" name="c_secret" value="Y" class="custom-control-input">
	 		  </c:when>
	 		  <c:otherwise>
   				<input type="checkbox" id="c_secret${mo.c_num}" name="c_secret" value="Y" class="custom-control-input">
	 		  </c:otherwise>
	 		 </c:choose>
      			<label class="custom-control-label" for="c_secret${mo.c_num}">&nbsp;비밀글</label>
	    	</div>
      	<input type="submit" id="btnCommentUpdate${mo.c_num}" value="수정" class="btn btn-primary">
      	<a href="${path}/board/c_delete.do?c_num=${mo.c_num}&b_num=${mo.b_num}" class="btn btn-danger"> 삭제</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

	</div>
  </div>
</div>
</form>
</c:forEach>


<!-- 글 수정 모달 -->
<div class="container-fluid">
<div class="row justify-content-center">
		<div class="col col-10">
<form action="" method="post" id="updateform" name="updateform">
<div class="modal fade bd-example-modal-xl" id="boardupdate" tabindex="-1" role="dialog" aria-labelledby="boardupdateLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="boardupdateLabel">글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<table class="table table-borderless" style="width: 100%;">
	<tr class="table-primary" style="text-align: center;">
		<th colspan="2"><h2>글쓰기</h2></th>
	</tr>
	<tr class="table-primary" style="text-align: center;">
		<th><label for="b_writer">작성자</label></th>
		<td><input type="text" name="b_writer" id="b_writer" class="form-control" value="${var.b_writer }" readonly="readonly"></td>
	</tr>
	<tr class="table-primary" style="text-align: center;">
		<th><label for="b_category">분류</label></th>
		<td>
			<select class="form-control" name="b_category" id="b_category">
			 <c:choose>
			  <c:when test="${var.b_category == '정보처리기사필기'}">
			  	<option selected value="정보처리기사필기">정보처리기사필기</option>
			  	<option value="정보처리기사실기">정보처리기사실기</option>
			  	<option value="웹프로그래밍초급">웹프로그래밍초급</option>
			  	<option value="웹프로그래밍고급">웹프로그래밍고급</option>
			  </c:when>	
			  <c:when test="${var.b_category == '정보처리기사실기'}">
			  	<option value="정보처리기사실기">정보처리기사실기</option>
			  	<option selected value="정보처리기사실기">정보처리기사실기</option>
			  	<option value="웹프로그래밍초급">웹프로그래밍초급</option>
			  	<option value="웹프로그래밍고급">웹프로그래밍고급</option>
			  </c:when>
			  <c:when test="${var.b_category == '웹프로그래밍초급'}">
			  	<option value="정보처리기사실기">정보처리기사실기</option>
			  	<option value="정보처리기사실기">정보처리기사실기</option>
			  	<option selected value="웹프로그래밍초급">웹프로그래밍초급</option>
			  	<option value="웹프로그래밍고급">웹프로그래밍고급</option>
			  </c:when>
			  <c:when test="${var.b_category == '웹프로그래밍고급'}">
			  	<option value="정보처리기사실기">정보처리기사실기</option>
			  	<option value="정보처리기사실기">정보처리기사실기</option>
			  	<option value="웹프로그래밍초급">웹프로그래밍초급</option>
			  	<option selected value="웹프로그래밍고급">웹프로그래밍고급</option>
			  </c:when>
			  <c:otherwise>
			  	<option selected value="정보처리기사필기">정보처리기사필기</option>
			  	<option value="정보처리기사실기">정보처리기사실기</option>
			  	<option value="웹프로그래밍초급">웹프로그래밍초급</option>
			  	<option value="웹프로그래밍고급">웹프로그래밍고급</option>
			  </c:otherwise>
			 </c:choose>
			</select>
		</td>
	</tr>
	<tr class="table-primary" style="text-align: center;">
		<th><label for="b_subject">제목</label></th>
		<td><input type="text" name="b_subject" id="b_subject" class="form-control" placeholder="제목을 입력하세요." value="${var.b_subject }"></td>
	</tr>
	<tr class="table-primary" style="text-align: center;">
		<th><label for="b_point">강의 평점</label></th>
		<td>
			<select class="form-control" name="b_point" id="b_point">
			 <c:choose>
			  <c:when test="${var.b_point == 5 }">
			  	<option selected value="5">★★★★★</option>
			  	<option value="4">★★★★☆</option>
			  	<option value="3">★★★☆☆</option>
			  	<option value="2">★★☆☆☆</option>
			  	<option value="1">★☆☆☆☆</option>
			  </c:when>
			  <c:when test="${var.b_point == 4 }">
			  	<option value="5">★★★★★</option>
			  	<option selected value="4">★★★★☆</option>
			  	<option value="3">★★★☆☆</option>
			  	<option value="2">★★☆☆☆</option>
			  	<option value="1">★☆☆☆☆</option>
			  </c:when>
			  <c:when test="${var.b_point == 3 }">
			  	<option value="5">★★★★★</option>
			  	<option value="4">★★★★☆</option>
			  	<option selected value="3">★★★☆☆</option>
			  	<option value="2">★★☆☆☆</option>
			  	<option value="1">★☆☆☆☆</option>
			  </c:when>
			  <c:when test="${var.b_point == 2 }">
			  	<option value="5">★★★★★</option>
			  	<option value="4">★★★★☆</option>
			  	<option value="3">★★★☆☆</option>
			  	<option selected value="2">★★☆☆☆</option>
			  	<option value="1">★☆☆☆☆</option>
			  </c:when>
			  <c:when test="${var.b_point == 1 }">
			  	<option value="5">★★★★★</option>
			  	<option value="4">★★★★☆</option>
			  	<option value="3">★★★☆☆</option>
			  	<option value="2">★★☆☆☆</option>
			  	<option selected value="1">★☆☆☆☆</option>
			  </c:when>
			  <c:otherwise>
			  	<option selected value="5">★★★★★</option>
				<option value="4">★★★★☆</option>
				<option value="3">★★★☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="1">★☆☆☆☆</option>
			  </c:otherwise>
			 </c:choose>
			</select>
		</td>
	</tr>
	<tr class="table-primary" style="text-align: center;">
		<th colspan="2"><label for="b_content">본문</label></th>
	</tr>
	<tr class="table-primary">
		<td colspan="2"><textarea name="b_content" id="b_content" class="form-control">${var.b_content }</textarea></td>
	</tr>
	<tr class="table-primary" style="text-align: center;">
		<td colspan="2">
	 		<div class="custom-control custom-switch">
	 		 <c:choose>
	 		  <c:when test="${var.b_secret == 'Y' }">
	 		 	<input type="checkbox" checked="checked" id="b_secret" name="b_secret" value="Y" class="custom-control-input">
	 		  </c:when>
	 		  <c:otherwise>
   				<input type="checkbox" id="b_secret" name="b_secret" value="Y" class="custom-control-input">
	 		  </c:otherwise>
	 		 </c:choose>
      			<label class="custom-control-label" for="b_secret">&nbsp;비밀글</label>
	    	</div>
		</td>
	</tr>
</table>

      </div>
      <div class="modal-footer">
      	<input type="hidden" name="b_num" id="b_num" value="${var.b_num }">
      	<input type="button" id="btnUpdate" value="수정" class="btn btn-primary">
		<input type="button" id="btnDelete" value="삭제" class="btn btn-danger">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</form>
	</div>
</div>
</div>

</body>
</html>