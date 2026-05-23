*** Settings ***
Resource    ../../common/keywords.resource
Resource    thanh_toan_hoa_don.variables.resource

*** Keywords ***
Thuc Hien Thanh Toan Hoa Don Tien Coc
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hoa_don}
    
    Wait Until Page Contains Element    ${btn_chon_hoa_don_chua_thanh_toan_coc}    error=Không tìm thấy hóa đơn tiền cọc cần thanh toán
    Common - Click Element    ${btn_chon_hoa_don_chua_thanh_toan_coc}

    Wait Until Page Contains Element    ${btn_thanh_toan_phieu}    error=Lỗi kích nút [Thanh toán] không điều hướng đến màn [Thanh toán phiếu]
    Common - Click Element    ${btn_thanh_toan_phieu}

    Wait Until Page Contains Element    ${btn_tiep_tuc}    error=Lỗi kích nút [Tiếp tục] không điều hướng đến màn payos
    Common - Click Element    ${btn_tiep_tuc}
    Sleep    3s

    Wait Until Page Contains Element    ${nav_ui_thanh_toan_payos}    error=Lỗi không hiển thị màn payos
    Common - Click Element    ${nav_ui_thanh_toan_payos}
    Sleep    2s
    Go Back
    Go Back
    Go Back

Vao Web Admin Duyet Hoa Don Tien Coc

Thuc Hien Thanh Toan Hoa Don Tien Thue
    Wait Until Page Contains Element    ${btn_chon_hoa_don_chua_thanh_toan_tien_thue}    error=Không tìm thấy hóa đươn tiền thuê cần thanh toán
    Common - Click Element    ${btn_chon_hoa_don_chua_thanh_toan_tien_thue}

    Wait Until Page Contains Element    ${btn_thanh_toan_phieu}    error=Lỗi kích nút [Thanh toán] không điều hướng đến màn [Thanh toán phiếu]
    Common - Click Element    ${btn_thanh_toan_phieu}

    Wait Until Page Contains Element    ${btn_tiep_tuc}    error=Lỗi kích nút [Tiếp tục] không điều hướng đến màn payos
    Common - Click Element    ${btn_tiep_tuc}
    Sleep    3s

    Wait Until Page Contains Element    ${nav_ui_thanh_toan_payos}    error=Lỗi không hiển thị màn payos
    Common - Click Element    ${nav_ui_thanh_toan_payos}
    Sleep    2s

Thuc Hien Thanh Toan Hoa Don Tien Coc Giu Cho
    Wait Until Page Contains Element    ${btn_chon_hoa_don_chua_thanh_toan_tien_coc_giu_cho}    error=Không tìm thấy hóa đươn tiền thuê cần thanh toán
    Common - Click Element    ${btn_chon_hoa_don_chua_thanh_toan_tien_coc_giu_cho}

    Wait Until Page Contains Element    ${btn_thanh_toan_phieu}    error=Lỗi kích nút [Thanh toán] không điều hướng đến màn [Thanh toán phiếu]
    Common - Click Element    ${btn_thanh_toan_phieu}

    Wait Until Page Contains Element    ${btn_tiep_tuc}    error=Lỗi kích nút [Tiếp tục] không điều hướng đến màn payos
    Common - Click Element    ${btn_tiep_tuc}

    Wait Until Page Contains Element    ${nav_ui_thanh_toan_payos}    error=Lỗi không hiển thị màn payos
    Common - Click Element    ${nav_ui_thanh_toan_payos}
    Sleep    2s


Vao Web Admin Duyet Hoa Don Tien Thue
