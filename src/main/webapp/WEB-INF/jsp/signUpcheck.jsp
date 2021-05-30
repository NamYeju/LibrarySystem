<%--
  Created by IntelliJ IDEA.
  User: 남예주
  Date: 2021-05-27
  Time: 오후 5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<HTML>
<BODY>
<%
    String SIGNUP_OK = (String) request.getAttribute("SIGNUP_OK");
    if(SIGNUP_OK.equals("success")){
        out.println("<script>alert('회원가입 성공!'); </script>");
        out.println("<script>location.href='/'</script>");
    }
    else if(SIGNUP_OK.equals("fail")){
        out.println("<script>alert('이미 가입한 회원입니다!'); </script>");
        out.println("<script>location.href='/'</script>");
    }
%>
</BODY>
</HTML>
