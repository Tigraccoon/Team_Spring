<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>

<!-- views/include/menu.jsp -->
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
 <!-- Navigation -->
 <div style="margin-bottom: 114px;">
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="${path }/">
      <img src="${path }/img/sky_w.png" style="width: 160px; height: auto;"></a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#">강의소개</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#">수강신청</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" 
            			href="${path }/board/boardlist.do?curPage=1&keyword=''">강의후기</a>
          </li>
          
          
          <c:if test="${user.userid == null }">
	          <li class="nav-item mx-0 mx-lg-1">
	            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" 
	            			href="${path }/user/login.go"> 로그인</a>
	          </li>
	          <li class="nav-item mx-0 mx-lg-1">
	            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" 
	            			href="${path }/user/signup.go"> 회원가입</a>
	          </li>
          </c:if>
          
          <c:if test="${user.userid != null }">
          <!-- 일반회원 -->
          	<c:if test="${user.user_group == '1' }">
	          	<li class="nav-item mx-0 mx-lg-1">
	            	<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" 
	            			href="${path }/user/pwdcheck.go"> 마이페이지</a>
	          	</li>
            </c:if>
          <!-- 강사 -->
            <c:if test="${user.user_group == '2' }">
	          	<li class="nav-item mx-0 mx-lg-1">
	            	<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" 
	            			href="${path }/user/teacher/studentslist.go"> 수강생관리</a>
	          	</li>
            </c:if>
          <!-- 관리자 --> 
            <c:if test="${user.user_group == '3' }">
	          	<li class="nav-item mx-0 mx-lg-1">
	            	<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" 
	            			href="${path }/user/admin/alluserslist.go"> 회원관리</a>
	          	</li>
            </c:if>
	          <li class="nav-item mx-0 mx-lg-1">
	            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" 
	            			href="${path }/user/logout.do"> 로그아웃</a>
	          </li>
	          <li class="nav-item mx-0 mx-lg-1">
	            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
	            style="color:aqua;"> | ${user.name }님 </a>
	          </li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav> 
</div>  
  
  


