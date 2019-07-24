<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<script>
$(function(){
	$("#btnList").click(function(){
		location.href="${path}/subject/list.do";
	});
	$("#btnDelete").click(function(){
		if(confirm("수강신청 내역을 비우시겠습니까?")){
			location.href="${path}/mypage/deleteAll.do";
		}
	});
});
</script>
<style type="text/css">
.bold{background-color: #29425b; color: white; font-size: 21px;}
#summoney{padding-bottom: 10px; padding-top: 10px; padding-right: 75px; color:red;}
.null{padding-top: -700px; text-align: center; color: blue; font-size: 20px;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
      <div class="tab-pane" id="myclass" role="tabpanel" aria-labelledby="myclass-tab">  
<c:choose>
		<c:when test="${map.count == 0}">
		<p class="null">' ${user.name}님 '께서는
		<br> 수강신청을 하지 않았습니다.<br><br>	
	<a class="btn btn-dark btn-xl js-scroll-trigger" 
	href="${path}/subject/list.do">수강신청하러 가기</a></p>
		</c:when>
	<c:otherwise>
		<div class="form1-group row justify-content-center">
			<div class="col col-auto">
		<form name="form1" method="post">
			<table id="table1" border="1" width="1000px">
			<tr id="tr1" class="bold">
					<th>&nbsp;</th>
					<th>강의명</th>
					<th>강사명</th>
					<th>강의 기간</th>
					<th>금액</th>
					<th>&nbsp;</th>
				</tr>
			<c:forEach var="row" items="${map.list}">
				<tr id="tr2">
					<td style="width: 120px;"><img src="${path}/img/${row.img_url}" style="width: 120px; height: auto;"></td>
					<td>${row.subject_name}</td>
					<td>${row.prof_name}</td>
					<td>${row.subject_date}</td>
					<td>${row.price}</td>
					<td>
						<c:if test="${sessionScope.user.userid != null}">
						<a href="${path}/mypage/delete.do?cart_id=${row.cart_id}">삭제</a>
						</c:if>					
					</td> 
				</tr> 
			</c:forEach>
				<tr>
					<td id="summoney" colspan="6" align="right">
						 총합계 : ${map.sumMoney}
					</td>
				</tr>
			</table>
		</form>
			</div>
			</div>
			<bR>
			<br>
			<bR>
			<div class="form-group row justify-content-center">
			<div class="col col-auto">
			<button type="button" id="btnList" class="btn btn-primary btn-lg">강의 목록</button>
			<button type="button" id="btnDelete" class="btn btn-primary btn-lg">강의 내역 전체 삭제</button>
			</div>
			</div>
	</c:otherwise>
</c:choose>
	      
	      
	 		<div style="margin-bottom: 200px;"></div>
      </div>

</body>
</html>