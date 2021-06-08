<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String RESER_OK = (String) request.getAttribute("RESER_OK");
    if(RESER_OK.equals("success")){
        out.println("<script>alert('예약 성공!'); </script>");
        out.println("<script>location.href='/bookList'</script>");
    }
    else if(RESER_OK.equals("logincheck")){
        out.println("<script>alert('로그인을 하세요!'); </script>");
        out.println("<script>location.href='/signIn'</script>");
    }
    else if(RESER_OK.equals("fail")){
        out.println("<script>alert('이미 예약중인 도서입니다!'); </script>");
        out.println("<script>location.href='/bookList'</script>");
    }
%>
</body>
</html>
