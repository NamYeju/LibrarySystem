<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String RETURN_OK = (String) request.getAttribute("RETURN_OK");
    if(RETURN_OK.equals("success")){
        out.println("<script>alert('반납 성공!'); </script>");
        out.println("<script>location.href='/bookReturn'</script>");
    }
    else if(RETURN_OK.equals("fail")){
        out.println("<script>alert('로그인을 하세요!'); </script>");
        out.println("<script>location.href='/'</script>");
    }
%>
</body>
</html>