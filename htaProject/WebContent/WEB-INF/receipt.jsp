<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="alternate" type="application/json+oembed" href="https://www.jotform.com/oembed/?format=json&amp;url=https%3A%2F%2Fform.jotform.com%2F230398949435470" title="oEmbed Form">
<link rel="alternate" type="text/xml+oembed" href="https://www.jotform.com/oembed/?format=xml&amp;url=https%3A%2F%2Fform.jotform.com%2F230398949435470" title="oEmbed Form">

<title>구매 완료 영수증</title>

<link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/themes/CSS/5e6b428acc8c4e222d1beb91.css?themeRevisionID=5f30e2a790832f3e96009402"/>
	<link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/payment/payment_styles.css?3.3.39213" />
	<link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/css/styles/payment/payment_feature.css?3.3.39213" />
	
	<link rel="icon" href="${pageContext.request.contextPath}/assets/favicon.png"/>
	<!-- w3 버튼 디자인 -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css" id="form-designer-style">
    /* Injected CSS Code */
.form-label.form-label-auto {
        display: inline-block;
        float: left;
        text-align: left;
      }
</style>

<script src="https://cdn01.jotfor.ms/static/prototype.forms.js?3.3.39213" type="text/javascript"></script>
	<script src="https://cdn02.jotfor.ms/static/jotform.forms.js?3.3.39213" type="text/javascript"></script>
	<script src="https://cdn03.jotfor.ms/js/vendor/jquery-1.8.0.min.js?v=3.3.39213" type="text/javascript"></script>
	<script defer src="https://cdn01.jotfor.ms/js/vendor/maskedinput.min.js?v=3.3.39213" type="text/javascript"></script>
	<script defer src="https://cdn02.jotfor.ms/js/vendor/jquery.maskedinput.min.js?v=3.3.39213" type="text/javascript"></script>
	<script src="https://js.jotform.com/vendor/postMessage.js?3.3.39213" type="text/javascript"></script>
	<script src="https://js.jotform.com/WidgetsServer.js?v=1676046552028" type="text/javascript"></script>

</head>
<body>
		<!-- form태그 시작 -->
	<form class="jotform-form" action="${pageContext.request.contextPath}/purchase/receipt" method="post" name="???" id="???" accept-charset="utf-8" autocomplete="on">
 	 <input type="hidden" name="formID" value="230398949435470" />
   <div role="main" class="form-all">
    <style>
      .form-all:before
      {
        background: none;
      }
    </style>
      <ul class="form-section page-section">
		
		
		
		<li id="cid_1" class="form-input-wide" data-type="control_head">
          <div class="form-header-group  header-large">
            <div class="header-text httal htvam">
              <h1 id="header_1" class="form-header" data-component="header">구매가 완료되었습니다</h1>
            </div>
          </div>
        </li>
        
        
		<li id="cid_1" class="form-input-wide" data-type="control_head">
          <div class="form-header-group  header-large">
            <div class="header-text httal htvam">
                  주문자 : ${name}<br>
		전화번호 : ${tel}<br>
		주소 : ${address}<br></h1>
            </div>
          </div>
        </li>
		
		 <li class="form-line" data-type="control_payment" id="id_3" data-payment="true">
          <label class="form-label form-label-top" id="label_3" for="input_3"> 상품 정보 </label>
            <div id="cid_3" class="form-input-wide" data-layout="full">
              <div data-wrapper-react="true">
                <div data-wrapper-react="true" class="product-container-wrapper">
                  <div data-wrapper-react="true">
                    <span class="form-product-item hover-product-item1  show_image show_desc new_ui" categories="non-categorized" pid="1004" aria-labelledby="label_3">
		
		
		
		<c:choose>
			<c:when test="${type == 'one'}">
				
				 <div data-wrapper-react="true" class="form-product-item-detail new_ui">
                                      
                            <div class="p_image">
                              <div class="image_area form-product-image-with-options">
                                <img role="img" aria-label="Cap" alt="Cap Product Image" style="width:100%;height:100%;object-fit:cover" src="${pageContext.request.contextPath}/${product.productImg }" loading="lazy" />
                              </div>
                            </div>
                                        
                          </div>
                          
                          <div for="input_3_1004" class="form-product-container">
                          <div class="title_description">
                              <span class="form-product-name" id="product-name-input_3_1004">${product.productName}</span>
                                <span class="form-product-description" id="product-name-description-input_3_1004">수량: ${count}</span>
                            </div>
						 </div>
				
				
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.receipt}" var="obj">
					<br>
					
					<div data-wrapper-react="true" class="form-product-item-detail new_ui">
                                      
                            <div class="p_image">
                              <div class="image_area form-product-image-with-options">
                                <img role="img" aria-label="Cap" alt="Cap Product Image" style="width:100%;height:100%;object-fit:cover" src="${pageContext.request.contextPath}/${obj.product.productImg}" loading="lazy" />
                              </div>
                            </div>
                                        
                          </div>
					
					 <div for="input_3_1004" class="form-product-container">
                          <div class="title_description">
                              <span class="form-product-name" id="product-name-input_3_1004">${obj.product.productName}</span>
                                <span class="form-product-description" id="product-name-description-input_3_1004">수량: ${obj.productCount}</span>
                            </div>
						 </div>
					
					
					
					
					
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	 
	
	
	
	</div>
	</div>
	</div>
	</div>
	</li>
	
	<li class="form-line" data-type="control_button" id="id_26">
          <div id="cid_26" class="form-input-wide" data-layout="full">
            <div data-align="auto" class="form-buttons-wrapper form-buttons-auto jsTest-button-wrapperField">
              <button id="input_26" type="button" class="w3-btn w3-white w3-border w3-border-green w3-round-large" style="width:15%" onclick="location.href='${pageContext.request.contextPath}/homepage.html'">메인으로</button>
            </div>
          </div>
        </li>
	
	</ul>
	</div>
	</form>
</body>
</html>