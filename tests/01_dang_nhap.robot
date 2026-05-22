*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Close Application

*** Test Cases ***
TC_01_Dang_nhap_thanh_cong
    [Documentation]    Đăng nhập thành công
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap Thanh Cong    ${dt_phone_number}    ${dt_password}    ${dt_display_name}

TC02_De_Trong_SDT
    [Documentation]    Bỏ trống trường SĐT
    [Tags]    verify
    Thuc Hien Dang Nhap That Bai    ${dt_phone_number_null}    ${dt_password}
    Wait Until Page Contains Element    ${msg_loi_dang_nhap_sdt}

TC03_De_Trong_Mat_Khau
    [Documentation]    Bỏ trống trường mật khẩu
    [Tags]    verify
    Thuc Hien Dang Nhap That Bai    ${dt_phone_number}    ${dt_password_null}
    Wait Until Page Contains Element    ${msg_loi_dang_nhap_mat_khau}

TC04_De_Trong_SDT_Va_Mat_Khau
    [Documentation]    Bỏ trống trường SĐT và mật khẩu
    [Tags]    verify
    Thuc Hien Dang Nhap That Bai    ${dt_phone_number_null}    ${dt_password_null}
    Wait Until Page Contains Element    ${msg_loi_dang_nhap_mat_khau}