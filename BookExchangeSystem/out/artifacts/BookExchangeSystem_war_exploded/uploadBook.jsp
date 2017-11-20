<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Upload Page</title>

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

        function checkBox() {
            if (uploadbook.bookname.value == "") {
                alert("Please enter the name of the book");
                return false;
            }
            if (uploadbook.author.value == "") {
                alert("Please enter the author name of the book");
                return false;
            }
            if (uploadbook.isbn.value == "") {
                alert("Please enter the isbn number of the book");
                return false;
            }
            if (uploadbook.locationID.value == "00") {
                alert("Please choose the location that you prefer to meet with the buyer ot borrower");
                return false;
            }
            if (uploadbook.department.value == "00") {
                alert("Please choose the department that refer to the book");
                return false;
            }
            if (!((uploadbook.sellorlend.value == "sell") || (uploadbook.sellorlend.value == "lend"))) {
                alert("Please choose the lend or sell");
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
<!-- navigation bar -->

<ul class="nav nav-tabs">
    <li><a href="http://localhost:8080/home.jsp"><i class="glyphicon glyphicon-home"></i></a></li>
    <li><a href="http://localhost:8080/home.jsp">Department</a></li>
    <li><a href="http://localhost:8080/personalProfile.jsp">Personal Profile</a></li>
    <li><a href="http://localhost:8080/notification.jsp">Notification</a></li>
    <li class="active"><a href="http://localhost:8080/uploadBook.jsp">Lend/Sale</a></li>
    <li><a href="Logout">Log Out</a></li>
    <li>
        <form class="navbar-form navbar-left" action="SearchServlet">
            <div class="form-group">
                <input type="text" class="form-control" name="search" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
        </form>
    </li>
</ul>


<!-- Form Name -->
<div class="container">
    <form class="form-horizontal" action="UploadServlet" method="post"
          id="uploadbook" name="uploadbook">
        <fieldset>

            <legend>Book Information</legend>

            <!-- book name input box-->
            <div class="form-group">
                <label class="col-md-4 control-label">Book Name</label>
                <div class="col-md-4">
                    <input id="bookname" name="bookname" type="text" placeholder="Enter book name" class="form-control">

                </div>
            </div>

            <!-- author input box-->
            <div class="form-group">
                <label class="col-md-4 control-label">Author</label>
                <div class="col-md-4">
                    <input id="author" name="author" type="text" placeholder="Enter the author of the book"
                           class="form-control">
                </div>
            </div>

            <!-- isbn input box-->
            <div class="form-group">
                <label class="col-md-4 control-label">Isbn</label>
                <div class="col-md-4">
                    <input id="isbn" name="isbn" type="text" placeholder="Enter the isbn number of the book"
                           class="form-control">
                </div>
            </div>

            <!-- book condition input box-->
            <div class="form-group">
                <label class="col-md-4 control-label">Book Condition</label>
                <div class="col-md-4">
                    <textarea class="form-control" name="condition">Condition</textarea>
                </div>
            </div>

            <!-- description input-->
            <div class="form-group">
                <label class="col-md-4 control-label">Description</label>
                <div class="col-md-4">
                    <textarea class="form-control" name="description">Description</textarea>
                </div>
            </div>

            <!--location select bar-->
            <div class="form-group">
                <label class="col-md-4 control-label">Location</label>
                <div class="col-md-4">
                    <select id="location" name="locationID" class="form-control">
                        <option value="00">Which location that you prefer to face to face</option>
                        <option value="1">Diamond</option>
                        <option value="2">IC</option>
                        <option value="3">Western Bank</option>
                        <option value="4">Student Union</option>
                    </select>
                </div>
            </div>

            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label">Department</label>
                <div class="col-md-4">

                    <select id="department" name="department" class="form-control">
                        <option value="00">Please select what the department that the book refer to
                        <option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Engineering">Engineering</option>
                        <option value="Management School">Management School</option>
                        <option value="Journalism">Journalism</option>
                        <option value="Science">Science</option>
                        <option value="Material and Chemistry">Material and Chemistry</option>

                    </select>
                </div>
            </div>

            <!-- sell or lend radio-->
            <div class="form-group">
                <label class="col-md-4 control-label">Sell or Lend</label>
                <div class="col-md-4">
                    <input type="radio" id="lend" name="sellorlend" value="lend"
                           onclick="document.getElementById('price').disabled=true;">Lend
                    <input type="radio" id="sell" name="sellorlend" value="sell"
                           onclick="document.getElementById('price').disabled=false">Sell
                </div>
            </div>


            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label">Price</label>
                <div class="col-md-4">
                    <input id="price" name="price" type="text" class="form-control" value="£">

                </div>
            </div>


            <!--upload Button -->
            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <button id="upload" name="upload" class="btn btn-primary" onClick="return checkBox()">Upload
                    </button>
                </div>
            </div>

        </fieldset>
    </form>
</div>
</body>
</html>