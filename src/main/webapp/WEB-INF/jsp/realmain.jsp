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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

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

<!--슬라이드 띄울 장르 선택-->
<%--<form action="/" method="get">--%>
<%--  <button type="text" name="item" value="국내소설">국내소설</button>--%>
<%--  <button type="text" name="item" value="외국소설">외국소설</button>--%>
<%--  <button type="text" name="item" value="만화">만화</button>--%>
<%--</form>--%>
<%--<!--image slide-->--%>
<%--<div class="col-lg-4 col-md-offset-1">--%>
<%--<div id="imageSlide" class="carousel slide" data-ride="carousel">--%>
<%--  <ol class="carousel-indicators">--%>
<%--    <li data-target="#imageSlide" data-slide-to="0" class="active"></li>--%>
<%--    <li data-target="#imageSlide" data-slide-to="1"></li>--%>
<%--    <li data-target="#imageSlide" data-slide-to="2"></li>--%>
<%--  </ol>--%>
<%--  <div class="carousel-inner">--%>


<%--    <c:forEach var="book" items="${books}" varStatus="status">--%>
<%--      <c:choose>--%>
<%--        <c:when test="${status.index eq 0}">--%>
<%--          <div class="carousel-item active col-lg-3">--%>
<%--            <img src=${book.BOOK_IMG} width="151.5", height="200" >--%>
<%--            <p>${book.BOOK_NAME}</p>--%>
<%--          </div>--%>
<%--        </c:when>--%>
<%--        <c:when test="${status.index ne 0}">--%>
<%--          <div class="carousel-item col-lg-3">--%>
<%--            <img src=${book.BOOK_IMG} width="151.5", height="200" >--%>
<%--            <p>${book.BOOK_NAME}</p>--%>
<%--          </div>--%>
<%--        </c:when>--%>
<%--      </c:choose>--%>
<%--    </c:forEach>--%>

<%--  </div>--%>
<%--  <a class="carousel-control-prev" href="#imageSlide" role="button" data-slide="prev">--%>
<%--    <span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
<%--    <span class="sr-only">Previous</span>--%>
<%--  </a>--%>
<%--  <a class="carousel-control-next" href="#imageSlide" role="button" data-slide="next">--%>
<%--    <span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
<%--    <span class="sr-only">Next</span>--%>
<%--  </a>--%>
<%--</div>--%>

<%--</div>--%>
<!---->
<style type="text/css">

  .swiper-container {
    margin-top: 50px;
  }
  .swiper-slide {
    text-align:center;
    display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
    align-items:center; /* 위아래 기준 중앙정렬 */
    justify-content:center; /* 좌우 기준 중앙정렬 */
  }
  .swiper-slide img {
    max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
    /* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
  }

  a:link{
    text-decoration: none; color: black;
  }
  a:visited{
    text-decoration: none; color: black;
  }
  a:active{
    text-decoration: none; color: black;
  }
  a:hover{
    text-decoration: none; color: black;
  }
  .nav-item:hover{
    background-color: white;
  }
  .nav-item:active{
    background-color: white;
  }
  .nav-item:visited{
    background-color: white;
  }




</style>

<%--<div class="swiper-container">--%>


<%--  <nav aria-label="breadcrumb">--%>
<%--    <ol class="breadcrumb">--%>

<form name="ko" action="/" method="get">
  <input type="hidden" name="item" value="국내소설">
</form>

<form name="en" action="/" method="get">
  <input type="hidden" name="item" value="외국소설">
</form>

<form name="economy" action="/" method="get">
  <input type="hidden" name="item" value="경제경영">
</form>

<form name="science" action="/" method="get">
  <input type="hidden" name="item" value="인문과학">
</form>

<form name="comic" action="/" method="get">
  <input type="hidden" name="item" value="만화">
</form>

<%--      <li class="breadcrumb-item" ><a href="#" onclick="javascript:document.ko.submit()">국내소설</a></li>--%>
<%--      <li class="breadcrumb-item" ><a href="#" onclick="javascript:document.en.submit()">외국소설</a></li>--%>
<%--      <li class="breadcrumb-item"><a href="#" onclick="javascript:document.economy.submit()">경제경영</a></li>--%>
<%--      <li class="breadcrumb-item"><a href="#" onclick="javascript:document.science.submit()">인문과학</a></li>--%>
<%--      <li class="breadcrumb-item"><a href="#" onclick="javascript:document.comic.submit()">만화</a></li>--%>
<%--    </ol>--%>

<%--  </nav>--%>

<!---->
<div class="card text-center">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item">
        <a class="nav-link " href="#" onclick="javascript:document.ko.submit()">국내소설</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="javascript:document.en.submit()">외국소설</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="javascript:document.economy.submit()">경제경영</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="javascript:document.science.submit()">인문과학</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="javascript:document.comic.submit()">만화</a>
      </li>

    </ul>
  </div>
  <div class="card-body">
    <h5 class="card-title">베스트셀러 Top5</h5>
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <c:forEach var="book" items="${books}" varStatus="status">

          <div class="swiper-slide">
            <div>
              <img src=${book.BOOK_IMG} width="200", height="264" >
              <br><p>${book.BOOK_NAME}</p>
            </div>
          </div>

        </c:forEach>

      </div>

      <!-- 네비게이션 -->
      <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
      <div class="swiper-button-prev"></div><!-- 이전 버튼 -->

      <!-- 페이징 -->
      <div class="swiper-pagination"></div>
    </div>
  </div>
</div>
</div>
<!---->
<%--  <div style="text-align:center; margin-top:5px;">베스트셀러 Top 5</div>--%>
<%--  <div class="swiper-wrapper">--%>
<%--    <c:forEach var="book" items="${books}" varStatus="status">--%>

<%--      <div class="swiper-slide">--%>
<%--        <div>--%>
<%--        <img src=${book.BOOK_IMG} width="200", height="264" >--%>
<%--        <br><p>${book.BOOK_NAME}</p>--%>
<%--        </div>--%>
<%--      </div>--%>

<%--    </c:forEach>--%>

<%--  </div>--%>

<%--  <!-- 네비게이션 -->--%>
<%--  <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->--%>
<%--  <div class="swiper-button-prev"></div><!-- 이전 버튼 -->--%>

<%--  <!-- 페이징 -->--%>
<%--  <div class="swiper-pagination"></div>--%>
<%--</div>--%>

<script>

  new Swiper('.swiper-container', {

    slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
    spaceBetween : 10, // 슬라이드간 간격
    slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
    // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
    loopFillGroupWithBlank : true,

    loop : true, // 무한 반복

    pagination : { // 페이징
      el : '.swiper-pagination',
      clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
    },
    navigation : { // 네비게이션
      nextEl : '.swiper-button-next', // 다음 버튼 클래스명
      prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
    },
  });

</script>

</body>
</html>


