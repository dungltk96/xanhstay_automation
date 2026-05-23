*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Close Application

*** Test Cases ***
TC01_Dang_xuat_thanh_cong
    [Documentation]    Đăng nhập vào hệ thống sau đó thực hiện Đăng xuất
    [Tags]    smoke
    Thuc Hien Dang Nhap Thanh Cong    ${dt_phone_number}    ${dt_password}    ${dt_display_name}
    Thuc Hien Dang Xuat
