<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="alternate" type="application/json+oembed" href="https://www.jotform.com/oembed/?format=json&amp;url=https%3A%2F%2Fform.jotform.com%2F230398949435470" title="oEmbed Form">
<link rel="alternate" type="text/xml+oembed" href="https://www.jotform.com/oembed/?format=xml&amp;url=https%3A%2F%2Fform.jotform.com%2F230398949435470" title="oEmbed Form">

<title>purchase form</title>

<style type="text/css">@media print{.form-section{display:inline!important}.form-pagebreak{display:none!important}.form-section-closed{height:auto!important}.page-section{position:initial!important}}</style>
<link type="text/css" rel="stylesheet" href="https://cdn01.jotfor.ms/themes/CSS/5e6b428acc8c4e222d1beb91.css?themeRevisionID=5f30e2a790832f3e96009402"/>
<link type="text/css" rel="stylesheet" href="https://cdn02.jotfor.ms/css/styles/payment/payment_styles.css?3.3.39204" />
<link type="text/css" rel="stylesheet" href="https://cdn03.jotfor.ms/css/styles/payment/payment_feature.css?3.3.39204" />

<style type="text/css" id="form-designer-style">
    /* Injected CSS Code */
.form-label.form-label-auto {
        
        display: inline-block;
        float: left;
        text-align: left;
      
      }
    /* Injected CSS Code */
</style>
</head>
<body>
		<!-- form태그 시작 -->
		<form class="jotform-form" action="???" method="post" name="???" id="???" accept-charset="utf-8" autocomplete="on">
	    <input type="hidden" name="formID" value="???" />
	    <input type="hidden" id="JWTContainer" value="???" />
	    <input type="hidden" id="cardinalOrderNumber" value="???" />

    <div role="main" class="form-all">
      <style>
        .form-all:before
        {
          background: none;
        }
      </style>
      <ul class="form-section page-section">
        
        <!--최상단 주문/결제-->
        <li id="cid_1" class="form-input-wide" data-type="control_head">
          <div class="form-header-group  header-large">
            <div class="header-text httal htvam">
              <h1 id="header_1" class="form-header" data-component="header">주문/결제</h1>
            </div>
          </div>
        </li>
	
        <!--상품 정보 리스트-->
        <li class="form-line" data-type="control_payment" id="id_3" data-payment="true"><label class="form-label form-label-top" id="label_3" for="input_3"> 상품 정보 </label>
          <div id="cid_3" class="form-input-wide" data-layout="full">
            <div data-wrapper-react="true">
              <div data-wrapper-react="true" class="product-container-wrapper">
            
                <div data-wrapper-react="true"><span class="form-product-item hover-product-item  show_image show_desc new_ui" aria-labelledby="label_3">
                   
                   <c:forEach items="${requestScope.product}" var="pvo">   
                   		<div data-wrapper-react="true" class="form-product-item-detail new_ui">
                   		
                   			<div class="p_image">
                   				<div class="image_area form-product-image-with-options">
                   					<img role="img" aria-label="Cap" alt="Cap Product Image" style="width:100%;height:100%;object-fit:cover" src="../${pvo.p_img }" loading="lazy" />
                   				</div>
                   			</div>
                   			
                   		</div>
                   		
                   		<div for="input_3_1004" class="form-product-container">
                   			<div class="title_description">
                   				 <span class="form-product-name" id="product-name-input_3_1004">${pvo.p_name }</span>
	                            <span class="form-product-description" id="product-name-description-input_3_1004">수량: ${count }</span>
                   			</div>
                   			
                   			<span class="form-product-details">
	                            <b><span data-wrapper-react="true">
	                                <span id="input_3_1004_price">${pvo.p_price * count }</span>
	                                <span class="currency_abr">원</span></span></b>
	                              </span>
                   		</div>
                   		<c:set var="total" value="${total + pvo.p_price * count }" />
                   		<div class="focus_action_button_container"><a class="btn-inline-product-delete"> </a><a class="btn-inline-product-settings"> </a></div>
                   		
                   		<div class="p_item_separator "></div><span class="form-product-item hover-product-item  show_image show_desc new_ui" aria-labelledby="label_3">
                   </c:forEach>           
                   
                   
                  <div class="payment_footer new_ui ">
                    <div class="total_area">
                      <div class="form-payment-total">
                        <div id="total-text">Total</div>
                        <div class="form-payment-price"><span data-wrapper-react="true"><span id="payment_total">${total }</span><span class="currency_abr">원</span></span></div>
                      </div>
                    </div>
                  </div>

                </div>
                
              </div>
            </div>
          </div>
        </li>

        <!--이메일 입력-->
        <li class="form-line" data-type="control_email" id="id_5"><label class="form-label form-label-left" id="label_5" for="input_5"> 이메일 </label>
          <div id="cid_5" class="form-input" data-layout="half"> 
            <input type="email" id="input_5" name="q5_yourEmail" class="form-textbox validate[Email]" data-defaultvalue="" style="width:310px" size="310" value="" placeholder="주문 정보를 받을 이메일 ex:  email@mail.com" data-component="email" aria-labelledby="label_5" /> 
          </div>
        </li>

        <!--주소 입력-->
        <li class="form-line" data-type="control_address" id="id_6"><label class="form-label form-label-left" id="label_6" for="input_6_addr_line1"> 배송지 정보 </label>
          <div id="cid_6" class="form-input" data-layout="full">
            <div summary="" class="form-address-table jsTest-addressField">
              <div class="form-address-line-wrapper jsTest-address-line-wrapperField">
                <span class="form-address-line form-address-street-line jsTest-address-lineField">
                  <span class="form-sub-label-container" style="vertical-align:top">
                    <input type="text" id="input_6_addr_line1" name="q6_shippingAddress[addr_line1]" class="form-textbox form-address-line" data-defaultvalue="" autoComplete="section-input_6 address-line1" value="" data-component="address_line_1" aria-labelledby="label_6" required="" />
                  </span>
                </span>
              </div>
            </div>
          </div>
        </li>

        <!--전화번호 입력-->
        <li class="form-line" data-type="control_phone" id="id_20"><label class="form-label form-label-left form-label-auto" id="label_20" for="input_20_full"> 전화번호 </label>
          <div id="cid_20" class="form-input" data-layout="half"> 
            <span class="form-sub-label-container" style="vertical-align:top">
              <input type="tel" id="input_20_full" name="q20_input20[full]" data-type="mask-number" class="mask-phone-number form-textbox validate[Fill Mask]" data-defaultvalue="" autoComplete="section-input_20 on" style="width:310px" data-masked="true" value="" placeholder="010-1234-5678" data-component="phone" aria-labelledby="label_20" /><label class="form-sub-label is-empty" for="input_20_full" id="sublabel_20_masked" style="min-height:13px" aria-hidden="false"></label>
            </span> 
          </div>
        </li>

        <!--submit-->
        <li class="form-line" data-type="control_button" id="id_2">
          <div id="cid_2" class="form-input-wide" data-layout="full">
            <div data-align="auto" class="form-buttons-wrapper form-buttons-auto   jsTest-button-wrapperField">
            	<button id="input_2" type="submit" class="form-submit-button submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content="">주문하기</button>
            	<button id="input_2" type="button" class="form-submit-button submit-button jf-form-buttons jsTest-submitField" data-component="button" data-content="">주문취소</button>
            </div>
          </div>
        </li>

        <li style="display:none">Should be Empty: <input type="text" name="website" value="" /></li>

      </ul>
    </div>

  </form>
</body>
</html>
