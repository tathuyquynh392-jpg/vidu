# AutoRide - Phân tích ERD và quy trình nghiệp vụ

## 1. Các khoảng trống dữ liệu

- Bảng Rentals sử dụng VARCHAR cho trạng thái nên có thể lưu các trạng thái không hợp lệ.
- Cơ sở dữ liệu thiếu security_deposit, late_fee và damage_fee, khiến hệ thống không thể tính đúng tiền hoàn lại.
- Hệ thống thiếu bảng Inspections để lưu ngày kiểm tra, nhân viên kiểm tra và chi tiết hư hỏng.
- Khóa ngoại cần có ON DELETE RESTRICT để ngăn xóa dữ liệu đang được bảng khác tham chiếu.

## 2. Thiết kế cải tiến

Sử dụng ENUM để giới hạn trạng thái hợp đồng. Các cột tiền sử dụng DECIMAL(10,2) nhằm tránh sai số của FLOAT. Bảng Inspections liên kết với Rentals thông qua rental_id và dùng ON DELETE RESTRICT.

Cột damage_fee là bắt buộc vì hệ thống phải lưu phí sửa chữa để khấu trừ vào tiền cọc. Nếu thiếu cột này, ứng dụng không thể tính đúng số tiền hoàn lại cho khách. Công thức là: tiền hoàn lại = tiền cọc - phí trễ - phí hư hỏng.
