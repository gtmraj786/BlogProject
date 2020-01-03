<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Gautam Rajbhar
  Date: 26-12-2019
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>

    <h2>Delete Confirmation<h2>

        <%--@elvariable id="post" type="com.example.springbootproject.pojo.Post"--%>
        <form:form action="delete"  modelAttribute="post">
        <table>


            <td>title:</td>
            <td><form:textarea disabled="true" path="title"/></td>
            </tr>
            <tr><td>Content:</td>
                <td><form:textarea disabled="true" path="content"/></td>
                <form:hidden path="pid"/>
            </tr>
            <tr><td><input type="submit" value="YES">

            </td>
                <td><input type="button" onclick="history.back()" value="CANCEL">
                </td>
            </tr>


        </table>
        </form:form>
</div>
</body>
</html>
