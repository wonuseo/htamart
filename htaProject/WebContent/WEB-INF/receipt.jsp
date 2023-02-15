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
		주문자 : --${name}--<br>
		전화번호 : --${tel}--<br>
		주소 : --${address}--<br>
		
		<c:choose>
			<c:when test="${type == 'one'}">
				<br>**바로 구매를 누른 이용자**<br>
				제품명 : --${product.productName}--<br>
				수량 : --${count}--<br>	
				이미지 : --${product.productImg }--<br>
			</c:when>
			<c:otherwise>
				<br>**장바구니에서 구입을 한 이용자**<br>
				<c:forEach items="${requestScope.receipt}" var="obj">
					<br>
					제품명 : --${obj.product.productName}--<br>
					수량 : --${obj.productCount}--<br>
					이미지 : --${obj.product.productImg}--<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
</body>
</html>