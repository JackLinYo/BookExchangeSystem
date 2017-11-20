<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Book Exchange System Home Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <LINK REL="stylesheet" TYPE="text/css">
    <style >
        .glyphicon {font-size: 20px;}
        div.department_left{float:left;border:2px solid black;width:50%;height:100px}
        div.department_right{float:right;border:2px solid black;width:50%;height:100px}
        p.title{text-align:center;}
        p.department{text-align:center;line-height:100px}
        a.title{position:absolute;right:10px}
        h1{text-align:center}
    </style>
</head>
<body>
<%
    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<ul class="nav nav-tabs">
    <li><a href="http://localhost:8080/home.jsp"><i class="glyphicon glyphicon-home"></i></a></li>
    <li class="active"><a href="http://localhost:8080/home.jsp">Department</a></li>
    <li><a href="http://localhost:8080/personalProfile.jsp">Personal Profile</a></li>
    <li><a href="http://localhost:8080/notification.jsp">Notification</a></li>
    <li><a href="http://localhost:8080/uploadBook.jsp">Lend/Sale</a></li>
    <li><a href="Logout">Log Out</a></li>
    <li>
        <form class="navbar-form navbar-left" action="SearchServlet" >
            <div class="form-group">
                <input type="text" name="search" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
        </form>
    </li>
</ul>



<form action="SearchByDepartmentServlet" method="post" id="department" name="searchByDepartment">

    <div class="banner">
        <h1 class="title">Department</h1>
    </div>


    <div class="department_left">
        <input type="submit" value="Computer Science" name="searchByDepartment" style="width:100%;height:100px;">
    </div>

    <div class="department_right">
        <input type="submit" value="Engineering" name="searchByDepartment" style="width:100%;height:100px;">
    </div>

    <div class="department_left">
        <input type="submit" value="Management School" name="searchByDepartment" style="width:100%;height:100px;">
    </div>

    <div class="department_right">
        <input type="submit" value="Journalism" name="searchByDepartment" style="width:100%;height:100px;">
    </div>

    <div class="department_left">
        <input type="submit" value="Science" name="searchByDepartment" style="width:100%;height:100px;">
    </div>

    <div class="department_right">
        <input type="submit" value="Material and Chemistry" name="searchByDepartment" style="width:100%;height:100px;">
    </div>
</form>
</body>
</html>