# AI Prompt Log - AutoRide

## Câu hỏi 1: Vì sao dùng DECIMAL cho dữ liệu tiền?
DECIMAL lưu số thập phân chính xác, phù hợp với tiền cọc, phí phạt và phí sửa chữa. FLOAT là kiểu số gần đúng và có thể gây sai số làm tròn.

## Câu hỏi 2: Vì sao tách bảng Inspections?
Tách Inspections giúp lưu riêng ngày kiểm tra, người kiểm tra và mô tả hư hỏng. Một hợp đồng có thể có nhiều lần kiểm tra, vì vậy quan hệ Rentals - Inspections có thể là 1-N.

## Câu hỏi 3: Làm thế nào tính tiền hoàn lại khi phí có giá trị NULL?
Có thể dùng COALESCE(late_fee, 0) và COALESCE(damage_fee, 0) để coi phí chưa nhập là 0. Công thức hoàn lại là tiền cọc trừ phí trễ và phí hư hỏng.

## Câu hỏi 4: Vì sao dùng ENUM cho trạng thái?
ENUM giới hạn các trạng thái hợp lệ, giảm lỗi nhập sai. Muốn cấm tạo biên bản kiểm tra khi hợp đồng đang BOOKED có thể dùng trigger hoặc kiểm tra ở tầng ứng dụng.

## Câu hỏi 5: Kết quả tình huống kiểm thử là bao nhiêu?
Tiền cọc 10.000.000 VNĐ, phí trễ 0 VNĐ, phí hư hỏng 2.000.000 VNĐ. Tiền hoàn lại là 8.000.000 VNĐ.

Ghi chú: Nhật ký trên là bản tóm tắt nội dung trao đổi kỹ thuật; cần chỉnh lại để phản ánh đúng các câu hỏi thực tế đã sử dụng.
