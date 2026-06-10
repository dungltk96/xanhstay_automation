*** Settings ***
Resource    ../../common/keywords.resource
Resource    thanh_toan_hoa_don.variables.resource

*** Keywords ***
Thuc Hien Thanh Toan Hoa Don Tien Coc
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hoa_don}
    
    Common - Click Element    ${btn_chon_hoa_don_chua_thanh_toan_coc}    #Không tìm thấy hóa đơn tiền cọc cần thanh toán
    Common - Click Element    ${btn_thanh_toan_phieu}    #Lỗi kích nút [Thanh toán] không điều hướng đến màn [Thanh toán phiếu]
    Common - Click Element    ${btn_tiep_tuc}    #Lỗi kích nút [Tiếp tục] không điều hướng đến màn payos
    Sleep    3s
    Common - Click Element    ${nav_ui_thanh_toan_payos}    #Lỗi không hiển thị màn payos
    Sleep    2s
    Go Back
    Go Back
    Go Back

Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
    Common - Click Element    ${menu_hoa_don_admin}
    Sleep    3s
    Common - Click Element    ${btn_chon_hoa_don_thanh_toan_coc_t1_admin}   #Không tìm thấy hóa đơn cọc cần duyệt
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
    Common - Click Element    ${btn_chon_hoa_don_thanh_toan_nha_t1_admin}    #Không tìm thấy hóa đơn tiền thuê đầu kỳ cần duyệt
    Sleep    5s
    Common - Click Element    ${btn_xac_nhan_thanh_toan_admin}
    Sleep    5s
    Common - Click Element    ${popup_xac_nhan_thanh_toan_admin}
    Wait Until Page Contains Element    ${msg_duyet_hoa_don_thanh_cong_admin}    30s

Thuc Hien Thanh Toan Hoa Don Tien Thue
    Common - Click Element    ${btn_chon_hoa_don_chua_thanh_toan_tien_thue}    #Không tìm thấy hóa đơn tiền thuê cần thanh toán
    Common - Click Element    ${btn_thanh_toan_phieu}    #rror=eLỗi kích nút [Thanh toán] không điều hướng đến màn [Thanh toán phiếu]
    Common - Click Element    ${btn_tiep_tuc}    #Lỗi kích nút [Tiếp tục] không điều hướng đến màn payos
    Sleep    3s
    Common - Click Element    ${nav_ui_thanh_toan_payos}    #Lỗi không hiển thị màn payos

Thuc Hien Thanh Toan Hoa Don Tien Coc Giu Cho
    Common - Click Element    ${btn_chon_hoa_don_chua_thanh_toan_tien_coc_giu_cho}    #Không tìm thấy hóa đơn tiền thuê cần thanh toán
    Common - Click Element    ${btn_thanh_toan_phieu}    #Lỗi kích nút [Thanh toán] không điều hướng đến màn [Thanh toán phiếu]
    Common - Click Element    ${btn_tiep_tuc}     #Lỗi kích nút [Tiếp tục] không điều hướng đến màn payos
    Common - Click Element    ${nav_ui_thanh_toan_payos}    #Lỗi không hiển thị màn payos

