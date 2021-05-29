<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-29
  Time: 오후 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> <meta charset="EUC-KR"> </head>
<body>
<h1>  List </h1>
<ul>
    <c:forEach var="book" items="${books}" varStatus="status">
        <li> ${status.index+1} : ${book.BOOK_IMG}, ${book.BOOK_NAME},
                ${book.AUTHOR} </li>
    </c:forEach>
</ul>
</body>
</html>
