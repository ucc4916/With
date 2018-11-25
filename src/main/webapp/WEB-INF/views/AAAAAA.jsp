<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<link rel="stylesheet" href="resources/assets/css/mains.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="description" content="Inspiration for modern menu hover effects." />
		<meta name="keywords" content="menu, navigation, hover, effect, animation, javascript, css, web design" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link href="https://fonts.googleapis.com/css?family=Roboto:400,700|Nunito:400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/geonwoo/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="resources/geonwoo/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="resources/geonwoo/css/style-adsila.css" />
		<link rel="stylesheet" type="text/css" href="resources/geonwoo/pater/pater.css" />
		<script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>


<script type="text/javascript"> 
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5b9b45dcc9abba57967786b5/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
</head>
<style>

body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
.bgimg {
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url('/w3images/profile_girl.jpg');
    min-height: 100%;
}

.picker-container {
position: absolute;
z-index: 99;

}


.cal {
background-color: white;
display: block;
width: 216px;
-webkit-box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
border-collapse: collapse;
border-spacing: 0;
}

.cal a {
text-decoration: none;
}

.cal tr, .cal th, .cal td {
margin: 0;
padding: 0;
border: 0;
font-size: 100%;
font: inherit;
vertical-align: baseline;
}

.cal caption {
line-height: 32px;
font-weight: bold;
color: #e2e2e2;
text-align: center;
text-shadow: 0 -1px black;
background: #333;
//background: rgba(0, 0, 0, 0.35);
border-top: 1px solid #333;
border-bottom: 1px solid #313131;
-webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.04);
box-shadow: inset 0 1px rgba(255, 255, 255, 0.04);
}
.cal caption a {
display: block;
line-height: 32px;
padding: 0 10px;
font-size: 15px;
color: #e2e2e2;
}
.cal caption a:hover {
color: white;
}
.cal caption .prev {
float: left;
}
.cal caption .next {
float: right;
}
.cal th, .cal td {
width: 30px;
text-align: center;
text-shadow: 0 1px rgba(255, 255, 255, 0.8);
font-family:'malgun gothic';
}
.cal th:first-child, .cal td:first-child {
border-left: 0;
}
.cal th {
line-height: 20px;
font-size: 11px;
color: #696969;
text-transform: uppercase;
background: #f3f3f3;
border-left: 1px solid #f3f3f3;
}
.cal td {
font-size: 11px;
font-weight: bold;
border-top: 1px solid #c2c2c2;
border-left: 1px solid #c2c2c2;
}
.cal td a {
clear: both;
display: block;
position: relative;
width: 30px;
line-height: 28px;
color: #666;
background-image: -webkit-linear-gradient(top, #eaeaea, #e5e5e5 60%, #d9d9d9);
background-image: -moz-linear-gradient(top, #eaeaea, #e5e5e5 60%, #d9d9d9);
background-image: -o-linear-gradient(top, #eaeaea, #e5e5e5 60%, #d9d9d9);
background-image: linear-gradient(to bottom, #eaeaea, #e5e5e5 60%, #d9d9d9);
-webkit-box-shadow: inset 1px 1px rgba(255, 255, 255, 0.5);
box-shadow: inset 1px 1px rgba(255, 255, 255, 0.5);
}
.cal td a:hover, .cal td.off a {
background: #f3f3f3;
}
.cal td.off a {
color: #b3b3b3;
}
.cal td.active a, .cal td a:active {
margin: -1px;
color: #f3f3f3;
text-shadow: 0 1px rgba(0, 0, 0, 0.3);
background: #6dafbf;
border: 1px solid #598b94;
-webkit-box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
}
.cal td.active:first-child a, .cal td:first-child a:active {
border-left: 0;
margin-left: 0;
}
.cal td.active:last-child a, .cal td:last-child a:active {
border-right: 0;
margin-right: 0;
}
.cal tr:last-child td.active a, .cal tr:last-child td a:active {
border-bottom: 0;
margin-bottom: 0;
}

</style>
<!-- <html> -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="demo-adsila">


<nav class="navbar navbar-default navbar-fixed-top" id="header">
<div class="container-fluid">
<div class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="homes"><img src="resources/KakaoTalk_20180918_160253898.png" width="80px" height="30px"></a>
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




<br>
  <br>
  <br>
    <form action="CreateRealRoom?roomId=${Room.roomId}" method="post">
      <div class="w3-half w3-margin-bottom" style="margin-left:25%;" >
        <ul class="w3-ul w3-center w3-card w3-hover-shadow">
          <li class="w3-dark-grey w3-xlarge w3-padding-32">Room!!!</li>
          <li class="w3-padding-16"><strong>회원아이디:</strong><%=session.getAttribute("id") %></li>
          <li class="w3-padding-16"><strong>출발지 확인 :</strong>${Room.rStart}</li>
          <li class="w3-padding-16"> <strong>도착지 확인 :</strong>${Room.rEnd}</li>
          <li class="w3-padding-16"> <strong>예상 거리 :</strong>${Room.preDistance}</li>
          <li class="w3-padding-16"> <strong>(예상금액 / 최대인원)예상금액 :</strong> ${Room.finalMoney} 원</li>
          <li class="w3-padding-16"> <strong>예상 시간 :</strong>${Room.preTime}</li>
          <li class="w3-padding-16"><strong>성별 옵션:</strong> ${Room.opGender }<br>
<%int num = 0; %>
<c:if test="${Room.rId1 != null}">
<% num += 1; %>
</c:if>
<c:if test="${Room.rId2 != null }">
<% num +=1; %>
</c:if>
<c:if test="${Room.rId3 != null }">
<% num +=1; %>
</c:if>
<c:if test="${Room.rId4 != null }">
<% num +=1; %>
</c:if></li>

          <li class="w3-padding-16"> <strong>인원 수: <%=num %> / ${Room.maximum}</strong></li>
          <li class="w3-padding-16"> <strong>입장한아이디:</strong>
<c:if test="${Room.rId1 != null}">
현재 입장중인 ID: ${Room.rId1}
</c:if>
<c:if test="${Room.rId2 != null}">
현재 입장중인 ID: ${Room.rId2}<br>
</c:if>
<c:if test="${Room.rId3 != null}">
현재 입장중인 ID: ${Room.rId3}<br>
</c:if>
<c:if test="${Room.rId4 != null}">
현재 입장중인 ID: ${Room.rId4}<br>
</c:if>
          </li>
          <li class="w3-padding-16"> <strong>기사입장유무:</strong>
<c:if test="${Room.driverId == null}">
기사 ID : 현재 입장중인 기사가 없습니다.<br>
</c:if>
<c:if test="${Room.driverId != null}">
기사 ID : <a href="DriverInfo?Id=${Room.driverId}">${Room.driverId}</a><br>
</c:if>

          </li>


          
          <li class="w3-light-grey w3-padding-24">
         
          <c:if test="${pay.okCash == null && member.passuser == 1}">
        <strong>결제 미완료</strong>    
           
                       
             <input type="button" class="w3-button w3-white w3-padding-large w3-hover-black" onclick="location.href='pay?finalMoney=${Room.finalMoney}&roomId=${Room.roomId}'" value="결제">
             </c:if>
          <c:if test="${pay.okCash == '1'}">
동승중
<input type="button" class="w3-button w3-white w3-padding-large w3-hover-black" onclick="location.href='payCancel?roomId=${Room.roomId}'" value="결제취소">
</c:if>

<c:if test="${pay.okCash == null && member.passuser == 1}">
 <input type="button" class="w3-button w3-white w3-padding-large w3-hover-black" onclick="location.href='RoomOut?roomId=${Room.roomId}'" value="방나가기">
 </c:if>
 
<c:if test="${member.passuser == 2}">
<input type="button" class="w3-button w3-white w3-padding-large w3-hover-black" onclick="location.href='RoomOut?roomId=${Room.roomId}'" value="방나가기">
<input type="button" class="w3-button w3-white w3-padding-large w3-hover-black" onclick="location.href='EndDriver?roomId=${Room.roomId}'" value="운행완료">
</c:if>
<input type="button" class="w3-button w3-white w3-padding-large w3-hover-black" onclick="location.href='map?rStart=${Room.rStart}&rEnd=${Room.rEnd}&roomId=${Room.roomId}&opGender=${Room.opGender}'" value="지도">
<input type="button" class="w3-button w3-white w3-padding-large w3-hover-black" onclick="location.href='chat?roomId=${Room.roomId}'" value="채팅방">
          </li>
        </ul>
      </div>

</form>
</nav>
<svg class="hidden">
			<symbol id="icon-arrow" viewBox="0 0 24 24">
				<title>arrow</title>
				<polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 "/>
			</symbol>
			<symbol id="icon-drop" viewBox="0 0 24 24">
				<title>drop</title>
				<path d="M12,21c-3.6,0-6.6-3-6.6-6.6C5.4,11,10.8,4,11.4,3.2C11.6,3.1,11.8,3,12,3s0.4,0.1,0.6,0.3c0.6,0.8,6.1,7.8,6.1,11.2C18.6,18.1,15.6,21,12,21zM12,4.8c-1.8,2.4-5.2,7.4-5.2,9.6c0,2.9,2.3,5.2,5.2,5.2s5.2-2.3,5.2-5.2C17.2,12.2,13.8,7.3,12,4.8z"/><path d="M12,18.2c-0.4,0-0.7-0.3-0.7-0.7s0.3-0.7,0.7-0.7c1.3,0,2.4-1.1,2.4-2.4c0-0.4,0.3-0.7,0.7-0.7c0.4,0,0.7,0.3,0.7,0.7C15.8,16.5,14.1,18.2,12,18.2z"/>
			</symbol>
			<symbol id="icon-github" viewBox="0 0 32.6 31.8">
				<title>github</title>
				<path d="M16.3,0C7.3,0,0,7.3,0,16.3c0,7.2,4.7,13.3,11.1,15.5c0.8,0.1,1.1-0.4,1.1-0.8c0-0.4,0-1.4,0-2.8c-4.5,1-5.5-2.2-5.5-2.2c-0.7-1.9-1.8-2.4-1.8-2.4c-1.5-1,0.1-1,0.1-1c1.6,0.1,2.5,1.7,2.5,1.7c1.5,2.5,3.8,1.8,4.7,1.4c0.1-1.1,0.6-1.8,1-2.2c-3.6-0.4-7.4-1.8-7.4-8.1c0-1.8,0.6-3.2,1.7-4.4C7.4,10.7,6.8,9,7.7,6.8c0,0,1.4-0.4,4.5,1.7c1.3-0.4,2.7-0.5,4.1-0.5c1.4,0,2.8,0.2,4.1,0.5c3.1-2.1,4.5-1.7,4.5-1.7c0.9,2.2,0.3,3.9,0.2,4.3c1,1.1,1.7,2.6,1.7,4.4c0,6.3-3.8,7.6-7.4,8c0.6,0.5,1.1,1.5,1.1,3c0,2.2,0,3.9,0,4.5c0,0.4,0.3,0.9,1.1,0.8c6.5-2.2,11.1-8.3,11.1-15.5C32.6,7.3,25.3,0,16.3,0z"/>
			</symbol>
			<symbol id="icon-keyboard" viewBox="0 0 100 70">
				<title>keyboard</title>
				<path d="M 60.94,1.83 39.22,1.83 C 36.71,1.83 34.67,3.86 34.67,6.376 L 34.67,28.1 C 34.67,30.61 36.71,32.65 39.22,32.65 L 60.94,32.65 C 63.45,32.65 65.5,30.61 65.5,28.1 L 65.5,6.376 C 65.5,3.86 63.45,1.83 60.94,1.83 Z M 44.79,18.63 50.08,11.74 55.37,18.63 Z" opacity="0.2"/>
				<path d="M 60.86,36.75 39.14,36.75 C 36.63,36.75 34.59,38.79 34.59,41.3 L 34.59,63.02 C 34.59,65.53 36.63,67.57 39.14,67.57 L 60.86,67.57 C 63.38,67.57 65.41,65.53 65.41,63.02 L 65.41,41.3 C 65.42,38.79 63.38,36.75 60.86,36.75 Z M 50.08,57.45 44.79,50.55 55.37,50.55 Z" opacity="0.2" />
				<path d="M 95.45,36.75 73.73,36.75 C 71.22,36.75 69.18,38.79 69.18,41.3 L 69.18,63.02 C 69.18,65.53 71.22,67.57 73.73,67.57 L 95.45,67.57 C 97.97,67.57 100,65.53 100,63.02 L 100,41.3 C 100,38.79 97.97,36.75 95.45,36.75 Z M 83.4,57.45 83.4,46.86 90.3,52.16 Z" />
				<path d="M 26.27,36.75 4.55,36.75 C 2.037,36.75 0,38.79 0,41.3 L 0,63.02 C 0,65.53 2.037,67.57 4.55,67.57 L 26.27,67.57 C 28.78,67.57 30.82,65.53 30.82,63.02 L 30.82,41.3 C 30.82,38.79 28.78,36.75 26.27,36.75 Z M 16.69,57.45 9.79,52.16 16.69,46.86 Z" />
			</symbol>
		</svg>
		<main>
			<!-- <div class="content content--fixed">
				<header class="codrops-header">
					<div class="codrops-links">
						<a class="codrops-icon codrops-icon--prev" href="https://tympanus.net/Development/AnimatedImagePieces/" title="Previous Demo"><svg class="icon icon--arrow"><use xlink:href="#icon-arrow"></use></svg></a>
						<a class="codrops-icon codrops-icon--drop" href="https://tympanus.net/codrops/?p=31887" title="Back to the article"><svg class="icon icon--drop"><use xlink:href="#icon-drop"></use></svg></a>
					</div>
					<h1 class="codrops-header__title">Inspiration for Menu Hover Effects</h1>
				</header>
				<a class="github" href="https://github.com/codrops/MenuHoverEffects/" title="Find this project on GitHub"><svg class="icon icon--github"><use xlink:href="#icon-github"></use></svg></a>
				<nav class="demos">
					<svg class="icon icon--keyboard"><use xlink:href="#icon-keyboard"></use></svg>
					<a class="demo demo--current" href="index.html"><span>1</span></a>
					<a class="demo" href="inola.html"><span>2</span></a>
					<a class="demo" href="ama.html"><span>3</span></a>
					<a class="demo" href="salal.html"><span>4</span></a>
					<a class="demo" href="yona.html"><span>5</span></a>
					<a class="demo" href="dustu.html"><span>6</span></a>
					<a class="demo" href="tsula.html"><span>7</span></a>
					<a class="demo" href="mohe.html"><span>8</span></a>
				</nav>
				<a class="pater" href="http://synd.co/2gX9MF1" onClick="recordOutboundLink(this, 'Outbound Links', 'FullStoryDemo01082017');return false;">
					<div class="pater__img"></div>
					<h3 class="pater__title">​See Every Click, Swipe and Scroll</h3>
					<p class="pater__description">See how users experience your designs with FullStory. <strong>Get it free today!</strong></p>
				</a>
			</div> -->
			<section class="content">
				<nav class="menu menu--adsila">
					<a class="menu__item" href="#">
						<span class="menu__item-name">Artists</span>
						<span class="menu__item-label">Explore all artists' portfolios</span>
					</a>
					<a class="menu__item" href="#">
						<span class="menu__item-name">Exhibitions</span>
						<span class="menu__item-label">Discover their stories</span>
					</a>
					<a class="menu__item" href="#">
						<span class="menu__item-name">Schedule</span>
						<span class="menu__item-label">View our event calendar</span>
					</a>
					<a class="menu__item" href="#">
						<span class="menu__item-name">Mission</span>
						<span class="menu__item-label">Read our mission statement</span>
					</a>
					<a class="menu__item" href="#">
						<span class="menu__item-name">The Gardens</span>
						<span class="menu__item-label">Get to know our eco village</span>
					</a>
					<a class="menu__item" href="#">
						<span class="menu__item-name">Buy Tickets</span>
						<span class="menu__item-label">Purchase event tickets online</span>
					</a>
					<a class="menu__item" href="#">
						<span class="menu__item-name">Contact</span>
						<span class="menu__item-label">Get in touch and find us</span>
					</a>
				</nav>
			</section>
		</main>
		<script src="resources/geonwoo/js/demo.js"></script>


</body>
</html>