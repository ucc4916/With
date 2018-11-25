<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
function LicenseUpload() {
		alert("라이센스 등록이 완료되었습니다. 관리자의 승인이 완료되면 정상사용 가능합니다.");
		document.getElementById('frm').submit();
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

<body>






<section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2" style="margin:0px auto; width:400px; height:350px;">
					<header>
						<form action="LicenseUpload"  method="post" enctype="multipart/form-data" id=frm name=frm >
						<br>
						<br>
						<br>
						택시운전자격증 이미지를 첨부해주시기 바랍니다.
						<br>
						<br>
						<br>
						<br>
						<br>
						<input type="file" id="file" placeholder="사진등록" name="file">
						<font name="check" size="2" color="red"></font> 
						<font name="check1" size="2" color="blue"></font> 		
						<br>
						<input type="hidden" name="Id" value="<%=session.getAttribute("id") %>">
<div style="margin:0px auto;">
<br>
<br>


<input type="submit" style="margin:120px; top:-120px;" value="확인" onclick="LicenseUpload()">
</div>
</form>
</header>
</div>
</section>	
</form>
</body>
</html>