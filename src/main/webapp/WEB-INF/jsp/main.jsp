<%@ page import="com.example.librarysystem.domain.entity.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    session=request.getSession();
    session=request.getSession(true);
    Member member = (Member)session.getAttribute("member");
%>
</body>
</html>
