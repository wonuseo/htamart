# Spring Project : HTA_mall
스프링을 이용한 쇼핑몰 사이트 입니다.
## :hourglass: Develop Period
23.02.01 (09:00) ~ 23.02.16 (16:00)
## :hammer_and_wrench: Tech Stack
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)
## :runner: Team Memmber
- Joo young Kim
- Han byeol Kim
- Won woo Seo
- Jun soo Lee
- Sung hwan Cho
- Seong min Cho
- Won jun Jung
## :open_book: Main Functions
>
> * JPA에서 다양한 sql 문을 사용하여 사용자가 제시한 조건에 맞는 데이터를 출력할 수 있도록 설계.
> * 저러한 기능이 있습니다!

***
## :open_book: Summary 
> ### :돋보기: 검색 기능
>
> 이미지
>
> 이러한걸 사용하여 검색 기능을 구현했습니다.

> ### :page_with_curl:결제 <p>
<img src="https://user-images.githubusercontent.com/122374054/219255479-7cdc5a76-a4a7-4b9b-af99-dbf480f2e355.png" width="500" height="500"/> <img src="https://user-images.githubusercontent.com/122374054/219257489-c18f827e-4316-4f66-be23-fdcd84b47b0a.png" width="400" heigth="400"/>

```js
<li id="cid_1" class="form-input-wide" data-type="control_head">
     <div class="form-header-group  header-large">
        <div class="header-text httal htvam">
    주문자 : ${name}<br>
		전화번호 : ${tel}<br>
		주소 : ${address}<br></h1>
      </div>
     </div>
   </li>
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
           <span class="form-product-details">
             <b><span data-wrapper-react="true">
                <span id="input_3_1004_price">${obj.product.productPrice * obj.productCount}</span>
                <span class="currency_abr">원</span></span></b></span>
						 </div>
	<c:set var="total" value="${total + obj.product.productPrice * obj.productCount}" />
      <div class="focus_action_button_container">
         <a class="btn-inline-product-delete"> </a><a class="btn-inline-product-settings"> </a>
      </div>
  
	<li class="form-line" data-type="control_button" id="id_26">
          <div id="cid_26" class="form-input-wide" data-layout="full">
            <div data-align="auto" class="form-buttons-wrapper form-buttons-auto jsTest-button-wrapperField">
              <button id="input_26" type="button" class="w3-btn w3-white w3-border w3-border-green w3-round-large" style="width:15%" 	
	      onclick="location.href='${pageContext.request.contextPath}/homepage.html'">메인으로</button>             
            </div>
          </div>
        </li>    
```  
장바구니 및 바로 구매 에서 받아온 정보를 출력하고, 주문자의 정보를 보여주며 결제를 진행하면 영수증 페이지로 넘어가고 영수증 페이지에서 결제를 끝마침으로서 버튼을 눌러 메인 홈페이지로 돌아갈수 있습니다.

<br/><br/>
