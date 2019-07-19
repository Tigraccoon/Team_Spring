<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
table{margin-left: auto; margin-right: auto;}
h2{text-align: center;}
.img_e{text-align: center; padding-top: 30px;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<script>
function subject_write(){
	// 태그를 name으로 조회할 경우(계층구조로 접근)
	//var subject_name=document.form1.subject_name.value;
	// 태그를 id로 조회할 경우
	var subject_name=$("#subject_name").val();
	var prof_name=$("#prof_name").val();
	var price=$("#price").val();
	var p_num=$("#p_num").val();
	var subject_date=$("#subject_date").val();
	var description=$("#description").val();
	if(subject_name==""){ //빈값이면
		//문자열 비교 : java는 a.equal(b), javascript는 a==b
		alert("강의명을 입력하세요"); 
		$("#subject_name").focus(); //입력포커스 이동
		return; //리턴값없이 함수 종료, 폼 데이터를 제출하지 않음
	}
	if(prof_name==""){ //빈값이면
		alert("강사명을 입력하세요"); 
		$("#prof_name").focus(); //입력포커스 이동
		return; //리턴값없이 함수 종료, 폼 데이터를 제출하지 않음
	}
	if(price==""){
		alert("가격을 입력하세요");
		$("#price").focus();
		return;
	}
	
	if(p_num==""){
		alert("수강인원을 입력하세요");
		$("#p_num").focus();
		return;
	}
	
	if(subject_date==""){ //빈값이면
		alert("강의기간을 입력하세요"); 
		$("#subject_date").focus(); //입력포커스 이동
		return; //리턴값없이 함수 종료, 폼 데이터를 제출하지 않음
	}
	
/* 	if(description==""){
		alert("상품 설명을 입력하세요");
		$("#description").focus();
		return;
	} */
	//폼 데이터를 받을 주소
	document.form1.action="${path}/subject/insert.do";
	//폼 데이터를 서버에 전송
	document.form1.submit();
}

</script>
<div class="img_e">
<img src="${path }/img/enrol.jpg" style="width: 270px; height: auto;">
</div>
<p>
<form name="form1" method="post"
	enctype="multipart/form-data">
<table>
	<tr>
		<td>강의명</td>
		<td><input name="subject_name" id="subject_name"></td>
	</tr>
	<tr>
		<td>강사명</td>
		<td><input name="prof_name" id="prof_name"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input name="price" id="price"></td>
	</tr>
	<tr>
		<td>강의기간</td>
		<td><input name="subject_date" id="subject_date"></td>
	</tr>
	<tr>
		<td>수강인원</td>
		<td><input name="p_num" id="p_num"></td>
	</tr>
	<tr>
		<td>강의설명</td>
		<td><textarea rows="5" cols="60" 
			name="description" id="description"></textarea>
		</td>
	</tr>
	
	<tr>
		<td>강의이미지</td>
		<td>
			<input type="file" name="file1" id="file1"> 
		</td>
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
			<input type="button" value="등록" 
				onclick="subject_write()">
			<input type="button" value="목록"
onclick="location.href='${path}/subject/list.do'">
		</td>
	</tr>
</table>
</form>
<div style="margin-top: 160px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>