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
