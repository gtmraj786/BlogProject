
<%@ page import="com.example.springbootproject.pojo.Post" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Gautam Rajbhar
  Date: 25-12-2019
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <%
        Post post=(Post) request.getAttribute("post");
    %>
    <h2>Edit Post<h2>
        <%--@elvariable id="post" type="com.example.springbootproject.pojo.Post"--%>
        <form:form action="save" method="post" modelAttribute="post">
        <table>

            <form:checkboxes path="categories"  items="${mapOfCategory}" itemValue="cid"/>

           <tr> <td>Title:</td><td><form:input path="title"/></td>
            </tr>

            <tr><td>Content:</td><td><form:input path="content"/></td>
               </tr> <form:hidden path="pid"/>

            <tr><td><input type="submit" value="save"></td></tr>
        </table>
        </form:form>
</div>
</body>
</html>
