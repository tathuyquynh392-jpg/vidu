
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Calculator Result</title>
</head>
<body>
    <h1>Calculation Result</h1>

    <%
        String error = (String) request.getAttribute("error");

        if (error != null) {
    %>
        <p style="color: red;">
            Error: <%= error %>
        </p>
    <%
        } else {
    %>
        <p>
            <%= request.getAttribute("firstOperand") %>
            <%= request.getAttribute("operator") %>
            <%= request.getAttribute("secondOperand") %>
            =
            <%= request.getAttribute("result") %>
        </p>
    <%
        }
    %>

    <a href="index.jsp">Back to Calculator</a>
</body>
</html>
