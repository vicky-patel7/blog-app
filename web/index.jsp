<%-- 
    Document   : index
    Created on : Jan 12, 2024, 11:10:13 PM
    Author     : Vicky Patel
--%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog | Home</title>
        <!--Bootstrap CDN--> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--navbar-->
        <%@include file="navbar.jsp" %>

        <!--hero section-->
        <div class = "container-fluid">
            <div class = "jumbotron">
                <div class="container">
                    <h3 class = "display-3">Welcome to TechBlog </h3>
                    <p class = "justify-center">
                        A programming language is a system of notation for writing computer programs.
                        The source code for a simple computer program written in the C programming language. The gray lines are comments that help explain the program to humans in a natural language. When compiled and run, it will give the output "Hello, world!".
                        A programming language is usually described in terms of its syntax (form) and semantics (meaning). These are usually defined by a formal language.
                        A language usually has at least one implementation in the form of a compiler or interpreter, allowing programs written in the language to be executed.
                        Programming language theory is the subfield of computer science that studies the design, implementation, analysis, characterization, and classification of programming languages.
                    </p>
                    <a href="register_page.jsp" class = "btn btn-outline-primary btn-lg">Start! Its Free</a>
                    <a href = "login_page.jsp" class = "btn btn-outline-primary btn-lg">Login</a>
                </div>
            </div>
        </div>

        <!--cards-->
        <div class = "container">
            <div class = "row mb-4">
                <div class = "col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background">Read More...</a>
                        </div>
                    </div>
                </div>
                <div class = "col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background">Read More...</a>
                        </div>
                    </div>
                </div>
                <div class = "col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background">Read More...</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "row">
                <div class = "col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background">Read More...</a>
                        </div>
                    </div>
                </div>
                <div class = "col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background">Read More...</a>
                        </div>
                    </div>
                </div>
                <div class = "col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary primary-background">Read More...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--javascript--> 
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>

</html>
