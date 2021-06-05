<%@ page import="com.example.librarysystem.domain.entity.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <title>Title</title>
</head>
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
</style>
<body>

<%
    session=request.getSession();
    session=request.getSession(true);
    Member memberInfo = (Member) session.getAttribute("member");
    //out.print(memberInfo.getEmail());
    //out.print(memberInfo.getName());
%>
<div class="container">
    <div class="py-8 text-center">
        <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/image/libraryIcon.jpg" alt="" width="72" height="72">
        <h2>회원수정</h2>
    </div>
    <div class="col-md-12 order-md-1">
        <h4 class="mb-3">회원정보</h4>
        <form action="/userUpdateCheck" method="post">
            <div class="mb-3">
                <label for="email">이메일</label>
                <div class="input-group">
                    <input type="email" class="form-control" id="email" name="address" value="<%=memberInfo.getEmail()%>"> <br>
                    <div class="invalid-feedback" style="width: 100%;">Your email is required.</div>
                </div>
            </div>

            <div class="mb-3">
                <label for="password">비밀번호</label>

                <input type="password" class="form-control" id="password" placeholder="비밀번호" name="password" value="">
                <div class="invalid-feedback">유효한 비밀번호가 필요합니다.</div>
            </div>

            <div class="mb-3">
                <label for="username">이름</label>
                <input type="text" class="form-control" id="username" placeholder="이름을 입력해주세요." name="name" value="">
                <div class="invalid-feedback">유효한 이름을 입력해야합니다.</div>
            </div>

            <div class="mb-3">
                <label for="phone">핸드폰번호</label>
                <input type="text" class="form-control" id="phone" placeholder="" name="phone" value=""><br>
                <div class="invalid-feedback">올바른 핸드폰번호 입력하세요.</div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary" type="submit">수정하기</button>
        </form>
    </div>
</div>


</body>
</html>