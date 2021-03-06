<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Adding Dropdowns in Bootstrap 4 via Data Attributes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

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

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h2 class="panel-title"> ?????? </h2>
                </div>
                <form action="/bookList" method="get">
                    <ul class="list-group">
                        <button class="list-group-item" name="item" value=""> ???????????? </button>
                    </ul>
                </form>
                <form action="/genreSearch" method="post">
                    <ul class="list-group">
                        <button class="list-group-item" name="item" value="????????????">???????????? </button>
                        <button class="list-group-item" name="item" value="????????????"> ???????????? </button>
                        <button class="list-group-item" name="item" value="????????????">????????????</button>
                        <button class="list-group-item" name="item" value="????????????"> ???????????? </button>
                        <button class="list-group-item" name="item" value="??????"> ?????? </button>
                    </ul>
                </form>

            </div>
        </div>

        <div class="col-md-9">
            <form action="/conditionSearch" method="post">
                <td>
                    <input type="text" name="info">
                    <input type="submit" value="??????">
                </td>
                <td>
                    <input type="checkbox" name="item" value="BOOK_NAME" onclick="oneCheckbox(this)">??????
                    <input type="checkbox" name="item" value="AUTHOR" onclick="oneCheckbox(this)">?????????
                    <input type="checkbox" name="item" value="PUBLISHER" onclick="oneCheckbox(this)">?????????
                </td>
            </form>

            <table class="table">
                <tbody>

                <tr>
                    <c:forEach var="book" items="${bookList}" varStatus="status">

                        <figure class="figure">
                            <img src=${book.BOOK_IMG} width="151.5", height="200" hspace="10">
                            <figcaption class="figure-caption">
                                ??????: ${book.BOOK_NAME} <br>
                                ??????: ${book.AUTHOR}<br>
                                ?????????: ${book.PUBLISHER}<br>
                                ??????: <button>${book.BOOK_STATE}</button>
                            </figcaption>

                            <form action="/bookRentalCheck" method="post">
                                ??????:<button name="bookname" value="${book.BOOK_NAME}"> ?????? </button>
                            </form>
                            <form action="/bookReservCheck" method="post">
                                ??????:<button name="bookname" value="${book.BOOK_NAME}"> ?????? </button>
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