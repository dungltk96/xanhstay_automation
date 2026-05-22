*** Settings ***
Resource    ../../common/keywords.resource
Resource    thanh_toan_hoa_don.variables.resource

*** Keywords ***
Thuc Hien Thanh Toan Hoa Don
    Thuc Hien Dang Nhap Thanh Cong
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_can_ho}

