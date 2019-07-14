<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
	
	$("#dowrite").click(function(){
		
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
		
		document.writeform.submit();
	});
	
});

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col col-10">
<br>
<form action="${path}/board/boardwrite.do" method="post" id="writeform" name="writeform">
<table class="table table-borderless" style="width: 100%;">
	<tr class="table-primary">
		<th colspan="2"><h2>글쓰기</h2></th>
	</tr>
	<tr class="table-primary">
		<th><label for="b_writer">작성자</label></th>
		<td><input type="text" name="b_writer" id="b_writer" class="form-control" value="${user.userid }" readonly="readonly"></td>
	</tr>
	<tr class="table-primary">
		<th><label for="b_category">분류</label></th>
		<td>
			<select class="form-control" name="b_category" id="b_category">
			  <option selected value="정보처리기사필기">정보처리기사필기</option>
			  <option value="정보처리기사실기">정보처리기사실기</option>
			  <option value="웹프로그래밍초급">웹프로그래밍초급</option>
			  <option value="웹프로그래밍고급">웹프로그래밍고급</option>
			</select>
		</td>
	</tr>
	<tr class="table-primary">
		<th><label for="b_subject">제목</label></th>
		<td><input type="text" name="b_subject" id="b_subject" class="form-control" placeholder="제목을 입력하세요."></td>
	</tr>
	<tr class="table-primary">
		<th><label for="b_point">강의 평점</label></th>
		<td>
			<select class="form-control" name="b_point" id="b_point">
			  <option selected value="5">★★★★★</option>
			  <option value="4">★★★★☆</option>
			  <option value="3">★★★☆☆</option>
			  <option value="2">★★☆☆☆</option>
			  <option value="1">★☆☆☆☆</option>
			</select>
		</td>
	</tr>
	<tr class="table-primary">
		<th colspan="2"><label for="b_content">본문</label></th>
	</tr>
	<tr class="table-primary">
		<td colspan="2"><textarea name="b_content" id="b_content" class="form-control"></textarea></td>
	</tr>
	<tr class="table-primary">
		<td colspan="2">
	 		<div class="custom-control custom-switch">
   				<input type="checkbox" id="b_secret" name="b_secret" value="Y" class="custom-control-input">
      			<label class="custom-control-label" for="b_secret">&nbsp;비밀글</label>
	    	</div>
		</td>
	</tr>
	<tr class="table-primary">
		<td colspan="2">
			<input type="button" value="글쓰기" class="btn btn-block btn-primary" id="dowrite">
		</td>
	</tr>
</table>
</form>

		</div>
	</div>
</div>

</body>
</html>