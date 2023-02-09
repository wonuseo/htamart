<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>list</title>

	<link rel="icon" href="./images/favicon.png" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

	<!-- Google Font -->

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">


    <link rel="stylesheet" href="../css/style.css">

    <link rel="stylesheet" href="../css/responsive.css">
    
	<!-- --------------------------------------------------- -->
	<!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/liststyles.css" rel="stylesheet" />
    
    <!-- sticky jQuery -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    <script>
	    $(document).ready(function(){
	    	  var currentPosition = parseInt($(".quickmenu").css("top"));
	    	  $(window).scroll(function() {
	    	    var position = $(window).scrollTop(); 
	    	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
	    	  });
	    	});
    </script>
    
<style>
div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
a {text-decoration:none;}

.quickmenu {position:absolute;width:90px;top:50%;margin-top:-50px;right:10px;background:#fff;}
.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
.quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
.quickmenu ul li a:hover {color:#000;}
.quickmenu ul li:last-child {border-bottom:0;}
</style>

</head>
<body>
	
	
	<!-- 최상단 바 -->
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
                            <li><a href="???"><i class="fa fa-user"></i>&nbsp로그인</a></li>
                            <li><a href="???"><i class="fa fa-lock"></i>&nbsp회원가입</a></li>
                            <li><a href="???"><i class="fa fa-shopping-bag"></i>&nbsp장바구니</a></li>
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
                        <a href="/htaProject/homepage.html"><img src="../images/HTAlogo.png" alt="Orani E-shop" style="width:60%;height:auto;"></a>
                    </div>
                </div>

                <div class="col-md-7 col-sm-5">
                    <div class="search-form">
                        <form class="navbar-form" role="search">
                            <div class="form-group">
                              <input type="text" class="form-control" placeholder="상품 검색">
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
                    
                   	<li><a href="${pageContext.request.contextPath }/category/list?cat=fruit">과일</a></li>
                    <li><a href="${pageContext.request.contextPath }/category/list?cat=vegetable">채소</a></li>
                    
                    <li role="separator" class="divider"></li>
                    
                    <li><a href="${pageContext.request.contextPath }/category/list?cat=meat">정육</a></li>
                    <li><a href="${pageContext.request.contextPath }/category/list?cat=seafood">수산물/건해산</a></li>

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
    
    <!-- sticky -->
    <div class="quickmenu">
	  <ul>
	    <li><a href="#">등급별혜택</a></li>
	    <li><a href="#">1:1문의</a></li>
	    <li><a href="#">후기</a></li>
	  </ul>
	</div>
    
    <!-- 물품 리스트 -->
    <div class="List">
    	
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row1 gx-4 gx-lg-5 row1-cols-2 row1-cols-md-3 row1-cols-xl-4 justify-content-center">
                
                	<c:forEach items="${requestScope.allData}" var="product">
                	
                		<div class="col mb-5">
	                        <div class="card h-100">
	                            <!-- Product image-->
	                            <img class="card-img-top" src="../${product.getP_img() }" alt="..." />
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder">${product.getP_name() }</h5>
	                                    <!-- Product price-->
	                                    ${product.getP_price() }원
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="???">물품 상세 보기</a></div>
	                            </div>
	                        </div>
                    	</div>
                		
                	</c:forEach>
                		
                </div>
            </div>
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
    
	
	<!-- jQuery Library -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->

	<script src="../js/script.js"></script>
	
</body>

</html>