*** Settings ***
Resource    ../../common/keywords.resource
Resource    thanh_toan_hoa_don_variables.resource


*** Keywords ***
Thuc Hien Mo Danh Sach Hoa Don Thanh Toan
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hoa_don}

Thuc Hien Click Hoa Don Dau Tien De Xem Chi Tiet
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hoa_don}
    Common - Click Element    ${btn_chi_tiet_hoa_don_dau_tien}
    Sleep    5s

Thuc Hien Thanh Toan Hoa Don Tien Thue
    Common - Click Element
    ...    ${btn_chon_hoa_don_chua_thanh_toan_tien_thue}
    Common - Click Element
    ...    ${btn_thanh_toan_phieu}
    Common - Click Element    ${btn_tiep_tuc}
    Sleep    3s
    Common - Click Element    ${nav_ui_thanh_toan_payos}

# Thuc Hien Thanh Toan Hoa Don Tien Coc
#    Common - Click Element    ${btn_menu}
#    Common - Click Element    ${btn_option_ca_nhan}
#    Common - Click Element    ${btn_menu_tat_ca_hoa_don}
#
#    Common - Click Element
#    ...    ${btn_chon_hoa_don_chua_thanh_toan_coc}
#    Common - Click Element
#    ...    ${btn_thanh_toan_phieu}
#    Common - Click Element    ${btn_tiep_tuc}
#    Common - Click Element    ${nav_ui_thanh_toan_payos}
#    Sleep    2s

Thuc Hien Thanh Toan Hoa Don Tien Coc Giu Cho
    Common - Click Element
    ...    ${btn_chon_hoa_don_chua_thanh_toan_tien_coc_giu_cho}
    Common - Click Element
    ...    ${btn_thanh_toan_phieu}
    Common - Click Element    ${btn_tiep_tuc}
    Common - Click Element    ${nav_ui_thanh_toan_payos}

Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    Common - Click Element    ${menu_hoa_don_admin}
    Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc,'Đặt cọc căn hộ ${dic_thong_tin_yeu_cau_thue_can_ho}[ten_can_ho]')][contains(@content-desc,'Chờ thanh toán')]
    Common - Click Element    ${btn_chon_hoa_don_thanh_toan_coc_t1_admin}
    Common - Click Element    ${btn_xac_nhan_thanh_toan_admin}
    Common - Click Element    ${popup_xac_nhan_thanh_toan_admin}
    Wait Until Page Contains Element    ${msg_duyet_hoa_don_thanh_cong_admin}
    Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc,'Đặt cọc căn hộ ${dic_thong_tin_yeu_cau_thue_can_ho}[ten_can_ho]')]
    Wait Until Page Contains Element    xpath=//android.view.View[@content-desc='Đã thanh toán']

Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha
    Common - Click Element    ${menu_hoa_don_admin}
    Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc,'Hóa đơn tiền thuê ${dic_thong_tin_yeu_cau_thue_can_ho}[ten_can_ho]')][contains(@content-desc,'Chờ thanh toán')]
    Common - Click Element
    ...    ${btn_chon_hoa_don_thanh_toan_nha_t1_admin}
    Common - Click Element    ${btn_xac_nhan_thanh_toan_admin}
    Common - Click Element    ${popup_xac_nhan_thanh_toan_admin}
    Wait Until Page Contains Element    ${msg_duyet_hoa_don_thanh_cong_admin}
    Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc,'Hóa đơn tiền thuê ${dic_thong_tin_yeu_cau_thue_can_ho}[ten_can_ho]')]
    Wait Until Page Contains Element    xpath=//android.view.View[@content-desc='Đã thanh toán']
