
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Calculator</title>
</head>
<body>
    <h1>Simple Calculator</h1>

    <form action="calculator" method="post">
        <label>First operand:</label>
        <input type="number" step="any"
               name="firstOperand" required>

        <br><br>

        <label>Operator:</label>
        <select name="operator">
            <option value="+">Addition (+)</option>
            <option value="-">Subtraction (-)</option>
            <option value="*">Multiplication (*)</option>
            <option value="/">Division (/)</option>
        </select>

        <br><br>

        <label>Second operand:</label>
        <input type="number" step="any"
               name="secondOperand" required>

        <br><br>

        <button type="submit">Calculate</button>
    </form>
</body>
</html>
