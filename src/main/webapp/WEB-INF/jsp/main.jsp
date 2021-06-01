<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-27
  Time: 오후 7:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.librarysystem.domain.entity.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    session=request.getSession();
    session=request.getSession(true);
    Member member = (Member)session.getAttribute("member");
    if(member!=null){
        out.println("session값: "+member.getEmail());
        out.println("session값: "+member.getName());
        out.println("session값: "+member.getPhone());
    }
%>
</body>
</html>
