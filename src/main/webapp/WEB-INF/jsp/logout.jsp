<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-06-03
  Time: 오후 6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session=request.getSession();
    session=request.getSession(true);
    session.invalidate();
    out.println("<script>alert('로그아웃 성공!'); </script>");
    out.println("<script>location.href='/'</script>");
%>
</body>
</html>
