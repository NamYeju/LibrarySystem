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
    <style>
        .btn{background-color: #22508b;}
        .btn:hover{
            background-color: #22508b;
        }
        .btn:active{
            background-color: #22508b;
        }
        .btn:visited{
            background-color: #22508b;
        }
        .div{
            margin: 0 auto;
            width: 100%;
        }

    </style>
</head>
<body class="text-center">
    <form class="needs-validation" action="/signIncheck" method="POST">
        <div class="py-5 text-center">
            <h2>로그인</h2>
            <p class="lead">로그인 이후 서비스 가능</p>
        </div>
        <div class="div row mb-3 " style= "display: flex; justify-content: center;">
            <label for="inputEmail" class="col-sm-1 col-form-label">Email</label>
            <div class="col-sm-5">
                <input type="email" class="form-control" id="inputEmail" placeholder="email@example.com" required name="email">
            </div>
        </div>
        <div class="row mb-3" style= "display: flex; justify-content: center;">
            <label for="inputPW" class="col-sm-1 col-form-label">Password</label>
            <div class="col-sm-5">
                <input type="password" class="form-control" id="inputPW" placeholder="" required name="password">
            </div>
        </div>
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="btn btn-primary" type="submit">Sign in</button>

    </form>
    <button class="btn btn-primary" type="submit" onclick="location.href='/'">돌아가기</button>



</body>
</html>


