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
		alert("���̼��� ����� �Ϸ�Ǿ����ϴ�. �������� ������ �Ϸ�Ǹ� ������ �����մϴ�.");
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
<li><a href="Logout">�α׾ƿ�</a></li>
<% }else {%>
<li><a href="Login">�α���</a></li>
<li><a href="UserJoin">����� ȸ������</a></li>
<li><a href="DriverJoin">��� ȸ������</a></li>
<%} %>
<c:if test="${LoginMember.passuser == 2}">

<li><a href="DriverMyPage">���������� ����</a></li>
</c:if>
<c:if test="${LoginMember.passuser == 1}">
<li><a href="UserMyPage">���������� ������</a></li>
</c:if>
<c:if test="${LoginMember.signtype eq 'emptys'}">
<li><a href="License">���̼��� ����ϱ�</a><br><br></li>
</c:if>
<%if("admin".equals(id)){%>
<li><a href="AdminHome">�����ڸ�� �����ϱ�</a></li>
<% } %>

    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
      <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="RoomList">���Ϻ���</a></li>
        <li><a href="RoomList1">���డ���� ���Ϻ���</a></li>
        <li><a href="findid">���̵� ã��</a></li>
        <li><a href="findps">��й�ȣ ã��</a></li>

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
						�ýÿ����ڰ��� �̹����� ÷�����ֽñ� �ٶ��ϴ�.
						<br>
						<br>
						<br>
						<br>
						<br>
						<input type="file" id="file" placeholder="�������" name="file">
						<font name="check" size="2" color="red"></font> 
						<font name="check1" size="2" color="blue"></font> 		
						<br>
						<input type="hidden" name="Id" value="<%=session.getAttribute("id") %>">
<div style="margin:0px auto;">
<br>
<br>


<input type="submit" style="margin:120px; top:-120px;" value="Ȯ��" onclick="LicenseUpload()">
</div>
</form>
</header>
</div>
</section>	
</form>
</body>
</html>