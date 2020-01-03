<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.springbootproject.pojo.Post" %>
<%--<%@ page import="springdatajpa.pojos.Post" %>--%>
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

<%--@elvariable id="category" type="com.example.springbootproject.pojo.Category"--%>
 <form:form action="saveCategory" method="post" modelAttribute="category">
     <br>Category Name
     <form:input path="name"/><br>
     <input type="submit" value="create Category">

 </form:form>

</body>
</html>