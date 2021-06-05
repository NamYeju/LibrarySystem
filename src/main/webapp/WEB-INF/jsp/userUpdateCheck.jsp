<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-06-05
  Time: 오후 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String UPDATE_OK = (String) request.getAttribute("UPDATE_OK");
    if(UPDATE_OK.equals("success")){
        out.println("<script>alert('회원수정 성공!'); </script>");
        out.println("<script>location.href='/'</script>");
    }
%>
</body>
</html>
