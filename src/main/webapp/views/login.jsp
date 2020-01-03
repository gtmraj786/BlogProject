<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login...</title>
</head>
<body>
<h1>Login</h1>
  ${SPRING_SECURITY_LAST_EXCEPTION.message}
<form action="login" method="post">
<%--    <form:hidden path="aid"/>--%>
<table>
    <tr>
        <td>User:</td>
        <td><input type="text" name="username" value=""></td>
    </tr>
    <tr>
        <td>Password:</td>
        <td><input type="password" name="password" value=""></td>
    </tr>
    <tr>

        <td><input type="submit" name="submit" value="submit"></td>
    </tr>
</table>

</form>
</body>
</html>