<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-29
  Time: 오후 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

    .container-fluid{
        margin-top: 150px;
    }
    .table{
        margin-left: auto;
        margin-right: auto;
    }
</style>
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
                <a class="nav-link" href="#">검색</a>
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
            <button type="button" class="btn btn-outline-primary float-right">Login</button>
            <button type="button" class="btn btn-primary float-right">Sign-up</button>
        </div>
    </div>
</nav>
<div class="container-fluid">
<div class="row">
<div class="col-md-3">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h2 class="panel-title"> 도서 </h2>
        </div>
        <ul class="list-group">
            <li class="list-group-item"> <a href="/list">국내소설</a> </li>
            <li class="list-group-item"> <a href="/list">해외소설</a> </li>
            <li class="list-group-item"> <a href="/list">경제경영</a> </li>
            <li class="list-group-item"> <a href="/list">인문과학</a> </li>
            <li class="list-group-item"> <a href="/list">만화</a> </li>
        </ul>

    </div>
    </div>

<div class="col-md-9">
<form class="needs-validation" novalidate method="post" action="list.jsp">
    <td>
        <input type="text" name="검색창">
        <input type="submit" value="검색">
    </td>
    <td>
        <input type="checkbox" name="item" value="BOOK_NAME">제목
        <input type="checkbox" name="item" value="AUTHOR">글쓴이
        <input type="checkbox" name="item" value="PUBLISHER">출판사
        <input type="checkbox" name="item" value="GENRE">장르
    </td>
</form>
<table class="table">
    <tbody>

        <tr>
            <c:forEach var="book" items="${books}" varStatus="status">
            <c:if test="${book.GENRE eq '국내소설'}">
                <figure class="figure">
            <img src=${book.BOOK_IMG} width="151.5", height="200" hspace="10">
                    <figcaption class="figure-caption">
                            이름: ${book.BOOK_NAME} <br>
                            저자: ${book.AUTHOR}<br>
                        출판사: ${book.PUBLISHER}<br>
                        대여: <button>${book.BOOK_STATE}</button>
                    </figcaption>
                </figure>
            </c:if>
            </c:forEach>
        </tr>



    </tbody>
</table>

</div>
</div>
</div>
</div>

</body>
</html>
