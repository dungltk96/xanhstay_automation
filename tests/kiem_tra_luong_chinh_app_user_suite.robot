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

TC_02_Dang_ky_xem_can_ho_thanh_cong
    [Documentation]    Đăng ký xem căn hộ thành công
    [Tags]    smoke    flow
    Thuc Hien Dang ky Xem Can Ho    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}

TC_03_Thue_can_ho_thanh_cong
    [Documentation]    Đăng ký thuê căn hộ thành công
    [Tags]    smoke
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}

TC_04_Duyet_Hoa_Don_Thanh_Toan_Tien_Coc
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Run Keywords    Setup - Open Application    admin
    ...    AND    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    Common - Keo De Lam Moi Man Hinh    2000ms
    [Teardown]    Common - Test Teardown    admin

TC_05_Duyet_Hoa_Don_Thanh_Toan_Tien_Thue
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Common - Test Setup    admin
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha
    [Teardown]    Common - Test Teardown    admin

TC_06_Xac_nhan_hop_dong_thanh_cong
    [Documentation]    Xác nhận hợp đồng thành công
    [Tags]    smoke    flow
    Di Vao Man Hinh Chi Tiet Hop Dong
    Kiem Tra Xac Nhan Hop Dong Thanh Cong    ${title_thong_bao_xac_nhan_hop_dong_success}
