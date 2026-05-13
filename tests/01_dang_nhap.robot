*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Close Application

*** Test Cases ***
TC_01_Dang_nhap_thanh_cong
#    Thuc Hien Dang Nhap    0989628827    Dung123@
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
