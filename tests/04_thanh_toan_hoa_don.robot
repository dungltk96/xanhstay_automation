*** Settings ***
Resource            ../config/import.resource

Test Setup          Setup-Open Application    user
Test Teardown       Teardown - Chup Anh Va Dong App
# Suite Setup    run keywords    Mo Ung Dung Va Dang Nhap He Thong    ${dt_phone_number}    ${dt_password}
# ...    AND    Set Library Search Order    AppiumLibrary    SeleniumLibrary
# Suite Teardown    Close Application
# Test Teardown    Don Dep Man Hinh Sau Khi Test


*** Test Cases ***
TC_01_Dang_ky_thue_can_ho_thanh_cong
    [Documentation]    Đăng ký thuê căn hộ thành công
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}

TC_02_Admin_duyet_hoa_don_tien_coc_thue_nha
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Setup-Open Application    admin
    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    Common - Keo De Lam Moi Man Hinh    2000ms

TC_03_Admin_duyet_hoa_don_tien_thue_nha
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke    flow
    [Setup]    Setup-Open Application    admin
    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha
