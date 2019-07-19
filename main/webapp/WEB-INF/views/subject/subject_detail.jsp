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
h2{text-align: center; padding-top: 30px;}
body{background-image: url("${path}/img/bg.png"); background-repeat: no-repeat;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<h2>수강정보</h2>
<table>
	<tr>
		<td><img src="${path}/img/${dto.img_url}"
					width="300px" height="300px"></td>
		<td align="center">	
			<table>
				<tr>
					<td>강의명</td>
					<td>${dto.subject_name}</td>
				</tr>
				<tr>
					<td>수강료</td>
					<td>${dto.price}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>${dto.description}</td> 
				</tr>
				<tr>
					<td colspan="2">
						<form name="form1" method="post"
							action="${path}/mypage/insert.do">
							<input type="hidden" name="subject_name" value="${dto.subject_name}">
							<input type="submit" value="수강신청" class="btn btn-primary">
						</form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<div style="margin-top: 160px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>