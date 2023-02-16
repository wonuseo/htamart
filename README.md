# Spring Project : HTA_mall
스프링을 이용한 쇼핑몰 사이트 입니다.
<br/><br/>

## :hourglass: Develop Period
23.02.01 (09:00) ~ 23.02.16 (16:00)
<br/><br/>

## :hammer_and_wrench: Tech Stack
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)
<br/><br/>

## :runner: Team Memmber
- Joo young Kim
- Han byeol Kim
- Won woo Seo
- Jun soo Lee
- Sung hwan Cho
- Seong min Cho
- Won jun Jung
<br/><br/>

## :gear: Main Functions
> ### :memo: 회원가입/로그인
>
> <img src="https://user-images.githubusercontent.com/87034370/219252111-33d2229b-5933-45fa-8503-1f176f040132.png" width="40%" height="30%" title="px(픽셀) 크기 설정" alt="RubberDuck"></img><img src="https://user-images.githubusercontent.com/87034370/219252141-48091c15-7e04-4248-a7d2-675e67baf24e.png" width="40%" height="30%" title="px(픽셀) 크기 설정" alt="RubberDuck"></img><br/>
> ```java
> public void createUser(User user) throws Exception {
>		EntityManager em = DBUtil.getEntityManager();
>		EntityTransaction tx = em.getTransaction();
>		try {
>			tx.begin();
>			user.setUserDate(new Date());
>			em.persist(user);
>			tx.commit();
>		} finally {
>			em.close();
>		}
> } 
> public boolean checkId(String userId) throws Exception {
>		EntityManager em = DBUtil.getEntityManager();
>		Long count = null;
>		try {
>			count = em.createQuery("select count(u) from User u where u.userId = :userId", Long.class)
>					.setParameter("userId", userId)
>					.getSingleResult();
>		} finally {
>			em.close();
>		}	
>		return count == 0;
>	}
>
> public boolean validateUser(String userId, String userPassword) throws Exception{
>		EntityManager em = DBUtil.getEntityManager();		
>		Long count = null;
>		try {
>			count = em.createQuery("select count(u) from User u where u_id = :u_id and u_password = :u_password", Long.class)
>					.setParameter("u_id", userId)
>					.setParameter("u_password", userPassword)
>					.getSingleResult();		
>		} finally {
>			em.close();			
>		}		
>		return count == 1;
>	}
> ```
> <br/><br/>
> ```js
> function dedupId() {
>		axios.post('userinfo/dedupId', {}, {
>			params : {
>				u_id : document.getElementById("userId").value
>			}
>		})
>		 .then(function (resData) {
>			 validate(resData['data']);
>		 })
>	}
>	function validate(val) {
>		const userId = document.getElementById("userId").value;	
>		if(userId == ""){
>			alert('아이디를 입력하세요');
>			return;
>		}else if(val == true) {
>			alert('사용가능한 아이디 입니다.')
>			document.getElementById("submit").disabled=false;
>			document.getElementById("userId").readOnly=true;
>		}else {
>			alert('이미 존재하는 아이디 입니다.');
>		}
>	}
>	function login(obj) {
>		axios.post('userinfo/validateUser', {}, {
>			params : {
>				userId : document.getElementById("userId1").value,
>				userPassword : document.getElementById("userPassword1").value
>			}
>		})
>		 .then(function (resData) {
>			 if(resData['data'] == true) {
>				 obj.submit();
>			 }else{
>				 alert('아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.');
>			 }
>		 })
>	}
> ```
> <br/>
> 첫번째 코드는 회원가입/로그인의 중복체크와 검증의 주요 로직입니다. <br/>
> 두번쨰 코드로 검증로직을 비동기로 사용하고 있습니다.
<br/><br/>


## :open_book: Summary 
> * 아이디 중복체크를 하지 않으면 회원가입을 할 수 없습니다.
> * 로그인이 성공적으로 진행되면 세션을 유지 시키고, 로그아웃으로 세션을 해제합니다.
> * 전체 카테고리와 검색, 슬라이드쇼를 통해 상품목록으로 이동합니다.
> * 추천상품, 상품목록의 이름으로 상품 상세 페이지로 이동합니다.
> * 상세 페이지에서 수량, 바로 구매와 장바구니로 결제 방식을 선택 할 수 있습니다.
> * 장바구니에서 담은 상품을 선택적으로 구매 가능합니다.
> * 주문/결제 시 자동으로 로그인된 고객의 정보가 들어가며 수정 가능합니다.
<br/><br/>

