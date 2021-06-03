<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-31
  Time: 오전 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String SIGNIN_OK = (String) request.getAttribute("SIGNIN_OK");
    if(SIGNIN_OK.equals("success")){
        out.println("<script>alert('로그인 성공!'); </script>");
        out.println("<script>location.href='/'</script>");
    }
    else if(SIGNIN_OK.equals("failid")){
        out.println("<script>alert('등록되지 않은 이메일 입니다!'); </script>");
        out.println("<script>location.href='/signIn'</script>");
    }
    else if(SIGNIN_OK.equals("failpwd")){
        out.println("<script>alert('등록되지 않은 패스워드 입니다!'); </script>");
        out.println("<script>location.href='/signIn'</script>");
    }
%>
</body>
</html>
