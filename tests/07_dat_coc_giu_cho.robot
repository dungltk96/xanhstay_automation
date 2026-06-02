*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Close Application

*** Test Cases ***
TC01_Dat_coc_giu_cho_that_bai
    [Documentation]    Đặt cọc giữ chỗ thất bại do không thanh toán hóa đơn thành công (yêu cầu chuyển khoản qua payos)
    [Tags]    smoke    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Dat Coc Giu Cho

TC02_Dang_ky_va_kiem_tra_thong_tin_coc_giu_cho_that_bai
    [Documentation]    Kiểm tra thông tin yêu cầu cọc giữ chỗ, trường hợp cọc giữ chỗ thất bại
    [Tags]    flow
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}git
    Thuc Hien Dat Coc Giu Cho

