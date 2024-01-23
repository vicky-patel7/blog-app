<%-- 
    Document   : load_post
    Created on : Jan 18, 2024, 1:13:17 PM
    Author     : Vicky Patel
--%>
<%@page import="com.techblog.dao.LikeDao"%>
<%@page import="com.techblog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.dao.PostDao"%>
<%@page import="com.techblog.helper.ConnectionProvider"%>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>

<div class = "row">
    <%        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = new ArrayList<>();
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostsByCategory(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class = 'display-3 text-center'> No Post in this Category! </h3>");
            return;
        }
        for (Post p : posts) {
    %>
    <div class="col-md-6">
        <div class = "card mt-3">

            <img src="blog_pics/<%=p.getPpic()%>" alt = "Post Photo" class = "card-img-top"/>
            <div class = "card-body">
                <b><%= p.getPtitle()%></b>
                <p><%= p.getPcontent()%></p>

            </div>
            <div class = "card-footer">
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More...</a>
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    int count = ld.countLikesOnPost(p.getPid());
                %>
                <a href="#!" onclick="doLike(<%= p.getPid()%>, <%= user.getId()%>)" class="btn btn-outline-primary btn-sm">Likes <span class="like-counter-<%=p.getPid()%>"><%= count%></span></a>
                <a href="#!" class="btn btn-outline-primary btn-sm"><span>Comment</span></a>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>



