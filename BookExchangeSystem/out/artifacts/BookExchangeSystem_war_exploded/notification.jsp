<%--
  Created by IntelliJ IDEA.
  User: Steven 臧
  Date: 29/03/2017
  Time: 04:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>Notification</title>
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
    <li ><a href="http://localhost:8080/home.jsp">Department</a></li>
    <li><a href="http://localhost:8080/personalProfile.jsp">Personal Profile</a></li>
    <li class="active"><a href="http://localhost:8080/notification.jsp">Notification</a></li>
    <li><a href="http://localhost:8080/uploadBook.jsp">Lend/Sale</a></li>
    <li><a href="Logout">Log Out</a></li>
</ul>

<div>
    <table class="table">
        <caption>View Search Result</caption>
        <thead>
        <tr>
            <th scope="row">Applicant</th>
            <th scope="row">Book Name</th>
            <th scope="row">Order Time</th>
            <th scope="row">Accept</th>
            <th scope="row">Decline</th>
        </tr>
        </thead>

        <%
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "maxi";
            String dbdriver = "com.mysql.jdbc.Driver";
            String dbuserName = "root";
            String dbpassword = "steven04060406";
            try{
                String email = (String) session.getAttribute("email");

                Class.forName(dbdriver);
                Connection conn=DriverManager.getConnection(url+dbName,dbuserName,dbpassword);
                Statement st=conn.createStatement();

                //Get User ID
                int userID=0;
                String getUserID="select userID from userprofile where email = '"+email + "'";
                ResultSet rs = st.executeQuery(getUserID);
                while(rs.next()){
                    userID=Integer.parseInt(rs.getString("userID"));
                }

        String sql = "select b.booklistID,b.bookname,o.dateandtime,o.requestUserID,o.orderID from orderlist o,booklist b where userID = "+userID+" and o.booklistID=b.booklistID and b.available=1";
        rs=st.executeQuery(sql);
        while(rs.next()){
            int applicantID = Integer.parseInt(rs.getString("requestUserID"));
            String getApplicantName = "select userTitle,surname,email from userprofile where userID = "+applicantID;
            Statement applicantName=conn.createStatement();
            ResultSet name=applicantName.executeQuery(getApplicantName);
            while (name.next()){
        %>
        <form id="Order" name="Order" action="AcceptDeclineOrderServlet">
        <tr>
            <input type="hidden" name="myID" value="<%=userID%>">
            <input type="hidden" name="ownerID" value="<%=applicantID%>">
            <input type="hidden" name="orderID" value="<%=rs.getString("orderID")%>">
            <input type="hidden" name="booklistID" value="<%=rs.getString("booklistID")%>">
        <td><a href="applicantProfile.jsp?applicantEmail=<%=name.getString("email")%>"><%=name.getString("userTitle")%> <%=name.getString("surname")%></a></td>
        <td><a href="SearchServlet?search=<%=rs.getString("bookname")%>"><%=rs.getString("bookname")%></a></td>
        <td><%=rs.getString("dateandtime")%></td>
        <td><button id="buttonaccept" name="acceptordecline" value="accept">Accept</td>
        <td><button id="buttondecline" name="acceptordecline" value="decline">Decline</td>
        </tr>
        </form>
        <%
            }
            name.close();
            }
            rs.close();
                conn.close();
            }catch(ClassNotFoundException e) {
                e.printStackTrace();
            }catch (SQLException e){
                e.printStackTrace();
        }
        %>
    </table>
</div>



</body>
</html>
