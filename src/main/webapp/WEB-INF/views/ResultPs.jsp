<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html>

<html>
<head>
<title>With</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<link rel="stylesheet" href="resources/assets/css/main.css">
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
var count = parseInt(3);
function findcode() {
	var random = $('#randomId').val();
	var code = $('#code').val();
 	if(code == random) {
 		alert("인증번호 확인이 완료되었습니다.");
		document.getElementById('frm').submit();
 	}else{
 		alert("인증번호가 다릅니다.")
 		event.preventDefault();
 		count--;
 	}
 	if(count == 0){
 		alert("인증번호 3번 틀리셨습니다. 다시 진행하시기 바랍니다.");
 		location.href="views/Findps.jsp";
 	}
}
</script>
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
</nav>


<section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2" style="margin:0px auto; width:400px; height:350px;">
					<header>
						<form action="CodeSuccess" method="get" id=frm name=frm >
						<h2>인증번호 입력</h2>
						<input type="text" name="code1" id="code">
<input type="hidden" name="hiddenId1" id="hiddenId" value="${id}">
<input type="hidden" name="randomId1" id="randomId" value="${random}">
<!-- 	<bR> -->
<br>
<br>
<br>
<br>
<div style="margin:0px auto;">
<input type="button" value="확인" onclick="findcode()">

</div>
</form>
					</header>
				</div>
			</section>
</body>
</html>