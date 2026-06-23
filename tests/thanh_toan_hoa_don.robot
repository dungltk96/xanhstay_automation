*** Settings ***
Resource            ../config/import.resource

Suite Setup         Run Keywords    Setup - Open Application    user
...                     AND    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
Test Setup          Common - Test Setup    user
Test Teardown       Common - Test Teardown    user


*** Test Cases ***
TC_01_Mo_danh_sach_hoa_don_thanh_toan
    [Documentation]    Mở danh sách hóa đơn thanh toán
    [Tags]    smoke    flow
    Thuc Hien Mo Danh Sach Hoa Don Thanh Toan

TC_02_Click_hoa_don_dau_tien_de_xem_chi_tiet
    [Documentation]    Click xem chi tiết hóa đơn thanh toán đầu tiên
    [Tags]    smoke    flow
    Thuc Hien Click Hoa Don Dau Tien De Xem Chi Tiet

TC_03_Dang_ky_thue_can_ho_thanh_cong
    [Documentation]    Đăng ký thuê căn hộ thành công
    [Tags]    smoke    flow
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}

TC_04_Admin_duyet_hoa_don_thanh_toan_tien_coc
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Run Keywords    Setup - Open Application    admin
    ...    AND    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    Common - Keo De Lam Moi Man Hinh    2000ms
    [Teardown]    Common - Test Teardown    admin

TC_05_Admin_duyet_hoa_don_thanh_toan_tien_thue_dau_ky
    [Documentation]    Admin duyệt hóa đơn tiền thuê đầu kỳ
    [Tags]    smoke    flow
    [Setup]    Common - Test Setup    admin
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha
    [Teardown]    Common - Test Teardown    admin

TC_06_Xac_nhan_hop_dong_thanh_cong
    [Documentation]    Xác nhận hợp đồng thành công
    [Tags]    smoke    flow
    Di Vao Man Hinh Chi Tiet Hop Dong
    Kiem Tra Xac Nhan Hop Dong Thanh Cong    ${title_thong_bao_xac_nhan_hop_dong_success}
