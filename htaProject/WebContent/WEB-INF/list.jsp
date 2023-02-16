<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>list</title>

	<link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.png"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	
	<!-- Google Font -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
	
	<!-- 기본 홈페이지 템플릿 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    
	<!-- 리스트 템플릿 css-->
    <link href="${pageContext.request.contextPath}/css/liststyles.css" rel="stylesheet" />
    
    <!-- 이미지 클릭시 확대 관련 import  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">

<style>
#logout_btn {
	display: none;
}

div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.quickmenu {position:absolute;width:90px;top:50%;margin-top:-50px;right:10px;background:#fff;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
.quickmenu ul li a:hover {color:#000;}
.quickmenu ul li:last-child {border-bottom:0;}

.content {position:relative;min-height:1000px;}
</style>

</head>
<body onload="validLogin()">
	
	<div class="top-bar">

        <div class="container">
            <div class="row">
            
                <div class="col-md-6">
                    <div class="social pull-left">

                        <ul>
                            <li><a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="https://www.twitter.com" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="https://www.google.com" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="https://www.naver.com" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="action pull-right">

                        <ul>

                            <li><a id="login_btn" href="${pageContext.request.contextPath}/login.html"><i class="fa fa-user"></i>&nbsp로그인/회원가입</a></li>
							<li><a id="logout_btn" href="${pageContext.request.contextPath}/userinfo/sessionOut"><i class="fa fa-user"></i>&nbsp로그아웃</a></li>
							<li><a id="shoppingCart" href="${pageContext.request.contextPath}/shoppingCart/showCart?userId=${sessionScope.userId}"><i class="fa fa-shopping-bag"></i>&nbsp장바구니</a></li>

                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    
	<!-- 헤더 -->
    <div class="header">
        <div class="container">
            <div class="row">
            
                <div class="col-md-3 col-sm-4">

                    <div class="logo">
                        <a href="${pageContext.request.contextPath}/homepage.html"><img src="${pageContext.request.contextPath}/images/HTAlogo.png" alt="Orani E-shop" style="width:60%;height:auto;"></a>

                    </div>
                </div>

                <div class="col-md-7 col-sm-5">
                    <div class="search-form">
                        <form action="${pageContext.request.contextPath}/SearchController/productsearch" class="navbar-form" role="search">
                            <div class="form-group">
                              <input type="text" name="keyword" class="form-control" placeholder="상품 검색">
                            </div>
                            <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>

                <div class="col-md-2 col-sm-3">
                    <div class="cart">
                        <div class="cart-icon">
                            <a href="???"><i class="fa fa-question-circle"></i></a>
                        </div>
                        <div class="cart-text">
                            	 고객 센터<br>
                        	          평일 : 09:00 ~ 18:00 (월~금)
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
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
                <span class="sr-only">Menu</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>

            <div class="shop-category nav navbar-nav navbar-left">
                <div class="btn-group">

                  <button type="button" class="btn btn-shop-category dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   	 전체 카테고리 <span class="caret"></span>
                  </button>

                  <ul class="dropdown-menu">
                    
                   	<li><a href="${pageContext.request.contextPath}/category/list?cat=fruit">과일</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/list?cat=vegetable">채소</a></li>
                    
                    <li role="separator" class="divider"></li>
                    
                    <li><a href="${pageContext.request.contextPath}/category/list?cat=meat">정육</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/list?cat=seafood">수산물/건해산</a></li>

                  </ul>
                </div>
            </div>

			<!-- 네비게이션 바 오른쪽 클릭 + 하이퍼링크 -->
            <div class="collapse navbar-collapse" id="navbar">
              <ul class="nav navbar-nav navbar-right">
               
                <li><a href="https://www.jhta.co.kr/main">회사 소개</a></li>

              </ul>
            </div>
            
          </div>
        </nav>
    </div>
    
    <div class="List">
		<!-- Section-->
        <section class="py-5">
        		<c:choose>
					<c:when test="${not empty requestScope.productallData}">
		                <div class="container px-4 px-lg-5 mt-5">
		         		
		                <div class="row1 gx-4 gx-lg-5 row1-cols-2 row1-cols-md-3 row1-cols-xl-4 justify-content-center">
		                
		                	<c:forEach items="${requestScope.productallData}" var="pvo">
		                		
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
		                                    <!-- 조건문 사용해서 해당 상품이 품절 or준비 중이면 자바스크립트 알림창으로 못넘어가게 제어 | 구매 가능이면 링크타고 넘어가게 제어 -->
		                                    <c:choose>
												<c:when test="${pvo.productStock == 'y'}">
													<a class="a font2" href="${pageContext.request.contextPath}/productView/details?p_id=${pvo.productId}" > 
		                                    	 		<h4 class="fw-bolder">${pvo.productName}</h4> 
		                                    		</a>
												</c:when>
												<c:when test="${pvo.productStock == 'n'}">
													<a class="a font2" href="javascript:Accesscont()" > 
		                                    	 		<h4 class="fw-bolder">${pvo.productName}</h4> 
		                                    		</a>
												</c:when>
												<c:otherwise>
													<a class="a font2" href="javascript:Accesscont2()" > 
		                                    	 		<h4 class="fw-bolder">${pvo.productName}</h4> 
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
							</div>
						</div>
							</c:when>
							<c:otherwise>
							 <div class="text-center font1">
							 	검색하신 상품이 없습니다
							 </div>
							</c:otherwise>
						</c:choose>
                 </section>   
                </div>
	
	<!-- 최하단 푸터 -->	
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
                            <img src="${pageContext.request.contextPath}/images/payment.png" alt="we accept">
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-3">
					<div class="single-widget">
						<h2 class="widget-title">Team Member</h2>
						<div class="widget-inner">
							<p>Joo young Kim</p>
							<p>Han byeol Kim </p>
							<p>Won woo Seo </p>
							<p>Junsu Lee </p>
							<p>Sung hwan Cho </p>
							<p>Sung min Cho </p>
							<p>Won jun Jung </p>										
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
					<div class="single-widget">
						<h2 class="widget-title">Introduction</h2>
						<div class="widget-inner">						
							<p>The purpose of our team is to improve individual abilities. 
							It's ironic that we teamed up to improve our individual abilities,
							but this was definitely a great opportunity for us and we did our best. 
							Thank you for visiting.</p>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <!-- 스크롤 따라다니는 창 -->
	 <div class="quickmenu">
  			<ul>
			    <li><a href="${pageContext.request.contextPath}/homepage.html">홈페이지</a></li>
			    <li><a href="#">1:1문의</a></li>
			    <li><a href="#">후기</a></li>
  			</ul>
	</div>
	
	<!-- jQuery Library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script> 
	
	<!-- 이미지 클릭시 확대 관련 import  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
	
	<script>
		$(document).ready(function(){
		  var currentPosition = parseInt($(".quickmenu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		  });
		});
	</script>
	
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
	
	<!-- 비동기 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.0/axios.min.js"></script>
	
    <!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
</body>

</html>