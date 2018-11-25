<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="메인페이지" />
<meta name="Description" content="메인페이지" />
<meta name="viewport" content="width=device-width, initial-scale=1"> <!--반응형 가로폭을위한-->
<link rel="stylesheet" type="text/css" href="resources/css/ST.css"><!--css를위한-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<link rel="stylesheet" href="resources/assets/css/main.css">
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>With</title>

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>

<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>

<script type="text/javascript">

/*  $(document).ready(function() {
     $("#sendBtn").click(function() {
       sendMessage();
     });
 }); */
 var sock;
 //웸소켓을 지정한 url로 연결한다.
 sock = new SockJS("<c:url value="/echo"/>");
 //자바스크립트 안에 function을 집어넣을 수 있음.
 //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
 sock.onmessage = onMessage;
 //데이터를 끊고싶을때 실행하는 메소드
 sock.onclose = onClose;
 /* sock.onopen = function(){
     sock.send($("#message").val());
 }; */
 function sendMessage() {
     /*소켓으로 보내겠다.  */
     sock.send("${roomId}번 방 회원 "+<%=session.getAttribute("id") %>+":"+ $("#message").val());
 }
 //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
 function onMessage(evt) {
     var data = evt.data;
     $("#data").append(data + "<br/>");
     //sock.close();
 }
 function onClose(evt) {
     $("#data").append("연결 끊김");
 }
 
 $(function() {
     $( "#draggable" ).draggable();
   });
 
 $(document).ready(function() {

     $("#sendBtn").click(function() {
    	 

             sendMessage();

             $('#message').val('')

     });


     $("#message").keydown(function(key) {
             if (key.keyCode == 13) {// 엔터
         sendMessage();
   $('#message').val('')
}
});
});
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
<section id="one" class="main style2 right dark fullscreen inactive">
  <div id="draggable" class="ui-widget-content"></div>
<table>
   <tr id="texta">
      <td><input type="text" class="form-control form-control-sm" id="message" /></td>
      <td><input type="button" id="sendBtn" value="전송" /></td>
   </tr>
  
<table id="data">

</table>

</table>
</section>
</body>

</html>
