*** Settings ***
Resource            ../config/import.resource

Test Setup          Setup-Open Application    user
Test Teardown       Teardown - Chup Anh Va Dong App


*** Test Cases ***
TC_01_Dang_nhap_thanh_cong
    [Documentation]    Đăng nhập thành công
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap Thanh Cong    ${dt_phone_number}    ${dt_password}    ${dt_display_name}

TC_02_Dang_ky_xem_can_ho_thanh_cong
    [Documentation]    Đăng ký xem căn hộ thành công
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Dang ky Xem Can Ho    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}
    Go Back

TC_03_Dang_ky_thue_can_ho_thanh_cong
    [Documentation]    Đăng ký thuê căn hộ thành công
    [Tags]    smoke
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}

TC_04_Duyet_Hoa_Don_Thanh_Toan_Tien_Coc
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Setup-Open Application    admin
    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    Common - Keo De Lam Moi Man Hinh    2000ms

TC_05_Duyet_Hoa_Don_Thanh_Toan_Tien_Thue
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Setup-Open Application    admin
    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha

TC_06_Xac_nhan_hop_dong_thanh_cong
    [Documentation]    Xác nhận hợp đồng thành công
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Di Vao Man Hinh Chi Tiet Hop Dong
    Kiem Tra Xac Nhan Hop Dong Thanh Cong    ${title_thong_bao_xac_nhan_hop_dong_success}
