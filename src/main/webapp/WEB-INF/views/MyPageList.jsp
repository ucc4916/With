<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- <link rel="stylesheet" href="resources/assets/css/main.css">
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" id="header">
<div class="container-fluid">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="home"><img src="resources/KakaoTalk_20180918_160253898.png" width="80px" height="30px"></a>
</div>
<div class="collapse navbar-collapse" id="myNavbar">
<ul class="nav navbar-nav navbar-right">
<%
String id = (String)session.getAttribute("id");
%>
<% if(id != null){ %>
<li><a href="Logout">로그아웃</a></li>
<% }else {%>
<li><a href="Login">로그인</a></li>
<li><a href="UserJoin">사용자 회원가입</a></li>
<li><a href="DriverJoin">기사 회원가입</a></li>
<%} %>
<c:if test="${LoginMember.passuser == 2}">

<li><a href="DriverMyPage">마이페이지 기사용</a></li>
</c:if>
<c:if test="${LoginMember.passuser == 1}">
<li><a href="UserMyPage">마이페이지 유저용</a></li>
</c:if>
<c:if test="${LoginMember.signtype eq 'emptys'}">
<li><a href="License">라이센스 등록하기</a><br><br></li>
</c:if>
<%if("admin".equals(id)){%>
<li><a href="AdminHome">관리자모드 실행하기</a></li>
<% } %>

    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
      <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="RoomList">방목록보기</a></li>
        <li><a href="RoomList1">예약가능한 방목록보기</a></li>
        <li><a href="findid">아이디 찾기</a></li>
        <li><a href="findps">비밀번호 찾기</a></li>


      </ul>
    </li>

  </ul>
</div>
</div>


<h2>자신이 이용한 기록보기</h2>


<form action="mypagelist?=${Id}" method="post">

  <br>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>방번호</th>
        <th>출발지</th>
        <th>도착지</th>
        <th>시간</th>
        <th>거리</th>
        <th>금액</th>
        <th>기사평점</th>
        
      </tr>
    </thead>
     <tbody id="myTable">
    
<c:forEach var="mypagelist" items="${mypagelist}">
<tr>
<td>${mypagelist.eroomId }번방</td>
<td>${mypagelist.erStart}</td>
<td>${mypagelist.erEnd}</td>
<td>${mypagelist.epreTime}</td>
<td>${mypagelist.epreDistance}</td>
<td>${mypagelist.epreMoney}</td>
<th><a href="Grade?driverId=${mypagelist.edriverId}">${mypagelist.edriverId}:기사님 평점 주기</a></th>
</tr>
</c:forEach>
</tbody>
</form>


</nav>
<section id="intro" class="main style1 dark fullscreen inactive"></section>
</body>
</html>