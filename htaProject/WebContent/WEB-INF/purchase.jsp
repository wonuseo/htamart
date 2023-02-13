<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="alternate" type="application/json+oembed" href="https://www.jotform.com/oembed/?format=json&amp;url=https%3A%2F%2Fform.jotform.com%2F230398949435470" title="oEmbed Form">
	<link rel="alternate" type="text/xml+oembed" href="https://www.jotform.com/oembed/?format=xml&amp;url=https%3A%2F%2Fform.jotform.com%2F230398949435470" title="oEmbed Form">

<title>Insert title here</title>
	
	<link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/themes/CSS/5e6b428acc8c4e222d1beb91.css?themeRevisionID=5f30e2a790832f3e96009402"/>
	<link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/payment/payment_styles.css?3.3.39213" />
	<link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/css/styles/payment/payment_feature.css?3.3.39213" />
	
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
      
     <!-- 최상단 주문/결제 -->	
        <li id="cid_1" class="form-input-wide" data-type="control_head">
          <div class="form-header-group  header-large">
            <div class="header-text httal htvam">
              <h1 id="header_1" class="form-header" data-component="header">주문/결제</h1>
            </div>
          </div>
        </li>
    
    <!-- 상품 정보 리스트 -->	
        <li class="form-line" data-type="control_payment" id="id_3" data-payment="true">
          <label class="form-label form-label-top" id="label_3" for="input_3"> 상품 정보 </label>
            <div id="cid_3" class="form-input-wide" data-layout="full">
              <div data-wrapper-react="true">
                <div data-wrapper-react="true" class="product-container-wrapper">
                  <div data-wrapper-react="true">
                    <span class="form-product-item hover-product-item1  show_image show_desc new_ui" categories="non-categorized" pid="1004" aria-labelledby="label_3">
                    
                       <c:forEach var="pvo" items="${requestScope.product}" varStatus="status">   
                          <div data-wrapper-react="true" class="form-product-item-detail new_ui">
                                      
                            <div class="p_image">
                              <div class="image_area form-product-image-with-options">
                                <img role="img" aria-label="Cap" alt="Cap Product Image" style="width:100%;height:100%;object-fit:cover" src="../${pvo.productImg }" loading="lazy" />
                              </div>
                            </div>
                                        
                          </div>
                                      
                          <div for="input_3_1004" class="form-product-container">
                            <div class="title_description">
                              <span class="form-product-name" id="product-name-input_3_1004">${pvo.productName }</span>
                                <span class="form-product-description" id="product-name-description-input_3_1004">수량: ${count[status.index] }</span>
                            </div>
                              <input type="hidden" name="cNum" value= ${cNum[status.index] } />         
                              <span class="form-product-details">
                              <b><span data-wrapper-react="true">
                              <span id="input_3_1004_price">${pvo.productPrice * count[status.index]  }</span>
                              <span class="currency_abr">원</span></span></b></span>
                          </div>

                          <c:set var="total" value="${total + pvo.productPrice * count[status.index]  }" />
                          <div class="focus_action_button_container">
                            <a class="btn-inline-product-delete"> </a><a class="btn-inline-product-settings"> </a>
                          </div>
                                      
                          <div class="p_item_separator "></div><span class="form-product-item hover-product-item1  show_image show_desc new_ui" aria-labelledby="label_3">
                        </c:forEach>   
                    
                        <div class="payment_footer new_ui ">
                          <div class="total_area">
                            <div class="form-payment-total">
                              <div id="total-text">총</div>
                              <div class="form-payment-price"><span data-wrapper-react="true"><span id="payment_total">${total }</span><span class="currency_abr">원</span></span></div>
                            </div>
                          </div>
                        </div>

                  </div>
                </div>
              </div>
            </div>
        </li>

<!-- 주문자 이름 -->	
        <li class="form-line" data-type="control_textbox" id="id_29"><label class="form-label form-label-left form-label-auto" id="label_29" for="input_29"> 이름 </label>
          <div id="cid_29" class="form-input" data-layout="half"> 
            <input type="text" id="input_29" name="q29_input29" data-type="input-textbox" class="form-textbox" data-defaultvalue="" style="width:310px" size="310" value=${user.userName } data-component="textbox" aria-labelledby="label_29" /> 
          </div>
        </li>

<!-- 배송지 정보 -->
        <li class="form-line" data-type="control_address" id="id_6"><label class="form-label form-label-left" id="label_6" for="input_6_addr_line1"> 배송지 정보 </label>
          <div id="cid_6" class="form-input" data-layout="full">
            <div summary="" class="form-address-table jsTest-addressField">
              <div class="form-address-line-wrapper jsTest-address-line-wrapperField">
                <span class="form-address-line form-address-street-line jsTest-address-lineField"><span class="form-sub-label-container" style="vertical-align:top">
                  <input type="text" id="input_6_addr_line1" name="q6_shippingAddress[addr_line1]" class="form-textbox form-address-line" data-defaultvalue="" autoComplete="section-input_6 address-line1" value=${user.address } data-component="address_line_1" aria-labelledby="label_6" required="" /></span></span>
              </div>
            </div>
          </div>
        </li>

<!-- 전화번호 -->
        <li class="form-line" data-type="control_phone" id="id_20"><label class="form-label form-label-left form-label-auto" id="label_20" for="input_20_full"> 전화번호 </label>
          <div id="cid_20" class="form-input" data-layout="half"> <span class="form-sub-label-container" style="vertical-align:top">
            <input type="tel" id="input_20_full" name="q20_input20[full]" data-type="mask-number" class="mask-phone-number form-textbox validate[Fill Mask]" data-defaultvalue="" autoComplete="section-input_20 on" style="width:310px" data-masked="true" value=${user.userPhone } data-component="phone" aria-labelledby="label_20" /><label class="form-sub-label is-empty" for="input_20_full" id="sublabel_20_masked" style="min-height:13px" aria-hidden="false"></label></span> 
          </div>
        </li>

<!-- 약관 -->
        <li class="form-line jf-required" data-type="control_widget" id="id_24">
          <div id="cid_24" class="form-input termsAndConditionsV2 jf-required" data-layout="full">
          	<div>
         		 <input type="checkbox" id="terms" name="terms" required> <a href="${pageContext.request.contextPath}/terms.html" target="_blank" style="color:blue;" >구매 약관*</a>에 동의합니다.
         	</div>
          </div>
        </li>
<!-- 주문 버튼 -->
        <li class="form-line" data-type="control_button" id="id_26">
          <div id="cid_26" class="form-input-wide" data-layout="full">
            <div data-align="auto" class="form-buttons-wrapper form-buttons-auto jsTest-button-wrapperField">
              <button id="input_26" type="submit" class="w3-button w3-green w3-round-large" style="width:15%" >주문하기</button>&nbsp&nbsp
              <button id="input_26" type="button" class="w3-btn w3-white w3-border w3-border-green w3-round-large" style="width:15%" onclick="location.href='${pageContext.request.contextPath}/homepage.html'">주문 취소</button>
            </div>
          </div>
        </li>

  </ul>
</div>
</form>

</body>
</html>
