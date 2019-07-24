<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
table{margin-left: auto; margin-right: auto; }
body{background-image: url("${path}/img/cute.png"); 
background-repeat: no-repeat; margin-left: auto; margin-right: auto;}
.word{font-weight: bold; font-size: 17px;}
.log{text-align: center; padding-top: 80px;}
form{text-align: center;}
.content{text-align: center; padding-top: 50px;}
.tex{color: #2c3e50; font-size: 22px; text-align: center; font-weight: bold; }
.detail{}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="log">
<img src="${path }/img/enrol.jpg">
</div>
<table style=" width: 600px;" >
	<tr>
		<td><img src="${path}/img/${dto.img_url}" 
		width="250px;" height="230px;" style="float: right;"></td>
		<td align="center">	
			<table class="intable">
				<tr>
					<td class="word">강의명<br><br></td>
					<td>&nbsp;&nbsp;&nbsp; ${dto.subject_name}<br><br></td>
				</tr>
				<tr>
					<td class="word">강사명<br><br></td>
					<td>&nbsp;&nbsp;&nbsp; ${dto.prof_name}<br><br></td>
				</tr>
				<tr>
					<td class="word">수강료<br><br></td>
					<td>&nbsp;&nbsp;&nbsp; ${dto.price}<br><br></td>
				</tr>
		        <tr>
  <td>
  <a href="${path }/board/boardlist.do?curPage=1&keyword=''">
  <input type="button" class="btn btn-primary btn-lg" value="강위후기"
  style="margin-right: -100px;"></a>
  </td>
		        </tr>
			</table>
			
		</td>
	</tr>
	           <tr>
	           <td colspan="4" class="content">
	           <div class="detail">
               <img src="${path }/img/detail.jpg">
               <img src="${path }/img/mypage.jpg"><p>
               </div>
	           ${dto.description}</td> 				
				</tr>
				<tr>
					<td colspan="4">
						<form name="form1" method="post"
							action="${path}/mypage/insert.do">
							<input type="hidden" name="subject_name"
								value="${dto.subject_name}">
<input type="submit" class="btn btn-primary btn-lg" 
  value="수강신청" style="font-size: 22px; margin-top: 10px;">
						</form>
					</td>
				</tr>
          </table>


<div style="margin-top: 160px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>