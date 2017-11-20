<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="website.css" />
<meta charset="UTF-8">

<title>Sheffield Book exchange webstie</title>

<!-- JavaScript code : verify whether the email and password box is empty -->
<script>

    function check() {
        if (loginform.email.value == "") {
            alert("Please enter your username");
            return false;
        } else if (loginform.password.value == "") {
            alert("Please enter your password");
            return false;
        }
    }
</script>
</head>

<body>

 
 <!--Title of the app  -->
 <h1 align="center"><b>University Of Sheffield Book Exchange Website </b></h1>
 
 <!-- University of Sheffield picture put it on center by using bootstrap -->
  <img src="https://www.sheffield.ac.uk/ourplan/wp-content/uploads/2015/11/TUOS_Logo_CMYK.png"
     class="img-responsive center-block" width="600" height="300" alt="the picture of University Of Sheffield"/>
     
     <!--Star content from here  -->
     
<div class="container">
	<div class="row">
        <div class="col-md-6 col-md-offset-3">

   <!--input form of email and pwd -->
   
  <div style="padding: 20px;" id="form-olvidado">
  <form accept-charset="UTF-8" role="form" id="loginform" name="loginform" method="post" action="Login" >
      <fieldset>
        <!-- input of Email account -->
      
        <div class="form-group input-group">
          <span class="input-group-addon">
            @
          </span>
        
          <input class="form-control" placeholder="Please enter your University Email" name="email" type="email" required="required" autofocus="" >
        </div>
        <div class="form-group input-group">
          <span class="input-group-addon">
            <i class="glyphicon glyphicon-lock"></i>
          </span>
          
          <!-- input of password -->
          <input class="form-control" placeholder="Please Enter the password" name="password" type="password" value="" required="required">
        </div>


        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block" onClick="return check()" >
            Log in</button>
            <a href="http://localhost:8080/registration.jsp" target="_new" class="btn">Register</a>
          <p class="help-block">
            <a class="pull-right text-muted" href="http://localhost:8080/forgottenpassword.jsp" target="_new" id="olvidado"><small>Forgot your password?</small></a>
          </p>
        </div>
      </fieldset>
    </form>

  </div>

  
</div>
</div>
</div>

</body>
</html>