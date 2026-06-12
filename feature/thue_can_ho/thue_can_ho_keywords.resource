*** Settings ***
Resource    ../../config/import.resource
Resource    thue_can_ho_variables.resource


*** Keywords ***
Thuc Hien Thue Can Ho
    [Arguments]    ${so_nguoi_o}
    Sleep    2s
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Common - Click Element    ${btn_thue_can_ho}

    Common - Click Element    ${ds_chu_ky_thanh_toan}
    Common - Click Element    ${btn_chon_phan_tu_chu_ky_thanh_toan_dau_tien}

    Common - Click Element    ${ds_thoi_han_hop_dong}
    Common - Click Element    ${btn_chon_chu_ky_thanh_toan}

    Common - Click Element    ${viewing_date_thue_can_ho}
    Common - Click Element    ${date_picker_today}
    Common - Click Element    ${btn_ok}

    Common - Click Element    ${input_so_nguoi_o}
    Common - Input Element    ${input_so_nguoi_o}    ${so_nguoi_o}

    Common - Click Element    ${btn_xac_nhan}
    Sleep    5s
    Page Should Contain Text    ${msg_thanh_cong}
    Common - Click Element    ${btn_dong}
