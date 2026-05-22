*** Settings ***
Resource    ../common/keywords.resource
Test Setup    Setup-Open Application
Test Teardown    Close Application

*** Test Cases ***
TC01_Thanh_toan_hoa_don
    [Documentation]    Thanh toán hóa đơn
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap   ${dt_phone_number}    ${dt_password}

