*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Close Application

*** Test Cases ***
TC_MAU
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Di Vao Man Hinh Danh Sach Hoa Don