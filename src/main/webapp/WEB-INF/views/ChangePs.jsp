<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>With</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<link rel="stylesheet" href="resources/assets/css/main.css">
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"></script>
<script>
 $(function(){
  $('#Password').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#Psrechange').keyup(function(){
   if($('#Password').val()!=$('#Psrechange').val()){
	   $('font[name=check1]').empty();
	   $('font[name=check]').text('');
    $('font[name=check]').html("암호가 일치하지 않습니다.");
   }else{
	$('font[name=check]').empty();
    $('font[name=check1]').text('');
    $('font[name=check1]').html("암호가 일치합니다.");
   }
  }); //#chpass.keyup
 });
</script>

<script type="text/javascript">
function PassWordCheck() {
		var Password = document.getElementById("Password").value; 
		var CheckPassword = document.getElementById("Psrechange").value; 
		console.log(Password);
		console.log(CheckPassword);
		if(Password != CheckPassword){
			alert("비밀번호를 다시 확인해주시기 바랍니다.");
			event.preventDefault();
		}else{
			alert("비밀번호 변경이 완료 되었습니다.");
			document.getElementById('frm').submit();
		}
		
}
	
	
</script>
</head>
<body>

<body class="">

		<!-- Header -->
			<!-- <header id="header"> -->
				<!-- <h1>Big Picture</h1> -->

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
						<form action="ChangePsPro" method="get" id=frm name=frm >
						<br>
						<br>
						<br>
						<input type="password" id="Password" placeholder="비밀번호  입력" name="Password">
						<font name="check" size="2" color="red"></font> 
						<font name="check1" size="2" color="blue"></font> 		
						<br>
						<input type="password" id="Psrechange" placeholder="비밀번호  재확인" name="Psrechange">
						<br>
						<br>
						<br>
						<input type="hidden" id="Id" name="Id" value="<%= request.getParameter("hiddenId1") %>">
<div style="margin:0px auto;">

<input type="submit" style="margin:120px; top:-120px;" value="확인" onclick="PassWordCheck()">
</div>
</form>
</header>
</div>
</section>	

</form>
</body>
</html>