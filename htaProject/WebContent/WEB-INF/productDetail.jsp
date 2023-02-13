<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>product View</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	
	<!-- Core theme CSS (includes Bootstrap)-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

	<!-- Google Font -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
	
	<!-- 템플릿 css -->
	<link href="../css/style.css" rel="stylesheet">
	<link href="../css/productViewstyles.css" rel="stylesheet" />
	<link href="../css/liststyles.css" rel="stylesheet" />
	
	<!-- 이미지 클릭시 확대 관련 import  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
    
    <!-- 비동기 axios -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.0/axios.min.js"></script>
    
    <!-- 장바구니 modal -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
#cartModal {
	display: none;
}

#logout_btn {
	display: none;
}
</style>

</head>

<body onload="validLogin()">
	<div class="top-bar">

		<div class="container">
			<div class="row">

				<div class="col-md-6">
					<div class="social pull-left">

						<ul>
							<li><a href="https://www.facebook.com" target="_blank"><i
									class="fa fa-facebook"></i></a></li>
							<li><a href="https://www.twitter.com" target="_blank"><i
									class="fa fa-twitter"></i></a></li>
							<li><a href="https://www.google.com" target="_blank"><i
									class="fa fa-google-plus"></i></a></li>
							<li><a href="https://www.naver.com" target="_blank"><i
									class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-6">
					<div class="action pull-right">

						<ul>

							<li><a id="login_btn" href="login.html"><i class="fa fa-user"></i>&nbsp로그인/회원가입</a></li>
							<li><a id="logout_btn" href="${pageContext.request.contextPath}/userinfo/sessionOut"><i class="fa fa-user"></i>&nbsp로그아웃</a></li>
							<li><a id="shoppingCart" href="${pageContext.request.contextPath}/shoppingCart/showCart?userId=${sessionScope.userId }"><i class="fa fa-shopping-bag"></i>&nbsp장바구니</a></li>

						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>
	
<script type="text/javascript">
	function validLogin(){
		axios.post('${pageContext.request.contextPath}/userinfo/isLogin', {}, {
		})
		 .then(function (resData) {
			 valid(resData['data']);
		 })
	}
	
	function valid(userId) {
		if(userId == '' || userId.length == 0) {
		}else{
			document.getElementById("logout_btn").style.display="block";
			document.getElementById("login_btn").style.display="none";
		}
	}
</script>


	<!-- 헤더 -->
	<div class="header">
		<div class="container">
			<div class="row">

				<div class="col-md-3 col-sm-4">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/homepage.html"><img
							src="../images/HTAlogo.png" alt="Orani E-shop"
							style="width: 60%; height: auto;"></a>
					</div>
				</div>

				<div class="col-md-7 col-sm-5">
					<div class="search-form">
						<form
							action="${pageContext.request.contextPath}/SearchController/productsearch"
							class="navbar-form" role="search">
							<!-- action="${pageContext.request.contextPath}/SearchController/productsearch" or action="../SearchController/productsearch" -->
							<div class="form-group">
								<input type="text" name="keyword" class="form-control"
									placeholder="상품 검색">
							</div>
							<button type="submit" class="btn">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>

				<div class="col-md-2 col-sm-3">
					<div class="cart">
						<div class="cart-icon">
							<a href="???"><i class="fa fa-question-circle"></i></a>
						</div>
						<div class="cart-text">
							고객 센터<br> 평일 : 09:00 ~ 18:00 (월~금)
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- 네비게이션 바 -->
	<div class="navigation">
		<nav class="navbar navbar-theme">
			<div class="container">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false">
						<span class="sr-only">Menu</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
				</div>

				<div class="shop-category nav navbar-nav navbar-left">
					<div class="btn-group">

						<button type="button"
							class="btn btn-shop-category dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							전체 카테고리 <span class="caret"></span>
						</button>

						<ul class="dropdown-menu">

							<li><a
								href="${pageContext.request.contextPath }/category/list?cat=fruit">과일</a></li>
							<li><a
								href="${pageContext.request.contextPath }/category/list?cat=vegetable">채소</a></li>

							<li role="separator" class="divider"></li>

							<li><a
								href="${pageContext.request.contextPath }/category/list?cat=meat">정육</a></li>
							<li><a
								href="${pageContext.request.contextPath }/category/list?cat=seafood">수산물/건해산</a></li>

						</ul>
					</div>
				</div>

				<!-- 네비게이션 바 오른쪽 클릭 + 하이퍼링크 -->
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="???">신상품</a></li>
						<li><a href="???">이벤트</a></li>
						<li><a href="???">회사 소개</a></li>
						<li><a href="???">문의 하기</a></li>
					</ul>
				</div>

			</div>
		</nav>
	</div>


	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">

				<div class="col-md-66">
					<img class="card-img-top mb-5 mb-md-0" src="../${product.productImg}" alt="..." width="450px" height="500px" />
				</div>

				<div class="col-md-66">
					<div class="small mb-1 font2 font1" style="font-size:20px">#${categoryname} </div>

					<h1 class="display-5 fw-bolder font2" style="font-size:40px">${product.productName}</h1>
					<br>
					<br>

					<div class="fs-5 mb-5">
						<h1 class="display-5 fw-bolder font2" style="font-size:30px">${product.productPrice}원</h1>
					</div>

					<p class="lead font2" style="font-size:20px">${product.productInfo}</p>

					<hr>

					<form id="direct_purchase_form" action="${pageContext.request.contextPath}/purchase/final" method="post"> 
                          <div class="font2">수량
                          	<input class="form-control text-center me-3" id="p_count" name="p_count" type="number" value="1" min="1" max="5" style="max-width: 8rem" />
                          </div>
                          <br><br>
                          <input type="hidden" id="p_id" name="p_id" value="${product.productId }">
						  <input type="hidden" id="u_id" name="u_id" value="${sessionScope.userId }">	
                          <button class="btn btn-outline-dark btn-lg font2" type="submit" onclick="direct_purchase()"><i class="bi-upc-scan me-1"></i>바로 구매</button>
                          <button class="btn btn-outline-dark btn-lg font2" type="button" onclick="cartAxios('${product.productId }', '${sessionScope.userId }')"><i class="bi-cart-fill me-1"></i>장바구니</button>

                    </form>

				</div>

			</div>
		</div>
	</section>

<!-- 장바구니 비동기 처리 , 장바구니 알림창 -->	
<script>
		function cartAxios(productId, userId) {
			axios.post('${pageContext.request.contextPath}/axios/cart', {}, {
				params : {
					p_id : productId,
					productCount : document.querySelector("#p_count").value,
					userId : userId
				}
			})
			 .then(function (resData) {
				 document.getElementById('cartModal').style.display='block';
			 })
		}
</script>	
	
	  <!-- 장바구니 알림창 -->
	  <div id="cartModal" class="w3-modal">
	    <div class="w3-modal-content w3-animate-top w3-card-4">
	      <header class="w3-container w3-teal"> 
	        <span onclick="document.getElementById('cartModal').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h2 class="font2" style="font-size:40px"><i class="fa fa-shopping-cart fa-2x"></i>&nbsp장바구니 담기 성공!</h2>
	      </header>
	      <div class="w3-container w3-center">
	        <p class="font2" style="font-size:20px">장바구니로 이동하시겠습니까?</p>
	        <span>
	        <button class="w3-btn w3-white w3-border w3-border-teal w3-round-large" onclick="document.getElementById('cartModal').style.display='none'">쇼핑 계속하기</button>
	        <button class="w3-button w3-teal w3-round-large" onclick="location.href='${pageContext.request.contextPath}/shoppingCart/showCart?userId=${sessionScope.userId }'">장바구니 보기</button><br><br>
	        </span>
	      </div>
	      <footer class="w3-container w3-teal">
	        <p>HTA Mall ~ 언제나 즐거운 쇼핑</p>
	      </footer>
	    </div>
	  </div>
	
	<!-- Related product -->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4 font2" style="font-size:25px">관련 상품</h2>

			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<c:choose>
					<c:when test="${not empty requestScope.productallData}">	
						<c:forEach var="pvo" items="${requestScope.productallData}" begin = "1" end = "4">
							<%-- <c:set var="pvo" value="${requestScope.productallData}"/>	 --%>
						<!-- 1.관련상품 출력할 때 위에 상품상세보기에서 해당 상품 제외시킨 목록을 유동적으로 출력을 해야함.. 조건문 써서.. 2. 출력 부분 손대기-->
						  
							<div class="col mb-5">
								<div class="card h-100">
									<!-- Product image-->
									 <div>
		                            <a href="${pageContext.request.contextPath}/${pvo.productImg}" data-lightbox="example-set" data-title="${pvo.productName}">
		                            	<img src="${pageContext.request.contextPath}/${pvo.productImg}" width="450px" height="300px" />
		                            </a>
		                            </div>	   
									
									<!-- Product details-->
									<div class="card-body p-4">
										<div class="text-center">
										
											<!-- Product name-->
											  <c:choose>
												<c:when test="${pvo.productStock == 'y'}">
													<a class="a font2" href="${pageContext.request.contextPath}/productView/details?p_id=${pvo.productId}">
		                                    	 		<h3 class="fw-bolder font2">${pvo.productName}</h3> 
		                                    		</a>
												</c:when>
												<c:when test="${pvo.productStock == 'n'}">
													<a class="a font2" href="javascript:Accesscont()" > 
		                                    	 		<h3 class="fw-bolder font2">${pvo.productName}</h3> 
		                                    		</a>
												</c:when>
												<c:otherwise>
													<a class="a font2" href="javascript:Accesscont2()" > 
		                                    	 		<h3 class="fw-bolder font2">${pvo.productName}</h3> 
		                                    		</a>
												</c:otherwise>
											</c:choose> 
											
											<!-- Product price-->
											<div class="font2">
		                                    	${pvo.productPrice}원		  
		                                    </div>
		                                    <br> <!-- <hr> -->
		                                   <div class="font2">${pvo.productInfo}</div>
										</div>
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent font1">
										<c:choose>
											<c:when test="${pvo.productStock == 'y'}">
					 							<div class="text-center" style="color:#4B89DC">구매 가능</div>
											</c:when>
											<c:when test="${pvo.productStock == 'n'}">
												<div class="text-center" style="color:red">품절</div>
											</c:when>
										<c:otherwise>
												<div class="text-center" style="color:#CCCC00">준비 중</div>
										</c:otherwise>
										</c:choose> 
										
									</div>
								</div>
							</div>
							
						
					</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="text-center font1">관련된 상품이 없습니다</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</section>



	<div class="footer">
		<div class="container">
			<div class="row">

				<div class="col-md-3 col-sm-3">
					<div class="single-widget">
						<h2 class="widget-title">About Us</h2>
						<div class="widget-inner">
							<p>서울특별시 종로구 율곡로10길 105 디아망 4F(봉익동 10-1 디아망 4F)</p>
							<p>TEL : 070-8240-3211~3</p>
							<p>FAX : 02-777-5407</p>
							<p>Email: htamall@google.com</p>
							<img src="../images/payment.png" alt="we accept">
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-3">
					<div class="single-widget">
						<h2 class="widget-title">Information</h2>
						<div class="widget-inner">
							<ul>
								<li><a href="???">Frequently Asked Question</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-3">
					<div class="single-widget">
						<h2 class="widget-title">Customer Care</h2>
						<div class="widget-inner">
							<ul>
								<li><a href="???">Contact Us</a></li>
								<li><a href="???">Sitemap</a></li>
								<li><a href="???">Gift Vouchers</a></li>
								<li><a href="???">Live Chat 24x7</a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- jQuery Library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->
	<script src="../js/script.js"></script>
	<script src="../js/scripts.js"></script> 
	
	<!-- 이미지 클릭시 확대 관련 import  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
	
	<script>

/* 	const direct_purchase = function(){
		const conm = confirm('회원전용입니다.');
		console.log(conm); } */
/*			
		if() {
			//바로구매
			const f = document.getElementById('direct_purchase_form');
			f.submit();	
		} else {
			//로그인페이지로 이동
		location.href = 'home.html';
		}	
	}
*/	

	</script>
	
</body>
</html>