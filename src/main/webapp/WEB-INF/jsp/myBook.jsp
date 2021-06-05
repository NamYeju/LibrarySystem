<%@ page import="com.example.librarysystem.domain.entity.Member" %>
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
<%
    session=request.getSession();
    session=request.getSession(true);
    Member member = (Member)session.getAttribute("member");
    if(member==null){
        out.println("<script>alert('로그인 하세요!'); </script>");
        out.println("<script>location.href='/signIn'</script>");
    }
%>


<!--header / navbar-->
<div class="fixed-top">
    <jsp:include page="header.jsp" flush="false"/>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-9">
            <table class="table">
                <tbody>
                <tr>
                    <% if (member==null){
                        out.println("<script>alert('로그인을 하세요!'); </script>");
                        out.println("<script>location.href='/signIn'</script>");
                    }
                    else{
                    %>
                    <p><%=member.getName()%>님의 예약도서</p>
                    <% }%>
                    <c:forEach var="book" items="${mybook}" varStatus="status">

                        <figure class="figure">
                            <img src=${book.BOOK_IMG} width="151.5", height="200" hspace="10">
                            <figcaption class="figure-caption">
                                이름: ${book.BOOK_NAME} <br>
                                저자: ${book.AUTHOR}<br>
                                출판사: ${book.PUBLISHER}<br>
                            </figcaption>

                            <form action="/bookRentalCheck" method="post">
                                대출:<button name="bookname" value="${book.BOOK_NAME}"> 대출 </button>
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