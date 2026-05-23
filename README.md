Cách chạy Project
1. Chạy toàn bộ các kịch bản test: robot -d results/ -v env:product tests/
2. Chạy toàn bộ TC theo thẻ tag smoke: robot -d D:\xanhstay_automation\results -v env:product -i smoke D:\xanhstay_automation\tests
2. Chạy TC Đăng nhập: robot -d D:\xanhstay_automation\results\dang_nhap -v env:product D:\xanhstay_automation\tests\01_dang_nhap.robot

-----------Vấn đề khác
Chạy một/ nhiều testcase đơn trong một suite: robot -t TCs_name   -t TCs2_name   đường dẫn file

noReset: false --> Mỗi lần chạy test, ứng dụng xóa sạch dữ liệu cũ (cache, tk đăng nhập), giúp TC luôn bắt đầu từ trạng thái sạch, tránh lỗi do dl của lần chạy trước

fullReset: false --> Giúp ngăn chặn việc Appium tự động gỡ cài đặt (Uninstall) ứng dụng sau khi chạy xong. Nhờ đó, app vẫn sẽ nằm trên điện thoại, giúp bạn tiết kiệm thời gian vì không phải chờ hệ thống cài lại app từ đầu cho mỗi lần chạy test tiếp theo

Wait Until Page Contains (Chờ đến khi xuất hiện): Yêu cầu Bot tạm dừng mọi hành động và liên tục "nhìn" vào màn hình điện thoại để tìm một chuỗi văn bản (text). Ngay khi dòng chữ đó xuất hiện, Bot sẽ lập tức chạy lệnh tiếp theo.

Wait Until Page Does Not Contain (Chờ đến khi biến mất): Yêu cầu Bot tạm dừng và liên tục theo dõi một dòng chữ đang có sẵn trên màn hình. Ngay khi dòng chữ đó hoàn toàn biến mất (mờ đi hoặc bị đóng lại), Bot mới được phép chạy lệnh tiếp theo.

Suite Setup / Suite Teardown = Đóng/mở app 1 LẦN DUY NHẤT cho NHIỀU Test Cases, Mô phỏng đúng luồng trải nghiệm liên tục của người dùng thực tế

Test Setup / Test Teardown = Đóng/mở app LIÊN TỤC cho TỪNG Test Case.

