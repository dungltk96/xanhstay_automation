*** Settings ***
Resource    ../../config/import.resource
Resource    dang_nhap_variables.resource

*** Keywords ***
Thuc Hien Dang Nhap
    [Arguments]    ${so_dien_thoai}    ${mat_khau}

    Common - Click Element    ${btn_menu}  
    Common - Click Element    ${btn_ca_nhan}  
    Common - Click Element    ${btn_open_login}

    Common - Click Element    ${input_phone_number}
    Common - Input Element    ${input_phone_number}    ${so_dien_thoai}

    Common - Click Element    ${input_password}
    Common - Input Element    ${input_password}    ${mat_khau}

#    Wait Until Element Is Visible    ${btn_login}
    Common - Click Element    ${btn_login}

