<%@ page import="com.example.librarysystem.domain.entity.Member" %><%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-06-05
  Time: 오후 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    session=request.getSession();
    session=request.getSession(true);
    Member memberInfo = (Member) session.getAttribute("member");
    String DELETE_OK = (String) request.getAttribute("DELETE_OK");
    out.println(memberInfo.getName());
    if(DELETE_OK.equals("success")){
        out.println("<script>alert('회원탈퇴 성공!'); </script>");
        out.println("<script>location.href='/'</script>");
    }
    session.invalidate();
    out.println(memberInfo.getName());
%>
</body>
</html>
