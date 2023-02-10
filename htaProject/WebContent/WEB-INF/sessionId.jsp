<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- http://localhost:8080/htaProject/NewFile.jsp -->
	--현재 세션에 로그인된 아이디:${userId} <br>
	--현재 세션에 로그인된 아이디:${loginId_model} <br>
	--현재 세션에 로그인된 아이디:${sessionId} <br>
	
	<form action="userinfo/logout" method="post">
		<button type ="submit">로그아웃</button>
	</form>
</body>
</html>