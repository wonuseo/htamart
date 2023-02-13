<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>장바구니</title>

	<style type="text/css">@media print{.form-section{display:inline!important}.form-pagebreak{display:none!important}.form-section-closed{height:auto!important}.page-section{position:initial!important}}</style>
	<link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/themes/CSS/5e6b428acc8c4e222d1beb91.css?themeRevisionID=5f7ed99c2c2c7240ba580251"/>
	<link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/payment/payment_styles.css?3.3.39215" />
	<link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/css/styles/payment/payment_feature.css?3.3.39215" />
	
	
	<script src="https://cdn01.jotfor.ms/static/prototype.forms.js?3.3.39215" type="text/javascript"></script>
	<script src="https://cdn02.jotfor.ms/static/jotform.forms.js?3.3.39215" type="text/javascript"></script>
	<script src="https://cdn03.jotfor.ms/js/vendor/math-processor.js?v=3.3.39215" type="text/javascript"></script>
	
	<!-- 기본 템플릿 css -->
	<link href="../css/cartstyle.css" rel="stylesheet" />
	
	<!-- 비동기 axios -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
	<!-- w3 버튼 디자인 -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
	<script type="text/javascript">	JotForm.newDefaultTheme = true;
		JotForm.extendsNewTheme = false;
		JotForm.singleProduct = false;
		JotForm.newPaymentUIForNewCreatedForms = false;
		JotForm.newPaymentUI = true;
	 	JotForm.init(function(){
		/*INIT-START*/
	      productID = {"0":"input_23_1000","1":"input_23_1001"};
	      paymentType = "product";
	      JotForm.setCurrencyFormat('KRW',true, 'point');
	      JotForm.totalCounter({"input_23_1000":{"price":"10","quantityField":"input_23_quantity_1000_0"},"input_23_1001":{"price":"10.00","quantityField":"input_23_quantity_1001_0"}});
	      $$('.form-product-custom_quantity').each(function(el, i){el.observe('blur', function(){isNaN(this.value) || this.value < 1 ? this.value = '0' : this.value = parseInt(this.value)})});
	      $$('.form-product-custom_quantity').each(function(el, i){el.observe('focus', function(){this.value == 0 ? this.value = '' : this.value})});
	      JotForm.handleProductLightbox();
		/*INIT-END*/
	});

   </script>

</head>
<body onload="cartSize()">
	<!--form 태그 시작-->
  <form class="jotform-form" action="${pageContext.request.contextPath}/purchase/final2" method="post" name="???" id="???" accept-charset="utf-8" autocomplete="on">
  
  	<input type="hidden" name="formID" value="230399113274455" />
    <div role="main" class="form-all">
      <style>
        .form-all:before
        {
          background: none;
        }
      </style>

      <ul class="form-section page-section">

        <!--장바구니 아이콘 + 장바구니 텍스트-->
        <li id="cid_22" class="form-input-wide" data-type="control_head">
          <div style="display:table;width:100%">
            <div class="form-header-group hasImage header-default" data-imagealign="Left">
              <div class="header-logo">
                <img src="https://www.jotform.com/uploads/utkuyildirim/form_files/Screen%20Shot%202020-12-08%20at%2011.53.28.5fcf5bf9415a57.30431619.png" alt="장바구니" width="50" class="header-logo-left" />
              </div>
              <div class="header-text httal htvam">
                <h2 id="header_22" class="form-header" data-component="header">장바구니</h2>
              </div>
            </div>
          </div>
        </li>

        <!--장바구니 물품 리스트-->
        <li class="form-line" data-type="control_payment" id="id_23" data-payment="true"><label class="form-label form-label-top" id="label_23" for="input_23"> </label>
          <div id="cid_23" class="form-input-wide" data-layout="full">
            <div data-wrapper-react="true">
                
                <c:choose>
                	<c:when test="${not empty requestScope.cartList}">
                		<c:forEach items="${requestScope.cartList}" var="cart">
                			<div data-wrapper-react="true">
                				<span class="form-product-item hover-product-item  show_image show_option new_ui" categories="non-categorized" pid="1000" aria-labelledby="label_23">
                			    <div data-wrapper-react="true" class="form-product-item-detail new_ui">
                  				    <div class="p_col">
	                    			    <div class="p_checkbox">
	                      			    <input type="checkbox" class="form-checkbox  form-product-input" id="input_23_1000" name="q23_input23[][id]" value="1000" checked="" aria-label="Selected Product: 제품 이름" />
                             				<div class="checked"></div>
                          					<div class="select_border"></div>
                        				</div>
                      				</div>
			                      	<div class="p_image">
			                    	    <div class="image_area form-product-image-with-options">
			                      	    	<div style="position:absolute;width:100%;height:100%">
			                      	      		<img role="img" aria-label="제품 이름" alt="제품 이름 Product Image" style="width:100%;height:100%;object-fit:cover" src="${pageContext.request.contextPath}/${cart[0].productImg}" loading="lazy" />
			                       	   		</div>
			                      	  	</div>
			                      	</div>
                      
                      				<div for="input_23_1000" class="form-product-container">
                        				<span data-wrapper-react="true">
                          				<div class="title_description">
				                            <span class="form-product-name" id="product-name-input_23_1000">${cart[0].productName }</span>
				                            <span class="form-product-description" id="product-name-description-input_23_1000"></span>
                          				</div>
                          				<span class="form-product-details"><b><span data-wrapper-react="true"><span id="input_23_1000_price1">${cart[0].productPrice * cart[1] }</span><span class="currency_abr">원</span></span></b></span></span>
                        				<span class="form-sub-label-container" style="vertical-align:top">
                        					<label class="form-sub-label" for="input_23_quantity_1000_0" style="min-height:13px" aria-hidden="false">수량</label>
                        					<span class="select_cont">
                        					${cart[1] }
                        					</span>
                        				</span>
	                        				<div class="w3-right-align">
	                        					<button type="button" class="w3-button w3-red w3-round-xlarge" onclick="location.href='${pageContext.request.contextPath}/shoppingCart/delete?cNum=${cart[3] }&&userId=${sessionScope.userId }'">삭제</button>
	                            			</div>
                            			</div>
                            			
                      				<div class="focus_action_button_container">
                      					<a class="btn-inline-product-delete"> </a><a class="btn-inline-product-settings"> </a>
                      				</div>
                    			</div>
                  			</span>
								<input type="hidden" id="p_id" name="p_id" value="${cart[0].productId }" />
								<input type="hidden" id="p_count" name="p_count" value="${cart[1] }" />
								<input type="hidden" id="cNum" name="cNum" value="${cart[3] }" />
                  				<div class="p_item_separator "></div><span class="form-product-item hover-product-item  show_image show_option new_ui" categories="non-categorized" pid="1001" aria-labelledby="label_23"></span>
                    		<c:set var="total" value="${total + cart[0].productPrice * cart[1] }" />
                		
                			</div>
                		</c:forEach>
                	</c:when>
                	
                	<c:otherwise>
                		<div data-wrapper-react="true">
                			장바구니가 비었습니다.
                		</div>
                	</c:otherwise>
                	
                </c:choose>
                
                  <div class="payment_footer new_ui ">
                    <div class="total_area">
                      <div class="form-payment-total">
                        <div id="total-text">총</div>
                        <div class="form-payment-price"><span data-wrapper-react="true"><span id="payment_total1">${total }</span><span class="currency_abr">원</span></span></div>
                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
        </li>
        
<script>
//장바구니에서 checkbox 가 true 인 상품만 컨트롤러로 전송
	function purchase(obj) {
		if(obj.elements['q23_input23[][id]'].length != 0) {
			for (i=0; i<obj.elements['q23_input23[][id]'].length; i++) {
				if(obj.elements['q23_input23[][id]'][i].checked==false) {
					obj.elements['p_id'][i].disabled=true;
					obj.elements['p_count'][i].disabled=true;
				}
			}
		} 
		obj.submit();
	}
//onload 로 즉시 실행. 장바구니의 길이가 0 이면 상품 주문 버튼 disabled	
	function cartSize() {
		if(document.querySelectorAll(".form-checkbox").length == 0) {
			//document.getElementById("input_55").style.display="none";
			document.getElementById("input_55").disabled=true;
		}
	}
</script>        
        
        <!--상품 주문 버튼-->
        <li class="form-line" data-type="control_button" id="id_54">
          <div id="cid_54" class="form-input-wide" data-layout="full">
            <div data-align="center" class="form-buttons-wrapper form-buttons-center   jsTest-button-wrapperField">
              <input type="hidden" id="u_id" name="u_id" value="${sessionScope.userId }">
              <button id="input_55" class="w3-button w3-green w3-round-large" style="width:15%" onclick="purchase(this.form)">상품 주문</button>&nbsp&nbsp
              <button id="input_54" type="button" class="w3-btn w3-white w3-border w3-border-green w3-round-large" style="width:15%" onclick="location.href='${pageContext.request.contextPath}/homepage.html'">쇼핑 계속하기</button>
            </div>
          </div>
        </li>
       
      </ul>
    </div>
   
  </form>
</body>
</html>