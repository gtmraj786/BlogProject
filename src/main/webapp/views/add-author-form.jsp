<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.springbootproject.pojo.Author" %>
<%--<%@ page import="springdatajpa.pojo.Author" %>--%>
<%@ page isELIgnored = "false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<%--@elvariable id="author" type="com.example.springbootproject.pojo.Author"--%>
<form:form action="saveAuthor" modelAttribute="author">
    <br>Author Name
    <form:input path="name"/><br>
    Email:<form:input path="email"/><br>
   Password: <form:input path="password"/><br>
    <input type="submit" value="create Account">

</form:form>

</body>
</html>