*** Settings ***
Library         BuiltIn    # Cung cấp các keyword cơ bản để phục vụ viết testcase (Log, Log To Console, Should Be Equal, Set Variable, Sleep, Run Keyword If)
Library         AppiumLibrary    timeout=30s    # Cung cấp các keyword để open app, click phần tử, nhập dữ liệu, vuốt màn hình, kiểm tra hiển thị phần tử)
Library         DateTime    # Dùng để xử lý ngày giờ
Library         String    # Dùng để xử lý chuỗi ký tự
Library         Collections    # Xử lý mảng
Library         RequestsLibrary    # API
Library         JSONLibrary    # Đọc tệp json or response từ API
Library         OperatingSystem    #Dùng để thao tác hệ thống như thêm sửa xóa tệp.thư mục
Variables       ../data/device.yaml
Variables       ../data/data_${env}.yaml
Resource        ../common/keywords.resource
Resource        ../feature/dang_nhap/dang_nhap_keywords.resource
Resource        ../feature/dang_ky_xem_can_ho/dang_ky_xem_can_ho_keywords.resource
Resource        ../feature/thue_can_ho/thue_can_ho_keywords.resource
Resource        ../feature/quan_ly_hop_dong/xac_nhan_hop_dong_keywords.resource
Resource        ../feature/dang_xuat/dang_xuat_keywords.resource
Resource        ../feature/thanh_toan_hoa_don/thanh_toan_hoa_don_keywords.resource
Resource        ../feature/dat_coc_giu_cho/dat_coc_giu_cho_keywords.resource
Resource        ../feature/dang_ky_tai_khoan/dang_ky_tai_khoan_keywords.resource
Resource        ../feature/api_hop_dong/api_hop_dong_keywords.resource
