<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chuyển đổi USD sang VNĐ</title>
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            margin: 0;
            padding: 72px 16px;
            background: #f8fafc;
            color: #243247;
        }
        .converter-container {
            background: white;
            padding: 36px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,.10);
            width: 100%;
            max-width: 420px;
        }
        h1 { color: #1b2a7a; text-align: center; margin-top: 0; }
        label { display: block; font-weight: bold; margin: 18px 0 8px; }
        input {
            width: 100%; padding: 12px; border: 1px solid #cbd5e1;
            border-radius: 6px; font-size: 16px;
        }
        button {
            background: #1b2a7a; color: white; padding: 12px 20px;
            border: none; border-radius: 6px; cursor: pointer;
            width: 100%; font-weight: bold; margin-top: 22px; font-size: 16px;
        }
        button:hover { background: #121c54; }
        .hint { color: #64748b; font-size: 13px; line-height: 1.5; }
    </style>
</head>
<body>
    <main class="converter-container">
        <h1>Chuyển đổi USD sang VNĐ</h1>
        <p class="hint">Nhập tỉ giá và lượng USD muốn quy đổi.</p>
        <form action="converter.jsp" method="POST">
            <label for="rate">Tỉ giá (VND/USD)</label>
            <input type="number" id="rate" name="rate" value="25000"
                   placeholder="Ví dụ: 25000" min="0" step="any" required>

            <label for="usd">Lượng USD cần đổi</label>
            <input type="number" id="usd" name="usd"
                   placeholder="Ví dụ: 100" min="0" step="any" required>

            <button type="submit">Tính toán</button>
        </form>
    </main>
</body>
</html>
