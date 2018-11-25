<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
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
			<!-- <li><a href="cacaoAPI">카카오페이 TEST</a></li> -->
          </ul>
        </li>
       
      </ul>
    </div>
  </div>
</nav>

<form action="WithPays" method="get">
<br>
<div class="container">
<br><br>
  <h2>예약 리스트</h2>
  <p>예약페이지를 볼 수 있습니다.</p>  
  <a href="RoomList">실시간 방목록 보기</a><br>
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>방번호</th>
        <th>출발지</th>
        <th>도착지</th>
        <th>예약날짜</th>
        <th>예약시간</th>
        <th>예상시간</th>
        <th>예상거리</th>
        <th>예상금액</th>
        <th>성별옵션</th>
        <th>최대인원</th>
        <th>기사</th>
        
        <th>입장</th>
        
      </tr>
    </thead>
    <tbody id="myTable">
    <c:forEach var = "room" items="${reservationList}">
      <tr>
      
        <td>${room.roomId}</td>
          <td>${room.rStart}</td>
          	<td>${room.rEnd}</td>
          	<td>${room.dayDay }</td>
          	<td>${room.times }</td>
          	 <td>${room.preTime}</td>
          	 <td>${room.preDistance}</td>
          	  <td>${room.preMoney}</td>
          	  <td>${room.opGender }</td>
          	  <td>${room.maximum }</td>
          	  <td>${room.driverId }</td>
          	  
          	  
          	  <th><a href="RoomInfo2?roomId=${room.roomId }&opGender=${room.opGender }">입장!</a></th>
      </tr>
      
     </c:forEach>
    </tbody>
  </table>
  
  
</div>
</form>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

</body>
</html>
