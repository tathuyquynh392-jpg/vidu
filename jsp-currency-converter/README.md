# Ứng dụng chuyển đổi tiền tệ bằng JSP

Dự án Maven Webapp theo bài thực hành, sử dụng JSP Scriptlet (`<% %>`) để nhận dữ liệu/tính toán và JSP Expression (`<%= %>`) để hiển thị kết quả. Tương thích Java 17 và Apache Tomcat 10.1+.

## Chức năng
- `index.jsp`: form nhập tỉ giá (`rate`) và lượng USD (`usd`), gửi POST đến `converter.jsp`.
- `converter.jsp`: đọc tham số, ép kiểu số thực, tính `VND = USD * Rate`, hiển thị kết quả bằng JSP Expression.
- Báo lỗi thân thiện khi thiếu dữ liệu, dữ liệu không phải số hoặc giá trị âm.

## Cấu trúc
```text
jsp-currency-converter/
├── pom.xml
└── src/main/webapp/
    ├── index.jsp
    ├── converter.jsp
    └── WEB-INF/web.xml
```

## Cách chạy
1. Giải nén ZIP và mở thư mục `jsp-currency-converter` trong IntelliJ IDEA.
2. Chọn JDK 17 và chờ Maven tải dependency.
3. Mở Terminal tại thư mục có `pom.xml` rồi chạy:
   ```bash
   mvn clean package
   ```
4. Khi Maven báo `BUILD SUCCESS`, WAR nằm tại `target/jsp-currency-converter.war`.
5. Deploy file WAR lên Apache Tomcat 10.1+.
6. Truy cập `http://localhost:8080/jsp-currency-converter/`.

## Kiểm thử nhanh
Với tỉ giá `25000` và lượng USD `100`, kết quả mong đợi là `2.500.000 VNĐ`.
