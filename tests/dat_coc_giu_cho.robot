*** Settings ***
Resource            ../config/import.resource

Test Setup          Setup - Open Application
Test Teardown       Common - Test Teardown


*** Test Cases ***
TC01_Dat_coc_giu_cho
    [Documentation]    Đặt cọc giữ chỗ
    [Tags]    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Dat Coc Giu Cho
