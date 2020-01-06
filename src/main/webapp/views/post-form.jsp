<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>


<%--@elvariable id="post" type="com.example.springbootproject.pojo.Post"--%>
   <form:form action="save" method="post" modelAttribute="post">
       <form:hidden path="pid"/>
<%--    <input:hidden path="authorId" value="<sec:authentication property='name'/>"/>--%>
<%--       <input value="<sec:authentication property='name/>"/>--%>
       <form:checkboxes path="categories"  items="${mapOfCategory}" itemValue="cid"/>


       <br>Title<form:input path="title"/>



      <br>Content <form:input path="content"/><br>
        <input type="submit" value="publish">




   </form:form>
</body>
</html>