*** Settings ***
Resource            ../config/import.resource

Test Setup          Setup - Open Application
Test Teardown       Common - Test Teardown


*** Test Cases ***
TC_01_Thue_can_ho_thanh_cong
    [Documentation]    Đăng ký thuê căn hộ thành công
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}
