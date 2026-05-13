Cách chạy Project
1. Chạy toàn bộ các kịch bản test: robot -d results/ -v env:product tests/
2. Chạy chức năng đăng nhập: robot -d D:\xanhstay_automation\results\dang_nhap -v env:product D:\xanhstay_automation\tests\01_dang_nhap.robot
2. Chạy testcase Đăng ký xem căn hộ: robot -d D:\xanhstay_automation\results\dang_ky_xem_can_ho -v env:product D:\xanhstay_automation\tests\02_dang_ky_xem_can_ho.robot
3. Chạy một/ nhiều testcase đơn trong một suite: robot -t TCs_name   -t TCs2_name   đường dẫn file