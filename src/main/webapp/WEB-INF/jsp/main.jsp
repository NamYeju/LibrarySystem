<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-27
  Time: 오후 7:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form class="needs-validation" novalidate th:action="@{/signUpcheck}" method="POST">
    <button class="w-100 btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
</form>
<form class="needs-validation" novalidate th:action="@{/signUpcheck}" method="POST">
    <button class="w-100 btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
</form>
</body>
</html>
