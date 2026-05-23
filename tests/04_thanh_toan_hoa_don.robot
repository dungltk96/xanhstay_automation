*** Settings ***
Resource    ../common/keywords.resource
Suite Setup    Mo Ung Dung Va Dang Nhap He Thong    ${dt_phone_number}    ${dt_password}
Suite Teardown    Close Application
Test Teardown    Don Dep Man Hinh Sau Khi Test

*** Test Cases ***
TC01_Thanh_toan_hoa_don_tien_coc
    [Documentation]    Thanh toán hóa đơn tiền cọc
    [Tags]    smoke    flow
    Thuc Hien Thanh Toan Hoa Don Tien Coc

TC02_Thanh_toan_hoa_don_tien_thue
    [Documentation]    Thanh toán hóa đơn tiền thuê
    [Tags]    smoke    flow
    Thuc Hien Thanh Toan Hoa Don Tien Thue


