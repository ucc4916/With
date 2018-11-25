<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
       <title>With</title>
        <meta name="description" content="Circle Hover Effects with CSS Transitions" />
        <meta name="keywords" content="circle, border-radius, hover, css3, transition, image, thumbnail, effect, 3d" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700' rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="resources/dahoon/js/modernizr.custom.79639.js"></script> 
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<link rel="stylesheet" href="resources/assets/css/main.css">
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
<title>UserMpPage</title>
</head>
 <style>
    .ch-grid {
	margin: 20px 0 0 0;
	padding: 0;
	list-style: none;
	display: block;
	text-align: center;
	width: 100%;
}

.ch-grid:after,
.ch-item:before {
	content: '';
    display: table;
}

.ch-grid:after {
	clear: both;
}

.ch-grid li {
	width: 220px;
	height: 220px;
	display: inline-block;
	margin: 20px;
}
@import url('normalize.css');


body{
	font-family: Cambria, Georgia, serif;
	background: #f9f9f9 url(../images/bg.jpg);
	font-weight: 300;
	font-size: 15px;
	color: #333;
	
	overflow-y: scroll;
	overflow-x: hidden;
}
a{
	color: #555;
	text-decoration: none;
}
.container{
	width: 100%;
	position: relative;
}
.clr{
	clear: both;
	padding: 0;
	height: 0;
	margin: 0;
}
.main{
	width: 90%;
	margin: 0 auto;
	position: relative;
}
.container > header{
	margin: 10px;
	padding: 20px 10px 10px 10px;
	position: relative;
	display: block;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
    text-align: center;
}
.container > header h1{
	font-size: 32px;
	line-height: 32px;
	margin: 0;
	position: relative;
	font-weight: 300;
	color: #777;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
}
.container > header h2{
	font-size: 14px;
	font-weight: 300;
	font-style: italic;
	margin: 0;
	padding: 15px 0 5px 0;
	color: #888;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.9);
}

.codrops-top{
	line-height: 24px;
	font-size: 11px;
	background: #fff;
	background: rgba(255, 255, 255, 0.6);
	text-transform: uppercase;
	z-index: 9999;
	position: relative;
	box-shadow: 1px 0px 2px rgba(0,0,0,0.1);
}
.codrops-top a{
	padding: 0px 10px;
	letter-spacing: 1px;
	color: #333;
	display: inline-block;
}
.codrops-top a:hover{
	background: rgba(255,255,255,0.3);
}
.codrops-top span.right{
	float: right;
}
.codrops-top span.right a{
	float: left;
	display: block;
}

.codrops-demos{
    text-align:center;
	display: block;
	line-height: 30px;
	padding: 5px 0px;
}
.codrops-demos a{
    display: inline-block;
	font-style: italic;
	margin: 0px 4px;
	padding: 0px 6px;
	color: #aaa;
	line-height: 20px;	
	font-size: 13px;
	text-shadow: 1px 1px 1px #fff;
	border: 1px solid #fff;
	background: #ffffff; 
	background: -moz-linear-gradient(top, #ffffff 0%, #f6f6f6 47%, #ededed 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(47%,#f6f6f6), color-stop(100%,#ededed)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #ffffff 0%,#f6f6f6 47%,#ededed 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #ffffff 0%,#f6f6f6 47%,#ededed 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #ffffff 0%,#f6f6f6 47%,#ededed 100%); /* IE10+ */
	background: linear-gradient(top, #ffffff 0%,#f6f6f6 47%,#ededed 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ededed',GradientType=0 ); /* IE6-9 */
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}
.codrops-demos a:hover{
	color: #333;
	background: #fff;
}
.codrops-demos a:active{
	background: #fff;
}
.codrops-demos a.current-demo,
.codrops-demos a.current-demo:hover{
	background: #f0f0f0;
	border-color: #d9d9d9;
	color: #aaa;
	box-shadow: 0 1px 1px rgba(255,255,255,0.7);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f6f6f6', endColorstr='#f6f6f6',GradientType=0 ); /* IE6-9 */
}

.support-note span{
	color: #ac375d;
	font-size: 16px;
	display: none;
	font-weight: bold;
	text-align: center;
	padding: 5px 0;
}
.no-cssanimations .support-note span.no-cssanimations,
.no-csstransforms .support-note span.no-csstransforms,
.no-csstransforms3d .support-note span.no-csstransforms3d,
.no-csstransitions .support-note span.no-csstransitions{
	display: block;
}

article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
nav,
section,
summary {
    display: block;
}


audio,
canvas,
video {
    display: inline-block;
    *display: inline;
    *zoom: 1;
}



audio:not([controls]) {
    display: none;
    height: 0;
}



[hidden] {
    display: none;
}


html {
    font-size: 100%; 
    -webkit-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
}

html,
button,
input,
select,
textarea {
    font-family: sans-serif;
}


body {
    margin: 0;
}



a:focus {
    outline: thin dotted;
}



a:hover,
a:active {
    outline: 0;
}




h1 {
    font-size: 2em;
    margin: 0.67em 0;
}

h2 {
    font-size: 1.5em;
    margin: 0.83em 0;
}

h3 {
    font-size: 1.17em;
    margin: 1em 0;
}

h4 {
    font-size: 1em;
    margin: 1.33em 0;
}

h5 {
    font-size: 0.83em;
    margin: 1.67em 0;
}

h6 {
    font-size: 0.75em;
    margin: 2.33em 0;
}



abbr[title] {
    border-bottom: 1px dotted;
}



b,
strong {
    font-weight: bold;
}

blockquote {
    margin: 1em 40px;
}



dfn {
    font-style: italic;
}


mark {
    background: #ff0;
    color: #000;
}



p,
pre {
    margin: 1em 0;
}



pre,
code,
kbd,
samp {
    font-family: monospace, serif;
    font-family: 'courier new', monospace;
    font-size: 1em;
}



pre {
    white-space: pre;
    white-space: pre-wrap;
    word-wrap: break-word;
}


q {
    quotes: none;
}


q:before,
q:after {
    content: '';
    content: none;
}

small {
    font-size: 75%;
}



sub,
sup {
    font-size: 75%;
    line-height: 0;
    position: relative;
    vertical-align: baseline;
}

sup {
    top: -0.5em;
}

sub {
    bottom: -0.25em;
}



dl,
menu,
ol,
ul {
    margin: 1em 0;
}

dd {
    margin: 0 0 0 40px;
}


menu,
ol,
ul {
    padding: 0 0 0 40px;
}


nav ul,
nav ol {
    list-style: none;
    list-style-image: none;
}




img {
    border: 0; 
    -ms:interpolation-mode: bicubic; 
}


svg:not(:root) {
    overflow: hidden;
}


 


form {
    margin: 0;
}

fieldset {
    border: 1px solid #c0c0c0;
    margin: 0 2px;
    padding: 0.35em 0.625em 0.75em;
}



legend {
    border: 0; 
    padding: 0;
    white-space: normal; 
    *margin-left: -7px; 
}


button,
input,
select,
textarea {
    font-size: 100%;
    margin: 0; 
    vertical-align: baseline; 
    *vertical-align: middle; 
}

button,
input {
    line-height: normal; 
}


button,
input[type="button"],
input[type="reset"],
input[type="submit"] {
    cursor: pointer; 
    -webkit-appearance: button; 
    *overflow: visible;  
}



button[disabled],
input[disabled] {
    cursor: default;
}



input[type="checkbox"],
input[type="radio"] {
    box-sizing: border-box; 
    padding: 0; 
    *height: 13px; 
    *width: 13px; 
}



input[type="search"] {
    -webkit-appearance: textfield; 
    -moz-box-sizing: content-box;
    -webkit-box-sizing: content-box;
    box-sizing: content-box;
}


input[type="search"]::-webkit-search-decoration,
input[type="search"]::-webkit-search-cancel-button {
    -webkit-appearance: none;
}



button::-moz-focus-inner,
input::-moz-focus-inner {
    border: 0;
    padding: 0;
}



textarea {
    overflow: auto; 
    vertical-align: top; 
}




table {
    border-collapse: collapse;
    border-spacing: 0;
}

 * { -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box; }
    .ch-item {
	width: 100%;
	height: 100%;
	border-radius: 50%;
	position: relative;
	cursor: default;
	box-shadow: 
		inset 0 0 0 16px rgba(255,255,255,0.6),
		0 1px 2px rgba(0,0,0,0.1);
		
	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;
}

.ch-img-1 { 
	background-image: url('resources/images/개인정보.JPG');
}

.ch-img-2 { 
	background-image: url('resources/images/예약.JPG');
}

.ch-img-3 { 
	background-image: url('resources/images/평점.JPG');
}

.ch-info {
	position: absolute;
	background: rgba(63,147,147, 0.8);
	width: inherit;
	height: inherit;
	border-radius: 50%;
	opacity: 0;
	
	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out; 
	
	-webkit-transform: scale(0);
	-moz-transform: scale(0);
	-o-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0);
	
	-webkit-backface-visibility: hidden;

}

.ch-info h3 {
	color: #fff;
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 22px;
	margin: 0 30px;
	padding: 45px 0 0 0;
	height: 140px;
	font-family: 'Open Sans', Arial, sans-serif;
	text-shadow: 
		0 0 1px #fff, 
		0 1px 2px rgba(0,0,0,0.3);
}

.ch-info p {
	color: #fff;
	padding: 10px 5px;
	font-style: italic;
	margin: 0 30px;
	font-size: 12px;
	border-top: 1px solid rgba(255,255,255,0.5);
	opacity: 0;
	-webkit-transition: all 1s ease-in-out 0.4s;
	-moz-transition: all 1s ease-in-out 0.4s;
	-o-transition: all 1s ease-in-out 0.4s;
	-ms-transition: all 1s ease-in-out 0.4s;
	transition: all 1s ease-in-out 0.4s;
}

.ch-info p a {
	display: block;
	color: #fff;
	color: rgba(255,255,255,0.7);
	font-style: normal;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 9px;
	letter-spacing: 1px;
	padding-top: 4px;
	font-family: 'Open Sans', Arial, sans-serif;
}

.ch-info p a:hover {
	color: #fff222;
	color: rgba(255,242,34, 0.8);
}

.ch-item:hover {
	box-shadow: 
		inset 0 0 0 1px rgba(255,255,255,0.1),
		0 1px 2px rgba(0,0,0,0.1);
}
.ch-item:hover .ch-info {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-o-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
	opacity: 1;
}

.ch-item:hover .ch-info p {
	opacity: 1;
}
    </style>
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
<h1><%=session.getAttribute("id") %>님의 MyPage</h1>

 <div class="container">
		
			<!-- Codrops top bar -->
            <div class="codrops-top">
                
                  
                
               
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			
			<header>
			
				<h1><strong>With   </strong>Welcome With Page</h1>
				
				
				<!-- <nav class="codrops-demos">
					<a class="current-demo" href="index.html">Demo 1</a>
				
				</nav>
				 -->
				<!-- <div class="support-note">let's check browser support with modernizr
					span class="no-cssanimations">CSS animations are not supported in your browser</span
					<span class="no-csstransforms">CSS transforms are not supported in your browser</span>
					span class="no-csstransforms3d">CSS 3D transforms are not supported in your browser</span
					<span class="no-csstransitions">CSS transitions are not supported in your browser</span>
					<span class="note-ie">Sorry, only modern browsers.</span>
				</div> -->
				
			</header>
			
			<section class="main">
			
				<ul class="ch-grid">
					<li>
						<div class="ch-item ch-img-1">
							<div class="ch-info">
								<h3>상세보기 및     개인정보 수정</h3>
								<p>information<a href="PasswordForm">여기여기 누르세요!!!!!!</a></p>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-2">
							<div class="ch-info">
								<h3>예약내역 보기</h3>
								<p>Reservation <a href="ReservationRoomList">여기여기 누르세요!!!!!</a></p>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-3">
							<div class="ch-info">
								<h3>이용기록 보기</h3>
								<p>History<a href="MyPageList">기사 평점 주러 가기!!</a></p>
							</div>
						</div>
					</li>
				</ul>
				
			</section>
			
        </div>
</body>
</html>