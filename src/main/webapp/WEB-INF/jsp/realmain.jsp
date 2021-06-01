<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-31
  Time: 오전 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
<%--  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>--%>
<%--  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>--%>
<%--  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
  <style>
    .carousel-inner > .carousel-item > img{
      width: 151.5px; height: 200px;
    }
    .carousel-control-prev-icon {
      background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23f00' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
    }

    .carousel-control-next-icon {
      background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23f00' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E");
    }
    .carousel{
      width: 151.5px; height: 200px;
    }
  </style>
</head>
<body>
<!--header / navbar-->
<div class="fixed-top">
  <jsp:include page="header.jsp" flush="false"/>
</div>
<!--session-->
<div style="padding-top: 100px; padding-bottom: 0px">
  <jsp:include page="main.jsp" flush="false"/>
</div>

<!--image slide-->
<div id="imageSlide" class="carousel slide" data-ride="carousel">
<%--  <ol class="carousel-indicators">--%>
<%--    <li data-target="#imageSlide" data-slide-to="0" class="active"></li>--%>
<%--    <li data-target="#imageSlide" data-slide-to="1"></li>--%>
<%--    <li data-target="#imageSlide" data-slide-to="2"></li>--%>
<%--  </ol>--%>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="" alt="">
      <div class="carousel-caption">
        <p>img name</p>
      </div>
    </div>


    <c:forEach var="book" items="${books}" varStatus="status">
      <c:if test="${book.COUNT == 3}">
      <div class="carousel-item"
          <img src=${book.BOOK_IMG} width="151.5", height="200" >
          <p>${book.BOOK_NAME}</p>
      </div>
      </c:if>
    </c:forEach>

  </div>
  <a class="carousel-control-prev" href="#imageSlide" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#imageSlide" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


</body>
</html>



