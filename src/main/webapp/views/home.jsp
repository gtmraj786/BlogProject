<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.springbootproject.pojo.Post" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="com.example.springbootproject.pojo.Category" %>
<%@ page import="com.example.springbootproject.pojo.Author" %>
<%--<jsp:useBean id="listCategory" type="java.util.ArrayList" scope="session" />--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page import="springdatajpa.pojos.Post" %>--%>
<%@ page isELIgnored = "false" %>
<html>
<head>
    <title>My Blog</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <%List<Category>listCategory=(List<Category>) request.getAttribute("listCategory");%>

<%--    <%for(Category c : lisCategory)--%>
<%--        System.out.println(c.getName());--%>
<%--    %>--%>
    <nav class="navbar navbar-inverse ">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">My Blog</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="/home/0">Home</a></li>
                <li><a href="/addPost">Create Post</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Sort By<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/sortByTitle/0">Title</a></li>
                        <li><a href="/sortByUpdateDate/0">Updated Date</a></li>
                        <li><a href="/sortByCreate/0">Created Date</a></li>
                    </ul>
                </li>
<%--                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category<span class="caret"></span></a>--%>
<%--                    <ul class="dropdown-menu">--%>
<%--                        <li><a href="/filterBy/Sport/0">Sport</a></li>--%>
<%--                        <li><a href="/filterBy/Country/0">Country</a></li>--%>
<%--                        <li><a href="/filterBy/News/0">News</a></li>--%>
<%--                        <li><a href="/filterBy/Science/0">Science</a></li>--%>
<%--                        <li><a href="/filterBy/Social/0">Social</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>

                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category<span class="caret"></span></a>
                    <ul class="dropdown-menu">
<%--                        <% for(Category c:listCategory)--%>
<%--                        {--%>
<%--                        %>--%>
<%--                        <li><a href="/filterBy/<%=c.getName()%>/0"><%=c.getName()%></a></li>--%>
<%--                        <%}%>--%>
<%--    <c:forEach items="${listCategory}" var="cat">--%>
<%--        <li><a href="/filterBy/${cat.name}/0">${cat.name}</a></li>--%>
<%--    </c:forEach>--%>
<%--                       <li><a href="/filterBy/Sport/0">Sport</a></li>--%>
                        <li><a href="/filterBy/Sport/0">Sport</a></li>
                        <li><a href="/filterBy/Cricket/0">Cricket</a></li>
                        <li><a href="/filterBy/Science/0">Science</a></li>
                        <li><a href="/filterBy/Social/0">Social</a></li>
                         <li><a href="/filterBy/Drama/0">Drama</a></li>
                         <li><a href="/filterBy/Country/0">Country</a></li>
                    </ul>
                </li>


                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Author<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/filterByAuthor/Gautam/0">Gautam</a></li>
                        <li><a href="/filterByAuthor/Navin/0">Navin</a></li>
                        <li><a href="/filterByAuthor/Amit/0">Amit</a></li>
                        <li><a href="/filterByAuthor/Aditya/0">Aditya</a></li>
                        <li><a href="/filterByAuthor/Shivam/0">Shivam</a></li>
                    </ul>
                </li>
                <security:authorize access="isAuthenticated()">
                <%

                    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                    String username="";
                    String authorities="";
                    if (principal instanceof UserDetails) {
                        username = ((UserDetails)principal).getUsername();
                        authorities= String.valueOf(((UserDetails) principal).getAuthorities());
                    } else {
                        username= principal.toString();
                    }
                    if(authorities.equals("[admin]"))                   {
                %>
                    <li><a href="/addCategory">Add Category</a></li>
                            <%
                                    }
                                %>
                    </security:authorize>



            </ul>
            <ul>
                <form class="navbar-form navbar-left" action="/searchBy/0">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                    </div>
                    <button type="submit" class="btn btn-default">search</button>
                </form>

            </ul>
            <ul class="nav navbar-nav navbar-right">
<%--                <li><a href="/logout">Logout</a></li>--%>
                <li><a href="/addAuthor"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>



                <security:authorize access="isAuthenticated()">

                    <li><a href="/logout">Logout</a></li>

                </security:authorize>



    <security:authorize access="!isAuthenticated()">

        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>

    </security:authorize>


        </div>
    </nav>

</head>
<body>


<%List<Post>list=(List<Post>) request.getAttribute("listPost");%>

<h1>My Blog</h1>
<%for(Post post:list){%>
<br>--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<br>Title:
<%=post.getTitle()%><br>

Content:
<%=post.getContent()%><br>
CreatedAt:<%=post.getCreatedAt()%><br>
UpdatedAt:<%=post.getUpdatedAt()%><br>
Author:<%=post.getAuthor().getName()%>


<br>

    <security:authorize access="isAuthenticated()">
            <%
                                    String author=post.getAuthor().getName();
                                    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                                    String username="";
                                    String authorities="";
                                    if (principal instanceof UserDetails) {
                                        username = ((UserDetails)principal).getUsername();
                                        authorities= String.valueOf(((UserDetails) principal).getAuthorities());
                                    } else {
                                        username= principal.toString();
                                    }
                                    if(author.equals(username)||authorities.equals("[admin]"))                   {
                                %>

      <td><a href="/edit?id=<%=post.getPid()%>">Edit</a>
   <td><a href="/deleteConfirm?id=<%=post.getPid()%>">Delete</a>
            <%
                                    }
                                %>
    </security:authorize>








        <%}%>



    <div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <jstl:if test="${pageNo > 0}">
                    <li class="page-item">
                        <a class="page-link" href="${pageNo - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="${pageNo - 1}">${pageNo}</a></li>
                </jstl:if>
                <li class="page-item"><a class="page-link" href="${pageNo}">${pageNo + 1}</a></li>
                <jstl:if test="${pageNo < lastPage}">
                    <li class="page-item"><a class="page-link" href="${pageNo + 1}">${pageNo + 2}</a></li>
                    <li class="page-item">
                        <a class="page-link" href="${pageNo + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </jstl:if>
            </ul>
        </nav>
    </div>

</body>
</html>
