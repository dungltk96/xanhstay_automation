*** Settings ***
Resource    ../config/import.resource

*** Test Cases ***
TC_01_Dang_ky_xem_can_ho_thanh_cong
    [Tags]    open_app
    Setup-Open Application

    Thuc Hien Dang Nhap    ${phone_number}    ${password}

    Thuc Hien Dang Ky Xem Can Ho Khi Login    ${ho_ten}    ${email}    ${phone_number}

    Teardown - Close Application

#TC_02_Dang_ky_xem_can_ho_that_bai
