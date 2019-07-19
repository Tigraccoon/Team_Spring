<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp" %>
<meta charset="UTF-8">
<style type="text/css">

body {
	background-image: url(http://p1.pichost.me/i/11/1344899.jpg);
	background-size: cover;
	background-repeat: no-repeat;
   font-family: Arial, sans-serif;
	font-weight: bold;
	font-size: 14px;

text-align: center;
}

.wrap {
	position: absolute;
	top: 70%;
	left: 50%;
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	text-decoration: none;
	border-radius: 10px;
	padding: 20px 30px;
}

a.button {
	color: black;
	box-shadow: rgba(204, 204, 255) 0 0px 0px 2px inset;
		text-decoration: none;
}

a.button:hover {
	color: rgb(255, 255, 255);
	box-shadow: rgb(163, 163, 194) 0 0px 0px 90px inset;
		text-decoration: none;
}



</style>
<title>404error</title>

</head>
<body>
<div style="margin-top: 100px;">
<%@ include file="../include/menu.jsp" %>
<A href="${path }/"><img src="${path}/img/error.png"
style="margin-top: 60px;"></A>
<h2>요청하신 주소를 찾을 수 없습니다.<br>
 500error!!!</h2>
<p>
잠시 후에 다시 한번 시도해 주시기 바랍니다.<br>
동일한 문제가 지속적으로 발생할 경우 고객센터로 문의하여 주십시오.<br>
</p>
	<div class="wrap"
		style="margin-top: 1px;">
  		<a href="${path }/" class="button">메인페이지로 이동</a>
	</div>
</div>
</body>
</html>