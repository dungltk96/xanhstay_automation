*** Settings ***
Resource    ../../config/import.resource
Resource    dang_xuat_variables.resource


*** Keywords ***
Thuc Hien Dang Xuat
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_dang_xuat}
    Common - Click Element    ${btn_dang_xuat}

    Wait Until Page Contains Element
    ...    ${lbl_man_hinh_dang_nhap}
    ...    10s
    ...    error=LỖI HỆ THỐNG: Đăng xuất không điều hướng ra màn Đăng nhập
