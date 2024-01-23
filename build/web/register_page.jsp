<%-- 
    Document   : login_page
    Created on : Jan 13, 2024, 5:23:03 PM
    Author     : Vicky Patel
--%>

<%@page import="com.techblog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | TechBlog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--navbar-->
        <%@include file = "navbar.jsp" %>

        <!--login form-->
        <main class = "d-flex align-items-center" style="height: 500px">
            <div class = "container mt-4">
                <div class = "row">
                    <div class = "col-md-6 offset-md-3">
                        <div class = "card">
                            <div class = "card-header text-center">Register to TechBlog</div>
                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class = "alert <%=m.getCssClass()%>" role = "alert">
                                <%=m.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }

                            %>
                            <div class = "card-body">
                                <form action = "RegisterServlet" method = "post" id="reg_form">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" id="username" placeholder="Enter Username" name = "username">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name = "email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>

                                    <div class="form-group">
                                        <label for="gender">Select gender</label> 
                                        <br>
                                        <input type="radio" name = "gender" value = "Male"> Male
                                        <input type="radio" name = "gender" value="Female"> Female
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name = "password">
                                    </div>
                                    <div class ="from-group">
                                        <button type="submit" class="btn btn-primary">Register</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>



        <!--javascript--> 
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                console.log("Ready");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "RegisterServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                        },
                        error: function (data, textStatus, jqXHR) {
                            console.log(jqXHR);
                        },
                        processData: false,
                        contentType: false
                    })
                })

            })

        </script>

    </body>
</html>

