*** Settings ***
Resource    ../../common/keywords.resource
Resource    thanh_toan_hoa_don_variables.resource


*** Keywords ***
Thuc Hien Thanh Toan Hoa Don Tien Coc
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hoa_don}

    Common - Click Element
    ...    ${btn_chon_hoa_don_chua_thanh_toan_coc}
    Common - Click Element
    ...    ${btn_thanh_toan_phieu}
    Common - Click Element    ${btn_tiep_tuc}
    Sleep    3s
    Common - Click Element    ${nav_ui_thanh_toan_payos}
    Sleep    2s
    Go Back
    Go Back
    Go Back

Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    Common - Click Element    ${menu_hoa_don_admin}
    Sleep    3s
    Common - Click Element    ${btn_chon_hoa_don_thanh_toan_coc_t1_admin}
    Sleep    5s
    Common - Click Element    ${btn_xac_nhan_thanh_toan_admin}
    Sleep    5s
    Common - Click Element    ${popup_xac_nhan_thanh_toan_admin}
    Sleep    7s
    Wait Until Page Contains Element    ${msg_duyet_hoa_don_thanh_cong_admin}
    Common - Click Element    ${btn_back_admin}

Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha
    Common - Click Element    ${menu_hoa_don_admin}
    Sleep    3s
    Common - Click Element
    ...    ${btn_chon_hoa_don_thanh_toan_nha_t1_admin}
    Sleep    5s
    Common - Click Element    ${btn_xac_nhan_thanh_toan_admin}
    Sleep    5s
    Common - Click Element    ${popup_xac_nhan_thanh_toan_admin}
    Wait Until Page Contains Element    ${msg_duyet_hoa_don_thanh_cong_admin}    30s

Thuc Hien Thanh Toan Hoa Don Tien Thue
    Common - Click Element
    ...    ${btn_chon_hoa_don_chua_thanh_toan_tien_thue}
    Common - Click Element
    ...    ${btn_thanh_toan_phieu}
    Common - Click Element    ${btn_tiep_tuc}
    Sleep    3s
    Common - Click Element    ${nav_ui_thanh_toan_payos}

Thuc Hien Thanh Toan Hoa Don Tien Coc Giu Cho
    Common - Click Element
    ...    ${btn_chon_hoa_don_chua_thanh_toan_tien_coc_giu_cho}
    Common - Click Element
    ...    ${btn_thanh_toan_phieu}
    Common - Click Element    ${btn_tiep_tuc}
    Common - Click Element    ${nav_ui_thanh_toan_payos}
