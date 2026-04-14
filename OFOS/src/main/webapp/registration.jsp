<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    String csrfToken = java.util.UUID.randomUUID().toString();
    session.setAttribute("csrfToken", csrfToken);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="css/loginStyle.css">
    
    <!-- SRI added for Bootstrap CSS -->
     <link rel="stylesheet"
     href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
     integrity="sha512-Rx0gYpG2lXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
     crossorigin="anonymous">
    
    <!-- SRI added for jQuery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	integrity="sha512-tsQFQPf6CkG6c9E+u6KDAdAm8X1sC3yRlmCb4sOGHoPazTA/gkGEXUXMaLLq5yRvD/4ieVOGGAaHo9dZYkTfLZQ=="
	crossorigin="anonymous"></script>

    <!-- Optional: SRI added for Font Awesome -->
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha512-SfF1K6f5S8VnX2VVaodIZ6Tn6PvxI6Bfq5lHppZArYrusS4x+h0cYf9fbQ3VIAtF5NCz7L+G2kZZgvdXR0vb5g=="
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
                        <h4>Create an account</h4>
                    </div>
                    <form action = "Register" method = "post" >
                    <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
                        <div class="form-input">
                            <span><i class="fa fa-user"></i></span>
                            <input type="text" name= "name" placeholder="Full Name" required>
                        </div>
                        <div class="form-input">
                            <span><i class="fa fa-envelope"></i></span>
                            <input type="email" name= "email" placeholder="Email Address" required>
                        </div>
                        <div class="form-input">
                            <span><i class="fa fa-phone"></i></span> <!-- Add phone icon -->
                            <input type="tel" name= "phone" placeholder="Phone Number" required> <!-- Use type="tel" for phone number input -->
                        </div>
                        <div class="form-input">
                            <span><i class="fa fa-lock"></i></span>
                            <input type="password" name= "password" placeholder="Password" required>
                        </div>
                        <div class="row mb-3">
                            <div class="col-12 d-flex">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="cb1">
                                    <label class="custom-control-label text-white" for="cb1">I agree all terms and conditions</label>
                                </div>
                            </div>
                        </div>
                        <div class="text-left mb-3">
                            <button type="submit" class="btn">Register</button>
                        </div>
                        <div class="text-center mb-2">
                            <div class="mb-3" style="color: #777">or register with</div>
                            <a href="" class="btn btn-social btn-facebook">facebook</a>
                            <a href="" class="btn btn-social btn-google">google</a>
                            <a href="" class="btn btn-social btn-twitter">twitter</a>
                        </div>
                        <div style="color: #777">Already have an account
                            <a href="Login.jsp" class="login-link">Login here</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
