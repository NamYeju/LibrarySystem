<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-27
  Time: 오후 6:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body class="text-center">
<form class="needs-validation" novalidate th:action="@{/signIncheck}" method="POST">>
    <div class="py-5 text-center">
        <h2>로그인</h2>
        <p class="lead">로그인 이후 서비스 가능</p>
    </div>
    <div class="mb-3">
        <input type="email" class="form-control" id="inputID" placeholder="name@example.com">
        <label for="inputID">Email address</label>
    </div>
    <div class="mb-3">
        <input type="password" class="form-control" id="inputPW" placeholder="Password">
        <label for="inputPW">Password</label>
    </div>

    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
</form>




</body>
</html>


