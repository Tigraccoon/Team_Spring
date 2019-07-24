<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	$('#description').summernote({
		placeholder: '본문을 입력하세요.',
		width: 400,
		height : 300, 
	    minHeight : null,
	    maxHeight : null,
		lang : 'ko-KR'
	});
});
</script>
    
<style type="text/css">
table{margin-left: auto; margin-right: auto;}
h2{text-align: center; padding-top: 30px;}
body{background-image: url("${path}/img/cute.png"); background-repeat: no-repeat;}
.img_e{text-align: center; padding-top: 30px;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<script>
		function subject_delete(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="${path}/subject/delete.do";
				document.form1.submit();
			}
		}
	
	
		function subject_update() {

			var subject_name = $("#subject_name").val();
			var prof_name=$("#prof_name").val();
			var price = $("#price").val();
			var p_num = $("#p_num").val();
			var subject_date=$("#subject_date").val();
			var description = $("#description").val();
			
			if (subject_name == "") { //빈값이면
				alert("강의명을 입력하세요");
				$("#subject_name").focus(); 
				return; 
			}
			if(prof_name==""){
				alert("강사명을 입력하세요"); 
				$("#prof_name").focus();
				return; 
			}
			if (price == "") {
				alert("가격을 입력하세요");
				$("#price").focus();
				return;
			}
			if(subject_date==""){ //빈값이면
				alert("강의기간을 입력하세요"); 
				$("#subject_date").focus();
				return;
			}
			if (description == "") {
				alert("상품 설명을 입력하세요");
				$("#description").focus();
				return;
			}
			//폼 데이터를 받을 주소
			document.form1.action = "${path}/subject/update.do";
			//폼 데이터를 서버에 전송
			document.form1.submit();
		}
	</script>
	
<div class="img_e">
<img src="${path }/img/modified.jpg">
</div>
	<p>
	<form name="form1" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td >강의명</td>
				<td ><input name="subject_name" id="subject_name"
						value="${dto.subject_name}"></td>
			</tr>
			<tr>
				<td>강사명</td>
				<td ><input name="prof_name" id="prof_name"
						value="${dto.prof_name}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td ><input name="price" id="price" value="${dto.price}"></td>
			</tr>
			<tr>
				<td>강의기간</td>
				<td ><input name="subject_date" id="subject_date"
						value="${dto.subject_date}"></td>
			</tr>
			<tr>
				<td>수강인원</td>
				<td ><input name="p_num" id="p_num"
						value="${dto.p_num}"></td>
			</tr>
			<tr>
				<td>강의설명</td>
				<td class="content"><textarea name="description"
						id="description">${dto.description}</textarea></td>
			</tr>
			<tr>
				<td>강의이미지</td>
				<td ><img src="${path}/img/${dto.img_url}" width="300px;"
						height="auto;"> <br> <input type="file" name="file1"
						id="file1"></td>
			</tr>
			<tr>
			<td></td>
			<td><div id="viewImg"><img src="" /></div></td>
			
			<script>
			$("#file1").change(function(){
				if(this.files && this.files[0]){
					var reader = new FileReader;
					reader.onload = function(data){
						$("#viewImg img").attr("src", data.target.result).width(500);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
			</script>
			
			</tr>
			<tr>
				<td colspan="2" align="center">
					<!-- 수정,삭제에 필요한 상품코드값을 hidden 태그로 넘김 --> 
					<%-- <input type="hidden"
						name="subject_name" value="${dto.subject_name}">  --%>
						<input type="button" class="btn btn-primary btn-lg" value="수정" onclick="subject_update()"> 
						<input type="button" class="btn btn-primary btn-lg" value="삭제" onclick="subject_delete()"> 
						<input type="button" class="btn btn-primary btn-lg" value="목록"
						onclick="location.href='${path}/subject/list.do'">
				</td>
			</tr>
		</table>
	</form>

<div style="margin-top: 160px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>