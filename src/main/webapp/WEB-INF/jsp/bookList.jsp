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

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <!--검색 조건 체크박스(책제목, 저자, 출판사) 중복체크 안 되게-->
    <script type="text/javascript">
        function oneCheckbox(a){
            var obj = document.getElementsByName("item");
            for(var i=0; i<obj.length; i++){
                if(obj[i] != a){
                    obj[i].checked = false;
                }
            }
        }
    </script>
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
<!--header / navbar-->
<div class="fixed-top">
    <jsp:include page="header.jsp" flush="false"/>
</div>

<!--주요 화면 -->
<div class="container-fluid">
<div class="row">
<!-- 장르 네비게이션 -->
<div class="col-md-3">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h2 class="panel-title"> 도서 </h2>
        </div>
        <form action="/bookList" method="get">
            <ul class="list-group">
                <button class="list-group-item" name="item" value=""> 전체보기 </button>
            </ul>
        </form>
        <!-- 검색 조건에 따른 북리스트 -->
        <form action="/genreSearch" method="post">
        <ul class="list-group">
            <button class="list-group-item" name="item" value="국내소설">국내소설 </button>
            <button class="list-group-item" name="item" value="외국소설"> 해외소설 </button>
            <button class="list-group-item" name="item" value="경제경영">경제경영</button>
            <button class="list-group-item" name="item" value="인문과학"> 인문과학 </button>
            <button class="list-group-item" name="item" value="만화"> 만화 </button>
        </ul>
        </form>
    </div>
    </div>

<!--결과 화면 보여짐 -->
<div class="col-md-9">
<form  action="/conditionSearch" method="post" >
    <td>
        <input type="text" name="info">
        <input type="submit" value="검색">
    </td>
    <td>
        <input type="checkbox" name="item" value="BOOK_NAME">제목
        <input type="checkbox" name="item" value="AUTHOR">글쓴이
        <input type="checkbox" name="item" value="PUBLISHER">출판사
    </td>
</form>
<table class="table">
    <tbody>
    <tr>
        <c:forEach var="book" items="${bookList}" varStatus="status">
                <figure class="figure">
                    <img src=${book.BOOK_IMG} width="151.5", height="200" hspace="10">
                    <figcaption class="figure-caption">
                        이름: ${book.BOOK_NAME} <br>
                        저자: ${book.AUTHOR}<br>
                        출판사: ${book.PUBLISHER}<br>
                        대여: <button>${book.BOOK_STATE}</button>
                    </figcaption>
                    <form action="/bookRentalCheck" method="post">
                        대출:<button name="bookname" value="${book.BOOK_NAME}"> 대출 </button>
                    </form>
                    <form action="/bookReservCheck" method="post">
                        예약:<button name="bookname" value="${book.BOOK_NAME}"> 예약 </button>
                    </form>
                </figure>
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
