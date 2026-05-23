*** Settings ***
Resource    ../../config/import.resource
Resource    dat_coc_giu_cho.variables.resource

*** Keywords ***
Thuc Hien Dat Coc Giu Cho
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Common - Click Element    ${btn_dat_coc_giu_cho}
    Sleep    2s
    Common - Click Element    ${btn_tiep_tuc}
    Sleep    3s
    Wait Until Page Contains Element    ${nav_ui_thanh_toan_payos}    error=LỖI NGHIỆP VỤ: Đã xác nhận đặt cọc nhưng không chuyển sang màn thanh toán
    Page Should Contain Element    ${nav_ui_thanh_toan_payos}