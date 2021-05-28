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
    //String SIGNIN_OK = (String) request.getAttribute("SIGNIN_OK");

    if(SIGNUP_OK.equals("success")){
        out.println("<script>location.href='/'</script>");
    }


    //if(SIGNIN_OK.equals("success")){
       // out.println("<script>location.href='/'</script>");
    //}

%>


</BODY>
</HTML>
