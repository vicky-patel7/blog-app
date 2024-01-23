<%-- 
    Document   : show_blog_page
    Created on : Jan 18, 2024, 5:27:11 PM
    Author     : Vicky Patel
--%>



<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.techblog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.entities.User"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>

<%@page errorPage = "error_page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>
<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostById(postId);

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getPtitle()%> || Tech Blog Post</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            .post-title {
                font-weight: 300;
                font-size: 30px;
            }
            .post-content {
                font-weight: 100;
                font-size: 25px;
                margin-top : 4px;
            }
            .post-date {
                font-weight: 500;
                font-style: italic;
            }
            .post-user {
                font-size: 18px;
                font-weight: 300;
            }
            .row-user {
                border-bottom: 1px solid grey;
                border-top: 1px solid grey;
            }
        </style>

    </head>
    <body>

        <!--navbar start-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.jsp">Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp">Learn To Code <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Languages</a>
                            <a class="dropdown-item" href="#">Frameworks</a>
                            <a class="dropdown-item" href="#">Machine Learning</a>
                            <a class="dropdown-item" href="#">Android</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle = "modal" data-target = "#add-post-modal">DO POST</a>
                    </li>
                </ul>
                <ul class = "navbar-nav mr-right">
                    <li class="nav-item">
                        <a href ="#!" data-toggle ="modal" data-target ="#profile-modal" class="nav-link" href="#"><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a href ="LogoutServlet" class="nav-link" href="#">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--end of the navbar-->
        <!--main content of the post-->
        <div class = "container">
            <div class="row" >
                <div class="col-md-8 offset-md-3 mt-3" >

                    <div class = "card">
                        <div class = "card-header">
                            <h4 class="post-title"><%= p.getPtitle()%></h4>
                        </div>

                        <div class = "card-body">
                            <img src="blog_pics/<%=p.getPpic()%>" class = "card-img-top my-2" alt = "blog image"/>
                            <div class = "row mt-3 row-user">
                                <div class="col-md-8">

                                    <%
                                        UserDao udao = new UserDao(ConnectionProvider.getConnection());
                                        User u = udao.getUserById(p.getUserId());

                                    %>
                                    <p class = "post-user">Posted by : <%= u.getName()%></p>
                                </div>
                                <div class = "col-md-4">
                                    <p class="post-date"><%= DateFormat.getDateInstance().format(p.getPdate())%></p>
                                </div>
                            </div>
                            <p class = "post-content">
                                <%= p.getPcontent()%>
                            </p>
                            <br>
                            <div class="post-code">
                                <pre><%= p.getPcode()%></pre>
                            </div>
                            <br>
                        </div>
                        <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            int count = ld.countLikesOnPost(p.getPid());
                        %>
                        <div class="card-footer">
                            <a href="#!" onclick="doLike(<%= p.getPid()%>, <%= user.getId()%>)" class="btn btn-outline-primary btn-sm">Likes <span><%= count%></span></a>
                            <a href="#!" class="btn btn-outline-primary btn-sm"><span>Comment</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--end of the main content of the post-->



        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id = "profile-details">
                        <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">ID : </th>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div id="profile-edit" style = "display: none ">
                        <h3 class = "mt-2">
                            Please Edit Carefully
                        </h3>
                        <form action = "EditServlet">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th scope="row">ID : </th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Name :</th>
                                        <td><input type="text" class ="form-control" value = "<%= user.getName()%>" name = "name"/></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email :</th>
                                        <td><input type="email" class ="form-control" value = "<%= user.getEmail()%>" name = "email"/></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Password :</th>
                                        <td><input type="text" class ="form-control" value = "<%= user.getPassword()%>" name = "password"/></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class = "container mb-2">
                                <button type="submit" class = "btn btn-outline-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                    </div>


                </div>
            </div>
        </div>
        <!--add post modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add A New Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--Main Body Content-->
                        <form action = "AddPostServlet" method="post" id="add-post-form">
                            <div class = "form-group">
                                <select class = "form-control" name="category">
                                    <option disabled="true" selected>---Select Category---</option>
                                    <%
                                        PostDao postD = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postD.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>" name = "cid"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" placeholder = "Enter Post Title" class="form-control" name = "ptitle"/>
                            </div>
                            <div class="form-group">
                                <textarea type ="text" class="form-control" placeholder = "Enter the Content of you post." name="pcontent" style = "height: 200px;"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea type ="text" class="form-control" placeholder = "Enter Your Program(if any)." name="pcode" style = "height: 200px;"></textarea>
                            </div>
                            <div class = "form-group">
                                <label for="ppic">Select pics :</label>
                                <br>
                                <input type = "file" name = "ppic" id="ppic"/>
                            </div>

                            <div class = "container">
                                <button class="btn btn-outline-primary">Post</button>
                            </div> 


                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end of add post modal-->


        <!--javascript--> 
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $("#edit-profile-button").click(function () {
                    if (editStatus === false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();

                        editStatus = false;
                        $("#profile-edit").hide();
                    }
                });
            });
        </script>

        <!--add post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on('submit', function (event) {
                    event.preventDefault();
                    let formData = new FormData(this);
                    //now requesting to the server
                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: formData,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            swal("Good job!", "You have made a contribution!", "success");
                            $('#add-post-form').modal("hide");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error
                            swal("Oh!", "Something Went Wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

        <!--loading posts using ajax-->
        <script>
            //LOADING POST USING AJAX 
            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass("active");
                $.ajax({
                    url: "load_post.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                });
            }
            ;

            $(document).ready(function (e) {
                let allPostRef = $("c-link")[0];
                getPosts(0, allPostRef);
            });
        </script>
    </body>
</html>
