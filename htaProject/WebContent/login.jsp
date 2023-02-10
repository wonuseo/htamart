<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.html</title>
​
<link rel="stylesheet" href="css/login.css">
​
</head>
​
<body>
​
	<div id="container" class="container">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
					<div class="form sign-up">
					
					<form action="userinfo/createUser" method="post">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							 <input type="text" id="userId" name="userId" placeholder="Username"  maxlength="10" pattern="^[a-zA-Z0-9]+$" required >
						</div>
						
						<div class="input-group">
							<input type="password" id="userPassword" name="userPassword" placeholder="Password"  maxlength="10" pattern="^[a-zA-Z0-9]+$" required>
						</div>
						
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> 
							<input type="text" id="uName" name="uName" placeholder="Name" maxlength="10" pattern="^[a-zA-Z가-힣]+$" required>
						</div>
						
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> 
							<input type="text" id="uName" name="uPhone" placeholder="PhoneNumber" maxlength="20" pattern="^[0-9]+$" required>
						</div>
						
						<div class="input-group">
							<i class='bx bx-mail-send'></i>
							 <input type="text" id="address" name="address" placeholder="Address" maxlength="20" pattern="^[a-zA-Z가-힣0-9]+$" required>
						</div>
						
						
						<button type="submit">Sign up</button>
					</form>
						
						<p>
							<span> Already have an account? </span> <b onclick="toggle()"
								class="pointer"> Sign in here </b>
						</p>
					</div>
				</div>
​
			</div>
			<!-- END SIGN UP -->
			
			<!-- SIGN IN -->
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
				
					<div class="form sign-in">
						<form action="userinfo/login" method="post">
							<div class="input-group">
								<i class='bx bxs-user'></i> 
								<input type="text" id="userId" name="userId" placeholder="Username" maxlength="10" pattern="^[a-zA-Z0-9]+$" required> 
							</div>
							
							<div class="input-group">
								<i class='bx bxs-lock-alt'></i> 
								<input type="password" id="userPassword" name="userPassword" placeholder="Password"  maxlength="10" pattern="^[a-zA-Z0-9]+$" required>
							</div>
							
							<button type="submit" nclick="location.href='homepage.html'">Sign in</button>
						</form>
						
						<p>
							<b> Forgot password? </b>
						</p>
						<p>
							<span> Don't have an account? </span> <b onclick="toggle()"
								class="pointer"> Sign up here </b>
						</p>
					</div>
				</div>
				<div class="form-wrapper"></div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>Welcome</h2>
​
				</div>
				<div class="img sign-in"></div>
			</div>
			<!-- END SIGN IN CONTENT -->
			
			
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up"></div>
				<div class="text sign-up">
					<h2>Join with us</h2>
​
				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
	</div>
	
<script src="js/login.js"></script>
​
</body>
</html>