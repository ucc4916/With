<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>With</title>
</head>
<body>
<script type="text/javascript">
function innerHTMLCard(){
	document.getElementById('Send').innerHTML="<strong>카드결제입니다.</strong><br> <br>카드종류<input type='text' id='Cards'><br><br>카드번호<input type='text' id='Cardnum' ><br><br>비밀번호<input type='text' size='1' id='Password'>**<font color=#527a7a size='1'>비밀번호앞자리 2자리를입력해주세요</font><br><br>유효기간<input type='text' size='1' id='Month'>월<input type='text' size='1' id='Day'>일<font color=#527a7a size=1>예)08년11일</font><br><br>생년월일<input type='text' size=3 id='Birthday'>-*******<br>";
}
function innerHTMLSend(){
	document.getElementById('Send').innerHTML="<strong>계좌이체 입니다.</strong><br><br> 가상계좌의 번호는<br>농협: 312-0120-9203-61 입니다.<br><br> "
}
function innerHTMLSelect(){
	document.getElementById('Send2').innerHTML="금액을 입력해주세요.<input type='number' name='Point'><br>"
}
function innerHTMLInput(){
	document.getElementById('Send2').innerHTML="결제금액을 골라주세요 <select name='Point'><option>5000</option><option>10000</option><option>15000</option></select><br>"
}

</script>

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
    <form action="GoCacao2" id="Pay" method="POST" >
      <div class="w3-half w3-margin-bottom" style="margin-left:25%;">
        <ul class="w3-ul w3-center w3-card w3-hover-shadow" >
          <li class="w3-dark-grey w3-xlarge w3-padding-32">포인트 충전하기  <input type="hidden" value="${roomId}" name="roomId">
<input type="hidden" value="${finalMoney}" name="finalMoney"></li>
       
 <li class="w3-padding-16"><strong>결제금액:</strong><input type="button" value="입력" onclick="innerHTMLSelect()" class="btn" ><br> <br><span id="Send2"></li>
          
          <span id="Send"></li>
     
          </li>
          <li class="w3-light-grey w3-padding-24">
            <input type="submit" class="w3-button w3-white w3-padding-large w3-hover-black" value="포인트충전하기">
          
          </li>
        </ul>
      </div>
</form>





</body>
</html>