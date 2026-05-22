*** Settings ***
Resource    ../../config/import.resource
Resource    danh_sach_quang_cao.variables.resource

*** Keywords ***
Di Vao Man Hinh Danh Sach Hoa Don
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hoa_don}