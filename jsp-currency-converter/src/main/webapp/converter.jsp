<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả chuyển đổi</title>
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif; display: flex; justify-content: center;
            margin: 0; padding: 72px 16px; background: #f8fafc; color: #243247;
        }
        .result-container {
            background: white; padding: 36px; border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,.10); text-align: center;
            width: 100%; max-width: 480px;
        }
        h1 { color: #1b2a7a; margin-top: 0; }
        .result { background: #e8f5e9; padding: 18px; border-radius: 8px; margin-top: 20px; }
        .result h2 { color: #23834e; margin: 0; font-size: 24px; }
        .back-btn {
            text-decoration: none; padding: 11px 20px; background: #1b2a7a;
            color: white; border-radius: 6px; display: inline-block; margin-top: 22px;
        }
        .error { background: #ffebee; color: #b42318; padding: 14px; border-radius: 8px; }
    </style>
</head>
<body>
    <main class="result-container">
        <h1>Kết quả chuyển đổi</h1>
        <%
            String rateInput = request.getParameter("rate");
            String usdInput = request.getParameter("usd");
            boolean valid = true;
            float rate = 0;
            float usd = 0;
            float vnd = 0;
            try {
                rate = Float.parseFloat(rateInput);
                usd = Float.parseFloat(usdInput);
                if (rate < 0 || usd < 0 || Float.isInfinite(rate) || Float.isInfinite(usd)
                        || Float.isNaN(rate) || Float.isNaN(usd)) {
                    valid = false;
                } else {
                    vnd = rate * usd;
                    if (Float.isInfinite(vnd) || Float.isNaN(vnd)) {
                        valid = false;
                    }
                }
            } catch (Exception e) {
                valid = false;
            }
            NumberFormat moneyFormat = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
            moneyFormat.setMaximumFractionDigits(2);
            moneyFormat.setMinimumFractionDigits(0);
        %>

        <% if (valid) { %>
            <p>Tỉ giá hiện tại: <strong><%= moneyFormat.format(rate) %> VND/USD</strong></p>
            <p>Lượng USD yêu cầu: <strong>$<%= moneyFormat.format(usd) %></strong></p>
            <div class="result">
                <h2>Thành tiền: <%= moneyFormat.format(vnd) %> VNĐ</h2>
            </div>
        <% } else { %>
            <div class="error">
                <h2>Dữ liệu không hợp lệ</h2>
                <p>Vui lòng nhập tỉ giá và lượng USD là số không âm.</p>
            </div>
        <% } %>

        <a href="index.jsp" class="back-btn">Quay lại trang chủ</a>
    </main>
</body>
</html>
