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
                <a class="nav-link" href="/bookList">검색</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/bookRental">대출</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/bookReturn">반납</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/bookReserve">예약</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    마이페이지
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">대여/반납 현황</a>
                    <a class="dropdown-item" href="/myBook">예약 현황</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/userUpdate">회원 정보 수정</a>
                    <form name="userDelete" class="needs-validation" action="/userDelete" method="POST">
                        <input type="hidden" type="submit"></input>
                    </form>
                    <a class="dropdown-item" href="#" onclick="javascript:document.userDelete.submit();">회원 탈퇴</a>
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
            <marquee  width="300" height="50"> <% if(memberInfo!=null) out.print(memberInfo.getName()+"님이 로그인 중입니다. "); %> </marquee>

            <form class="needs-validation" action="/logout" method="GET">
                <button class="btn btn-primary float-right" type="submit">로그아웃</button>
            </form>

            <% } %>
        </div>
    </div>
</nav>

</body>
</html>
