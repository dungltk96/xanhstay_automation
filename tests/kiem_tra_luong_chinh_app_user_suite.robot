*** Settings ***
Resource            ../config/import.resource

Suite Setup         Mo Ung Dung Va Dang Nhap He Thong    ${dt_phone_number}    ${dt_password}
Test Setup          Common - Test Setup
Test Teardown       Common - Test Teardown


*** Test Cases ***
TC_01_Dang_nhap_thanh_cong
    [Documentation]    Đăng nhập thành công
    [Tags]    smoke    flow
    Common - Click Element    ${menu_can_ho_da_luu}

    Wait Until Page Contains Element
    ...    ${lbl_chao_mung_user}
    ...    10s
    ...    error=LỖI HỆ THỐNG: Không tìm thấy phần tử hiển thị thông tin Chào mừng tại menu Đã lưu!
    ${actual_text}    Get Element Attribute    ${lbl_chao_mung_user}    content-desc
    ${expected_text}    Set Variable    Chào mừng\n${dt_display_name}
    Should Be Equal As Strings
    ...    ${expected_text}
    ...    ${actual_text}
    ...    msg=LỖI NGHIỆP VỤ: Kết quả thực tế [${actual_text}] không khớp với kết quả mong muốn [${expected_text}]!

TC_02_Thue_can_ho_thanh_cong
    [Documentation]    Đăng ký thuê căn hộ thành công
    [Tags]    smoke
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}

TC_03_Kiem_tra_he_thong_tu_dong_tao_hop_dong_va_doi_chieu_du_lieu_danh_sach_hop_dong_giua_API_va_UI
    [Documentation]    Kiểm tra hệ thống tự động tạo hợp đồng và đối chiếu dữ liệu giữa API và giao diện phần tử đầu tiên màn danh sách hợp đồng
    Lay Du Lieu Tu API Hop Dong Va Chuan Hoa Du Lieu API
    Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Danh Sach Hop Dong
    ...    ${api_code_hop_dong}
    ...    ${api_from_hop_dong}
    ...    ${api_to_hop_dong}
    ...    ${api_ten_can_ho}
    ...    ${api_dia_chi_can_ho}
    ...    ${api_gia_thue_can_ho}

TC_04_Kiem_tra_tu_dong_sinh_hoa_don_thanh_toan_khi_thue_can_ho
    [Documentation]    Kiểm tra hệ thống tự động sinh ra hóa đơn thanh toán khi thuê căn hộ
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}    Nửa năm
    Go Back
    Kiem Tra Hoa Don Thanh Toan

TC_05_Admin_duyet_hoa_don_thanh_toan_tien_coc
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Run Keywords    Setup - Open Application    admin
    ...    AND    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    [Teardown]    Common - Test Teardown    admin

TC_06_Admin_duyet_hoa_don_thanh_toan_tien_thue_dau_ky
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Common - Test Setup    admin
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha
    [Teardown]    Common - Test Teardown    admin

TC_07_Xac_nhan_hop_dong_thanh_cong
    [Documentation]    Xác nhận hợp đồng thành công
    [Tags]    smoke    flow
    Di Vao Man Hinh Chi Tiet Hop Dong
    Kiem Tra Xac Nhan Hop Dong Thanh Cong    ${title_thong_bao_xac_nhan_hop_dong_success}
