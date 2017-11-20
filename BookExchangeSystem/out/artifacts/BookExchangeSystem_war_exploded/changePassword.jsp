<%--
  Created by IntelliJ IDEA.
  User: Steven 臧
  Date: 22/04/2017
  Time: 03:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width">

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

    <script>
        function checkEqual() {
            if (change.password.value != change.repwd.value) {
                alert("Two passwords does not match! Please check!")
                return false;
            }if(change.password.value =="" || change.repwd.value==""){
                alert("Please enter new password!")
                return false;
            }

        }
    </script>
</head>
<body>
<%
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<h1 align="center">Change Your Password</h1>
<div class="container">

    <form class="well form-horizontal" action="ChangePasswordServlet" method="post"
          id="change" name="change">
        <div class="form-group">
            <label class="col-md-4 control-label">Password :</label>
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="pwd" name="password" value="" placeholder="The password must over 6 characters"
                           class="form-control" type="password">
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label">Re-Entered Password :</label>
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="repwd" name="repwd" placeholder="pleasw Re-Entered your password"
                           class="form-control" type="password">
                </div>
            </div>
        </div>

        <button type="submit" class="btn btn-warning" name="change" onClick="return checkEqual()">Change Password
            <span class="glyphicon glyphicon-send"></span></button>

</div>

</body>
</html>
