<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String RENTAL_OK = (String) request.getAttribute("RENTAL_OK");
    if(RENTAL_OK.equals("success")){
        out.println("<script>alert('대여 성공!'); </script>");
        out.println("<script>location.href='/bookRental'</script>");
    }
    else if(RENTAL_OK.equals("resercheck")){
        out.println("<script>alert('예약중인 도서입니다!'); </script>");
        out.println("<script>location.href='/bookList'</script>");
    }
    else if(RENTAL_OK.equals("logincheck")){
        out.println("<script>alert('로그인을 하세요!'); </script>");
        out.println("<script>location.href='/signIn'</script>");
    }
    else if(RENTAL_OK.equals("fail")){
        out.println("<script>alert('이미 대여중인 도서입니다!'); </script>");
        out.println("<script>location.href='/bookList'</script>");
    }
%>
</body>
</html>
