<%--
  Created by IntelliJ IDEA.
  User: Steven 臧
  Date: 24/03/2017
  Time: 00:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Search Books</title>
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
    <li>
        <form class="navbar-form navbar-left" action="SearchServlet" >
            <div class="form-group">
                <input type="text" name="search" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
        </form>
    </li>
</ul>

<div>
    <table class="table">
        <caption>View Search Result</caption>
        <thead>
        <tr>
            <th scope="row">Book Owner</th>
            <th scope="row">Owner E-mail</th>
            <th scope="row">Book Name</th>
            <th scope="row">Author</th>
            <th scope="row">ISBN</th>
            <th scope="row">Description</th>
            <th scope="row">Book Condition</th>
            <th scope="row">Department Category</th>
            <th scope="row">Location</th>
            <th scope="row">Sell or Lend</th>
            <th scope="row">Price</th>
            <th scope="row">Order It</th>
        </tr>
        </thead>

        <%
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "maxi";
            String dbdriver = "com.mysql.jdbc.Driver";
            String dbuserName = "root";
            String dbpassword = "steven04060406";
            try{
                String searach = (String) session.getAttribute("search");

                Class.forName(dbdriver);
                Connection conn=DriverManager.getConnection(url+dbName,dbuserName,dbpassword);
                Statement st=conn.createStatement();

                String sql = "select b.booklistID,b.bookname,b.author,b.isbn,b.description,b.department,u.userID,u.userTitle,u.surname,u.email,b.bookcondition,l.locationName,b.sellorlend,b.price from booklist b,location l, userprofile u where bookname like '%"+searach+"%'and b.locationID=l.locationID and b.userID=u.userID";

                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){
        %>
        <form id="Order" name="Order" action="OrderServlet">
        <tr>
            <td><a href="applicantProfile.jsp?applicantEmail=<%=rs.getString("email")%>"><%=rs.getString("userTitle")%> <%=rs.getString("surname")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("bookname")%></td>
            <td><%=rs.getString("author")%></td>
            <td><%=rs.getString("isbn")%></td>
            <td><%=rs.getString("description")%></td>
            <td><%=rs.getString("bookcondition")%></td>
            <td><%=rs.getString("department")%></td>
            <td><%=rs.getString("locationName")%></td>
            <td><%=rs.getString("sellorlend")%></td>
            <td><%=rs.getString("price")%></td>
            <td><button id="button" name="order" value="<%=rs.getString("booklistID")%> <%=rs.getString("userID")%>">Order It</td>
        </tr>
        </form>
        <%
                }
                conn.close();
            }catch(ClassNotFoundException e) {
                e.printStackTrace();
                }
        %>
    </table>
</div>

</body>
</html>
