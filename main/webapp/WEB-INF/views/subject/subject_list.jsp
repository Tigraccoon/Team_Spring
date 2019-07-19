<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
 *{text-align: center;}
.sky_t{ width: 70%; height: auto; margin-left: auto; margin-right: auto;}
.p_img{width: 320px; height: auto;}
.p_name{width: 220px; height: auto; font-weight: bold;}
.p_class{width: 350px; height: auto; font-weight: bold;}
.pay{width: 250px; height: auto; font-weight: bold;}
.img_c{text-align: center; padding-top: 30px; font-weight: bold;}
.pnum{color: red;}
.bold{background-color: #29425b; color: white; font-size: 21px;}
/* #2c3e50 , #29425b , #2c5d56  */
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="img_c">
<img src="${path }/img/lact.jpg" style="width: 270px; height: auto;">
</div>
<p>
<table border="1" class="sky_t">
	<tr class="bold">
		<th>강의소개</th>
		<th>강사명</th>
		<th>강의명</th>
		<th>수강료</th>
		<th>수강인원</th>
	</tr>
	<c:forEach var="row" items="${list}">
	<tr>
		<td class="p_img">
		<img src="${path}/img/${row.img_url}"
					width="320px" height="auto;">
		</td>
		
		<td class="p_name">
		${row.prof_name}&nbsp;강사
		</td>
		
		<td class="p_class">
		<a href="${path}/subject/detail/${row.subject_name}">${row.subject_name}</a>
			<!-- 관리자에게만 편집 버튼 표시 -->
			<%-- <c:if test="${sessionScope.admin_userid != null }"><br> --%>
				<br><a href="${path}/subject/edit/${row.subject_name}">[편집]</a>
			<%-- </c:if> --%>
		</td>
		
		<td class="pay">
		<fmt:formatNumber value="${row.price}" pattern="#,###" />&nbsp;원
		</td>
		
		<td class="pnum">
		<fmt:formatNumber value="${row.p_num}" />&nbsp;名
		</td>
		
	</tr>
	</c:forEach>

</table>
<div style="margin-top: 160px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>