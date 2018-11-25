
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>With</title>
  <meta charset="utf-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<script language="javascript">
	
	function delconfirm(){
		var message = confirm("정말로 회원을 삭제하시겠습니까?");
		
		if(message == true){
			alert("삭제되었습니다.");
		}else
			return false;
	}
</script>

<div>
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
</seciton>

<form action="WithPays" method="get">
<br><br><br>
<div class="container">
  <h3>유저 목록</h3>	
  <p>유저목록을 볼 수 있습니다</p>  
  

          
  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped">
    <thead>
    <c:set var="passuser" value="${Memberdetail.passuser}" />
	<tr id="up">
    <td>아이디</td>
    <td>성별</td>
    <td>이메일</td>
    <td>전화번호</td>
    <td>주소</td>
    <td>유저 분류</td>
    <td>계정 삭제</td>
  </tr>
  <tr>
    <td>${Memberdetail.id}</td>
    <td>${Memberdetail.gender}</td>
     <td>${Memberdetail.email}</td>
      <td>${Memberdetail.tel}</td>
       <td>${Memberdetail.address}</td>
        <c:choose>
        <c:when test="${passuser eq '1'}">
         <td>일반</td>
         <td><a href="MemberDelete?id=${Memberdetail.id}"onclick="return delconfirm();">삭제하기</a></td>
          </c:when>
    <c:when test="${passuser eq '2'}">
    <td>기사</td>
    <td><a href="MemberDelete?id=${Memberdetail.id}"onclick="return delconfirm();">삭제하기</a></td>
     </c:when>
</c:choose>
      
    
    </tbody>
  </table>
  
  
</div>

</form>
</section>

</div>


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
