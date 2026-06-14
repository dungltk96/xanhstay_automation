*** Settings ***
Resource            ../config/import.resource

Test Setup          Setup-Open Application    user
Test Teardown       Teardown - Chup Anh Va Dong App


*** Test Cases ***
TC_01_Mo_danh_sach_hoa_don_thanh_toan
    [Documentation]    Mở danh sách hóa đơn thanh toán
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Mo Danh Sach Hoa Don Thanh Toan

TC_02_Click_hoa_don_dau_tien_de_xem_chi_tiet
    [Documentation]    Click xem chi tiết hóa đơn thanh toán đầu tiên
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Click Hoa Don Dau Tien De Xem Chi Tiet

TC_03_Dang_ky_thue_can_ho_thanh_cong
    [Documentation]    Đăng ký thuê căn hộ thành công
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}

TC_04_Admin_duyet_hoa_don_tien_coc_can_ho
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Setup-Open Application    admin
    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    Common - Keo De Lam Moi Man Hinh    2000ms

TC_05_Admin_duyet_hoa_don_tien_thue_dau_ky_can_ho
    [Documentation]    Admin duyệt hóa đơn tiền thuê đầu kỳ
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
