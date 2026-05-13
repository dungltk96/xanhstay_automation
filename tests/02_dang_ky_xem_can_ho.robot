*** Settings ***
Resource    ../config/import.resource

*** Test Cases ***
TC_01_Dang_ky_xem_can_ho_thanh_cong
    [Tags]    open_app
    Setup-Open Application

    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}

    Thuc Hien Dang Ky Can Ho Khi Chua Login    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}

    Teardown - Close Application

#TC_02_Dang_ky_xem_can_ho_that_bai
