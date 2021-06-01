<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-31
  Time: 오전 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.librarysystem.domain.entity.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
<%--&lt;%&ndash;        mainhome header&ndash;%&gt;--%>
<%--<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #808080; color:white;">--%>
<%--    <div class="container">--%>
<%--        <div class="flex-md-column">--%>
<%--            <a style="color: white; font-size: xx-large; " class="navbar-brand" >도서관리시스템</a>--%>
<%--            <p class="lead"></p>--%>
<%--        </div>--%>
<%--        <div class="flex-md-row-reverse" id="navbarSupportedContent">--%>
<%--            <ul class="navbar-nav " style="align-items: end">--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <a class="navbar-brand" href="#">
        <img src="${pageContext.request.contextPath}/Image/libraryIcon.jpg" width="50" height="50" alt="">
        Library System
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/list">검색</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">대출</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">반납</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">예약</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    마이페이지
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">대여/반납 현황</a>
                    <a class="dropdown-item" href="#">예약 현황</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">회원 정보 수정</a>
                    <a class="dropdown-item" href="#">회원 탈퇴</a>
                </div>
            </li>
        </ul>
        <div class="float-right" style= "display: flex; justify-content: right;">
            <%
                session=request.getSession();
                //session=request.getSession(true);
                Member memberInfo = (Member) session.getAttribute("member");
                if(memberInfo==null){
            %>
            <form class="needs-validation" action="/signIn" method="GET">
                <button type="submit" class="btn btn-outline-primary float-right">Login</button>
            </form>
            <form class="needs-validation" action="/signUp" method="GET">
                <button type="submit" class="btn btn-primary float-right">Sign-up</button>
            </form>
            <% }else{ %>
<%--            <form class="needs-validation" action="/signout" method="GET">--%>
<%--                <button class="w-100 btn btn-lg btn-primary btn-block" type="submit">로그아웃</button>--%>
<%--            </form>--%>


<%--            <form class="needs-validation" action="/userUpdate" method="GET">--%>
<%--                <button class="w-100 btn btn-lg btn-primary btn-block" type="submit">회원수정</button>--%>
<%--            </form>--%>

<%--            <form class="needs-validation" action="/userDelete" method="POST">--%>
<%--                <button class="w-100 btn btn-lg btn-primary btn-block" type="submit">회원탈퇴</button>--%>
<%--            </form>--%>

            <% } %>
        </div>
    </div>
</nav>

</body>
</html>
