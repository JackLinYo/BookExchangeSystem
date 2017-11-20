<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

    <title>Registration</title>

    <script>

        function checkEmptyBox() {
            var phoneno = /^\+?([0-9]{2})\)?[-. ]?([0-9]{5})[-. ]?([0-9]{5})$/;
            var emailFormat = /^([A-Za-z0-9_\-\.]){1,}\@([a-z]){9}\.([a-z]){2}\.([a-z]){2}$/;
            if (reg.title.value == "00") {
                alert("Please choose the title of yours");
                return false;
            }
            if (reg.surname.value == "") {
                alert("Please enter your surname");
                reg.surname.focus();
                reg.surname.style.border = "solid 3px red";
                return false;
            }
            if (reg.forename.value == "") {
                alert("Please enter your forename");
                reg.forename.focus();
                reg.forename.style.border = "solid 3px red";
                return false;
            }
            if (reg.password.value == "") {
                alert("Please set up your password");
                reg.password.focus();
                reg.password.style.border = "solid 3px red";
                return false;
            }
            if (reg.repwd.value == "") {
                alert("Please confrim your password");
                reg.repwd.focus();
                reg.repwd.style.border = "solid 3px red";
                return false;
            }
            if (reg.password.value.length < 6 || reg.repwd.value.length < 6) {
                alert("The length of password must over 6 characters !");
                reg.password.focus();
                reg.password.style.border = "solid 3px red";
                reg.repwd.focus();
                reg.repwd.style.border = "solid 3px red";
                return false;
            }
            if (reg.password.value != reg.repwd.value) {
                alert("The password does not match");
                reg.password.focus();
                reg.password.style.border = "solid 3px red";
                reg.repwd.focus();
                reg.repwd.style.border = "solid 3px red";
                return false;
            }
            if (reg.phonenumber.value == "") {
                alert("Please enter your phone number");
                reg.phonenumber.focus();
                reg.phonenumber.style.border = "solid 3px red";
                return false;
            }
            if (!reg.phonenumber.value.match(phoneno)) {
                alert("Please enter the right format of your phone number");
                return false;
            }
            if (reg.email.value == "") {
                alert("Please enter your University email address");
                reg.email.focus();
                reg.email.style.border = "solid 3px red";
                return false;
            }
            if (!reg.email.value.match(emailFormat)) {
                alert("Please enter the right format of your University email");
                return false;
            }
        }
    </script>

</head>
<body>

<div class="container">

    <form class="well form-horizontal" action="RegisterServlet" method="post"
          id="reg" name="reg">

        <fieldset>

            <!-- Form Name -->
            <legend><b>Registration</b></legend>

            <!-- Select Bar -->
            <div class="form-group">
                <label class="col-md-4 control-label">Title</label>
                <div class="col-md-4 selectContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                        <select id="title" name="userTitle" class="form-control selectpicker">
                            <option value="00">Please select your title</option>
                            <option value="Mr.">Mr.</option>
                            <option value="Mrs.">Mrs.</option>
                            <option value="Miss">Miss.</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label">University Email :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="email" name="email" placeholder="University E-Mail Address : @sheffield.ac.uk"
                               class="form-control" type="text">
                    </div>
                </div>
            </div>

            <!-- Text input-->

            <div class="form-group">
                <label class="col-md-4 control-label">Surname :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="surname" name="surname" placeholder="Your  surname" class="form-control" type="text">
                    </div>
                </div>
            </div>


            <!-- Text input-->

            <div class="form-group">
                <label class="col-md-4 control-label">Forename Name :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="forename" name="forename" placeholder="Your forename" class="form-control"
                               type="text">
                    </div>
                </div>
            </div>


            <!-- Text input-->

            <div class="form-group">
                <label class="col-md-4  control-label">Contact Number :</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                        <input name="phonenumber" id="number" placeholder="+44-75109-74388" class="form-control"
                               type="text">
                    </div>
                </div>
            </div>
            <!-- Text input-->

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
            <!-- Text input-->
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

            <!-- tetm of use -->
            <div class="form-group">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title">Terms and conditions</h3>
                        </div>

                        <div class="modal-body">
                            <p>This is the content of the regulation of using this app</p>
                        </div>

                        <div class="modal-footer">

                            <button type="button" class="btn btn-primary" id="agreeButton" data-dismiss="modal">Agree
                            </button>
                            <button type="button" class="btn btn-default" id="disagreeButton" data-dismiss="modal">
                                Disagree
                            </button>

                        </div>
                    </div>
                </div>
            </div>
            <!--end of term   -->

            <!--<div class="radio">
              <label><input type="radio" name="optradio" checked="checked">Agree to the Term of use regulation</label>
            </div>
            <div class="radio">
              <label><input type="radio" name="optradio">Disagree to the Term of use regulation</label>
            </div>  -->


            <!-- Button -->
            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4">
                    <button type="submit" class="btn btn-warning" name="next" onClick="return checkEmptyBox()">Next
                        <span class="glyphicon glyphicon-send"></span></button>
                </div>
            </div>

        </fieldset>
    </form>
</div>
<!-- /.container -->


</body>
</html>