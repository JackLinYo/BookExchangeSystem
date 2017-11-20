<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: Steven 臧
  Date: 19/04/2017
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot Password</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="website.css"/>
    <meta charset="UTF-8">

    <script>
        function checkCode() {
            var emailFormat = /^([A-Za-z0-9_\-\.]){1,}\@([a-z]){9}\.([a-z]){2}\.([a-z]){2}$/;
            if (changePassword.randomCode.value != changePassword.varifyCode.value) {
                alert("Verity Code incorrect!");
                return false;
            }
            if (changePassword.email.value == "") {
                alert("Please enter your University email address");
                changePassword.email.focus();
                changePassword.email.style.border = "solid 3px red";
                return false;
            }
            if (!changePassword.email.value.match(emailFormat)) {
                alert("Please enter the right format of your University email");
                return false;
            }

        }
    </script>
</head>
<body>
<h1 align="center">Reset your password</h1>
<div class="container">
    <form action="CheckEmailServlet" method="post" name="changePassword">
        <div class="form-group">
            <label for="exampleEmail1">Email address</label>
            <input type="email" class="form-control" id="exampleEmail1" name="email" aria-describedby="emailHelp"
                   placeholder="Enter email">
        </div>
        <%
            String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder salt = new StringBuilder();
            Random rnd = new Random();
            while (salt.length() < 8) {
                int index = (int) (rnd.nextFloat() * SALTCHARS.length());
                salt.append(SALTCHARS.charAt(index));
            }
            String randomString = salt.toString();
        %>
        <p id="randomCode" value="<%=randomString%>"><%=randomString%>
        </p>
        <input type="hidden" name="randomCode" value="<%=randomString%>">
        <input type="text" class="form-control" id="varifyCode" name="varifyCode">
        <button type="submit" class="btn btn-primary" onclick="return checkCode()">Submit</button>
    </form>
</div>
</body>
</html>
