# 📱 Xanhstay Mobile Automation Testing Project

Dự án kiểm thử tự động (Automation Testing) cho ứng dụng di động quản lý phòng trọ **Xanhstay** sử dụng hệ sinh thái Robot Framework và Appium. Tài liệu này hướng dẫn chi tiết từ cấu trúc nguồn, thiết lập môi trường đến quy trình thực thi kịch bản kiểm thử.

---

## 🛠️ 1. Công Nghệ Sử Dụng

Dự án được xây dựng và phát triển dựa trên các công nghệ cốt lõi sau:
* **Ngôn ngữ lập trình:** Python 3.x
* **Kiểm thử Framework:** Robot Framework
* **Thư viện hỗ trợ:**
    * `robotframework-appiumlibrary` (Tương tác UI Mobile)
    * `robotframework-requestslibrary` (Kiểm thử API / Hỗ trợ tiền xử lý dữ liệu)
    * `robotframework-pabot` (Thực thi song song - Parallel Execution nhằm tối ưu thời gian)
    * `robotframework-datadriver` (Kiểm thử hướng dữ liệu ngoại vi qua file CSV/Excel)
* **Công cụ bổ trợ:**
    * **IDE:** PyCharm (Kèm plugin *Robot Framework Language Server*)
    * **Mobile Driver:** Appium Server (v2.x) & UiAutomator2 Driver
    * **Locator Viewer:** Appium Inspector
    * **Giả lập/Thiết bị thật:** Android Studio (Emulator) hoặc Điện thoại Android vật lý.

---
## 2. Cách chạy kiểm thử testcase
1. Chạy toàn bộ kịch bản kiểm thử dự án: robot -d [đường dẫn file lưu kết quả test] -v env:product [đường dẫn folder chứa các chức năng cần chạy của dự án]
2. Chạy suite (chức năng): robot -d [đường dẫn file lưu kết quả test] -v env:product [đường dẫn file chức năng cần chạy test]
3. Chạy theo tag (độ ưu tiên testcase hoặc tag cụ thể), vd tag smoke: robot -d [đường dẫn file lưu kết quả test] -v env:product -i smoke [đường dẫn folder chứa các chức năng cần chạy của dự án/ hoặc đường dẫn chức năng cần chạy test]
4. Chạy một hoặc nhiều testcase trong một suite: robot -t [đường dẫn file lưu kết quả test] -t [tên TC01] -t [tên TC02] -v:env:product [đường dẫn file chức năng cần chạy test]
5. Chạy lại các testcase failed trong lần chạy gần nhất: robot -d [results/đặt tên foler testcase] -v:env:product [đường dẫn file chức năng cần chạy test]
6. Chạy testcase và tạo mới đường dẫn file lưu kết quả test

## 📂 3 Cấu Trúc Thư Mục

Dự án sử dụng mô hình phân lớp nhằm tách biệt tầng kịch bản (Test Cases), tầng xử lý nghiệp vụ (Keywords) và tầng dữ liệu (Test Data).

```text
xanhstay_automation/
│
├── configs/            # Cấu hình môi trường toàn cục (Biến hệ thống, Desired Capabilities)
│   └── import.resource
│
├── common/             # Từ khóa dùng chung cho toàn dự án (Mở/Đóng app, tương tác cơ bản)
│   ├── common_keywords.resource
│   └── common_variables.resource
│
├── feature/            # Tầng nghiệp vụ bọc (Page Object Model / Business Keywords)
│   ├── dang_nhap/
│   └── dang_ky_xem_can_ho/
│
├── data/               # Dữ liệu kiểm thử ngoại vi (Dùng cho Data-Driven Testing)
│   └── dang_ky_tai_khoan.csv
│
├── tests/              # Tầng chứa kịch bản kiểm thử (Test Suites - Tập tin *.robot)
│   ├── 01_dang_nhap.robot
│   └── 02_dang_ky_xem_can_ho.robot
│
├── results/            # Kết quả thực thi sau khi chạy test
│   ├── log.html        # Nhật ký chi tiết
│   ├── report.html     # Báo cáo tổng quan
│   ├── output.xml      # File kết quả cho CI/CD
│   └── screenshots/    # Ảnh chụp màn hình tự động khi kịch bản xảy ra lỗi (Failures)
│
└── requirements.txt    # Danh sách thư viện Python cần thiết cho dự án
