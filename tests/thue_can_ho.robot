*** Settings ***
Resource    ../config/import.resource

*** Test Cases ***
TC_01_Dang_ky_thue_can_ho_thanh_cong
    Setup-Open Application

    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}

    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}

    Teardown - Close Application
