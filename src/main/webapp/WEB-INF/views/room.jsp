<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>With</title>
<link rel="stylesheet" href="/SRC2/popupca/style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="/SRC2/popupca/calendar.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="RoomList">방목록보기</a></li>
            <li><a href="RoomList1">예약가능한 방목록보기</a></li>
            
          </ul>
        </li>
       
      </ul>
    </div>
  </div>
</nav>



  <br>
  <br>
  <br>
  <!-- <section class="content"></section> -->
<!--   <section id="one" class="main style2 right dark fullscreen inactive"></section> -->
    <form action="CreateRealRoom?roomId=${Room.roomId}" method="post">
      <div class="w3-half w3-margin-bottom" style="margin-left:25%;" >
        <ul class="w3-ul w3-center w3-card w3-hover-shadow">
        
          <li class="w3-dark-grey w3-xlarge w3-padding-32">Room!!!</li>
          <li class="w3-padding-16"><strong>회원아이디:</strong><%=session.getAttribute("id") %></li>
          <li class="w3-padding-16"><strong>출발지 확인 :</strong>${Room.rStart}</li>
          <li class="w3-padding-16"> <strong>도착지 확인 :</strong>${Room.rEnd}</li>
          <li class="w3-padding-16"> <strong>예상 거리 :</strong>${Room.preDistance}</li>
          <li class="w3-padding-16"> <strong>(예상금액 / 최대인원 한 값)예상금액 :</strong> ${Room.finalMoney}원</li>
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
          <li class="w3-padding-16"> <strong>입장한아이디:</strong><c:if test="${Room.rId1 != null}">
현재 입장중인 ID: ${Room.rId1}<br>
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
<script src="resources/geonwoo/js/demo.js"></script>
</body>
</html>