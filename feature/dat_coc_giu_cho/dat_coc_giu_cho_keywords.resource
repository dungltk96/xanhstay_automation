*** Settings ***
Resource    ../../config/import.resource
Resource    dat_coc_giu_cho_variables.resource


*** Keywords ***
Thuc Hien Dat Coc Giu Cho 1
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Common - Click Element    ${btn_dat_coc_giu_cho}
    Sleep    2s
    Common - Click Element    ${btn_tiep_tuc}
    Wait Until Page Contains Element
    ...    ${nav_ui_thanh_toan_payos}
    ...    error=LỖI NGHIỆP VỤ: Đã xác nhận đặt cọc nhưng không chuyển sang màn thanh toán
    Page Should Contain Element    ${nav_ui_thanh_toan_payos}

Thuc Hien Dat Coc Giu Cho
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Sleep    5s
    ${is_dat_coc_visible}=    Run Keyword And Return Status    Page Should Contain Element    ${btn_dat_coc_giu_cho}
    ${is_thanh_toan_visible}=    Run Keyword And Return Status
    ...    Page Should Contain Element
    ...    ${btn_thanh_toan_lai_tien_coc}

    IF    ${is_dat_coc_visible}
        Log To Console    Đang thực hiện luồng thanh toán tiền cọc
        Common - Click Element    ${btn_dat_coc_giu_cho}
        Sleep    3s
        Common - Click Element    ${btn_tiep_tuc}
        Wait Until Page Contains Element
        ...    ${nav_ui_thanh_toan_payos}
        ...    error=LỖI NGHIỆP VỤ: Không chuyển sang màn thanh toán
        Page Should Contain Element    ${nav_ui_thanh_toan_payos}
    ELSE IF    ${is_thanh_toan_visible}
        Log To Console    Đang thực hiện luồng thanh toán tiền cọc
        Common - Click Element    ${btn_thanh_toan_lai_tien_coc}
        Sleep    3s
        Wait Until Page Contains Element
        ...    ${nav_ui_thanh_toan_payos}
        ...    error=LỖI NGHIỆP VỤ: Không chuyển sang màn thanh toán
        Page Should Contain Element    ${nav_ui_thanh_toan_payos}
    ELSE
        Log To Console    Căn hộ đã được đặt cọc và thanh toán hoặc không xác định trạng thái!
        Skip    Căn hộ đã ở trạng thái đã được đặt cọc, không thể thực hiện đặt cọc mới.
    END
