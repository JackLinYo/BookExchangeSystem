<%--
  Created by IntelliJ IDEA.
  User: Steven 臧
  Date: 29/03/2017
  Time: 08:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Applicant Profile</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <style>
        .glyphicon {font-size: 20px;}

        table,th,td{border:1px solid black;border-collapse:collapse;}
        tr{height:30px}
        th{background-color:lightblue}
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
    <li><a href="http://localhost:8080/home.jsp">Department</a></li>
    <li><a href="http://localhost:8080/personalProfile.jsp">Personal Profile</a></li>
    <li><a href="http://localhost:8080/notification.jsp">Notification</a></li>
    <li><a href="http://localhost:8080/uploadBook.jsp">Lend/Sale</a></li>
    <li><a href="Logout">Log Out</a></li>
</ul>

<%
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "maxi";
    String dbdriver = "com.mysql.jdbc.Driver";
    String dbuserName = "root";
    String dbpassword = "steven04060406";
    try{
        Class.forName(dbdriver);
    }catch(ClassNotFoundException cfe){
        System.out.println(cfe);
    }
%>

<%
    try{
//        String email = (String)session.getAttribute("applicantEmail");
        String email = request.getParameter("applicantEmail");
        Connection connect = DriverManager.getConnection(url + dbName, dbuserName, dbpassword);
        Statement stat = connect.createStatement();
        String sql = "Select * from userprofile where email ='"+email+"'";

        ResultSet rs=stat.executeQuery(sql);
        int userID = 0;
        while(rs.next()){
            userID=Integer.parseInt(rs.getString("userID"));
%>
<!-- user personal info -->
<div>
    <ul>
        <li>Forename : <%=rs.getString("forename")%> </li>
        <li>Surname : <%=rs.getString("surname")%> </li>
        <li>Contact Number : <%=rs.getString("phonenumber")%></li>
        <li>University Email : <%=rs.getString("email")%> </li>
    </ul>
</div>
<hr/>

<%
    }
%>


<!-- record of transaction -->
<div>
    <table class="table">
        <caption>View Transaction and Comments</caption>
        <thead>
        <tr>
            <th scope="row">Book Name</th>
            <th scope="row">Time</th>
            <th scope="row">comments</th>
        </tr>
        </thead>
        <%
            stat = connect.createStatement();
            sql = "Select * from booklist b,orderlist o where b.userID ='"+userID+"' and b.booklistID=o.booklistID";

            rs=stat.executeQuery(sql);
            while(rs.next()){

        %>
        <tr>
            <td><%=rs.getString("bookname")%></td>
            <td><%=rs.getString("dateandtime")%></td>
            <td>5</td>
        </tr>

<%

        }connect.close();
    }catch(SQLException e){
        e.printStackTrace();
    }
%>
    </table>
</div>

</body>
</html>
