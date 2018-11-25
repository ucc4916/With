<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>기사정보 페이지</h2>
아이디:${DriverInfo.id}<br>
성별:${DriverInfo.gender}<br>
이름:${DriverInfo.name}<br>
e-mail:${DriverInfo.email}<br>
전화번호:${DriverInfo.tel}<br>
자격증:<img class="mb-4" src="resources/${DriverInfo.certificate}" alt="" width="180" height="120"><br>

</body>
</html>