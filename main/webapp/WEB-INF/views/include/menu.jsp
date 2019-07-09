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
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#">강의후기</a>
          </li>
          
          
          <c:if test="${user.userid == null }">
	          <li class="nav-item mx-0 mx-lg-1">
	            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${path }/user/login.go"> 로그인</a>
	          </li>
	          <li class="nav-item mx-0 mx-lg-1">
	            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${path }/user/signup.go"> 회원가입</a>
	          </li>
          </c:if>
          <c:if test="${user.userid != null }">
	          <li class="nav-item mx-0 mx-lg-1">
	            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${path }/user/pwdcheck.go"> 마이페이지</a>
	          </li>
	          <li class="nav-item mx-0 mx-lg-1">
	            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${path }/user/logout.do"> 로그아웃</a>
	          </li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav> 
</div>  
  
  
<%-- 
 <!-- Bootstrap core CSS -->
<link href="../views/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
 

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <a class="navbar-brand" href="${path }/">
  <img src="${path }/img/sky_w.png" style="width: 160px; height: auto;"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">강의소개</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">수강신청</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">강의후기</a>
      </li>
      
   
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Mypage</a>
        <div class="dropdown-menu" aria-labelledby="dropdown03">
          <c:if test="${user.userid == null }">
          <a class="dropdown-item" href="${path }/user/login.go">로그인</a>
          <a class="dropdown-item" href="#">회원가입</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-md-0">
      <input class="form-control" type="text" placeholder="Search">
    </form>
  </div>
</nav>
 --%>


