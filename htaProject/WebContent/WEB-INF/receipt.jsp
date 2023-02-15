<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 완료 영수증</title>
</head>
<body>
		주문자 : ${name}<br>
		전화번호 : ${tel}<br>
		주소 : ${address }<br>
	<c:forEach items="${requestScope.cartList}" var="cart">
		<br>
		제품명 : ${cart.product.productName }<br>
		수량 : ${cart.productCount}<br>
		이미지 : ${cart.product.productImg }<br>
	</c:forEach>
	
</body>
</html>