<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<title>Login Form</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="css/loginStyle.css">
	
	<!--  add integrity and crossorigin to Bootstrap CDN link -->
	
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ775/zl5x2Q5iZ6jIW3j0RSJoZ+nNQ8+9k"
	crossorigin="anonymous">

	
	<!--  Adding SRI (Sub Resource Integrity to Jquery -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	 integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	  crossorigin="anonymous"></script>
	  
	  <!-- Optional: SRI added for Font Awesome CDN to enhance security -->
	
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlgC7n5R9E2f5k5j5c5e5f5f5f5f5f5f5f5f5f5f5f5f"
	crossorigin="anonymous">

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-md-6 d-none d-md-block image-container"></div>

			<div class="col-lg-6 col-md-6 form-container">
				<div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box text-center">
					<div class="logo mb-3">
						<img src="images/favicon.png" width="50px">
					</div>
					<div class="heading mb-4">
						<h4>Login into your account</h4>
					</div>
					<form method = "post" action = "LoginServlet">
					<!--   STEP 2 (ADD CSRF TOKEN) -->
					<input type="hidden" name="csrfToken" value="${csrfToken}">
						<div class="form-input">
							<span><i class="fa fa-envelope"></i></span>
							<input type="email" name = "email" placeholder="Email Address" required>
						</div>
						<div class="form-input">
							<span><i class="fa fa-lock"></i></span>
							<input type="password" name = "password" placeholder="Password" required>
						</div>
						<div class="row mb-3">
							<div class="col-6 d-flex">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="cb1">
									<label class="custom-control-label text-white" for="cb1">Remember me</label>
								</div>
							</div>
							<div class="col-6 text-right">
								<a href="forget.html" class="forget-link">Forget Password</a>
							</div>
							
							
						</div>
						<div class="text-left mb-3">
							<button type="submit" class="btn">Login</button>
						</div>
						<div class="text-center mb-2">
							<div class="mb-3" style="color: #777"></div>

							<a href="" class="btn btn-social btn-facebook">facebook</a>

							<a href="https://accounts.google.com/o/oauth2/v2/auth?client_id=721085556144-mqt7r1t19j25ar9kd73mmi1h5alfcao2.apps.googleusercontent.com&redirect_uri=http://localhost:8081/OFOS/google-login&response_type=code&scope=email%20profile"
							class="btn btn-social btn-google">Login with Google
							</a> 
							
							<a href="" class="btn btn-social btn-twitter">twitter</a>
						</div>
						<div style="color: #777">Don't have an account
							<a href="registration.jsp" class="register-link">Register here</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>	 