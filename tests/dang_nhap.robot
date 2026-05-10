*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Close Application

*** Test Cases ***
TC_01_Dang_nhap_thanh_cong
    Thuc Hien Dang Nhap    ${phone_number}    ${password}
