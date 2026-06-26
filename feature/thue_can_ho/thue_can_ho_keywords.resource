*** Settings ***
Resource    ../../config/import.resource
Resource    thue_can_ho_variables.resource


*** Keywords ***
Thuc Hien Thue Can Ho
    [Arguments]    ${so_nguoi_o}    ${chu_ky_thanh_toan}=Quý
    Sleep    2s
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}

    ${value_ten_can_ho}    Common - Get Attribute    ${ten_can_ho_man_dang_ky_thue_can_ho}    content-desc
    Set To Dictionary    ${dic_thong_tin_yeu_cau_thue_can_ho}    ten_can_ho=${value_ten_can_ho}
    ${value_so_tien_thue_1_thang}    Common - Get Attribute    ${so_tien_thue_1_thang}    content-desc
    ${so_tien_thanh_toan_dau_ky}    Tinh Toan So Tien Thue Dau Ky
    ...    ${value_so_tien_thue_1_thang}
    ...    ${chu_ky_thanh_toan}
    Log To Console    ${so_tien_thanh_toan_dau_ky}
    Set To Dictionary    ${dic_thong_tin_yeu_cau_thue_can_ho}    tien_thue_dau_ky=${so_tien_thanh_toan_dau_ky}

    Common - Click Element    ${btn_thue_can_ho}

    Common - Click Element    ${ds_chu_ky_thanh_toan}
    Common - Click Element    xpath=//android.widget.Button[contains(@content-desc,'${chu_ky_thanh_toan}')]

    Common - Click Element    ${ds_thoi_han_hop_dong}
    Common - Click Element    ${btn_chon_chu_ky_thanh_toan}

    Common - Click Element    ${viewing_date_thue_can_ho}
    Common - Click Element    ${date_picker_today}
    Common - Click Element    ${btn_ok}

    Common - Click Element    ${input_so_nguoi_o}
    Common - Input Element    ${input_so_nguoi_o}    ${so_nguoi_o}

    Common - Click Element    ${btn_xac_nhan}
    Wait Until Page Contains Element    ${title_dang_ky_thue_phong_thanh_cong}
    Wait Until Page Contains Element    ${content_dang_ky_thue_phong_thanh_cong}
    Common - Click Element    ${btn_dong}

Kiem Tra Hoa Don Thanh Toan
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hoa_don}

    Kiem Tra Hoa Don Tien Thue
    Kiem Tra Hoa Don Tien Coc

Kiem Tra Hoa Don Tien Thue
    # Khởi tạo danh sách chứa các trường dữ liệu cần xác thực
    ${thong_tin_hoa_don_tien_thue_dau_ky}    Create List
    ...    Chưa thanh toán
    ...    Hóa đơn tiền thuê ${dic_thong_tin_yeu_cau_thue_can_ho}[ten_can_ho]
    ...    ${dic_thong_tin_yeu_cau_thue_can_ho}[tien_thue_dau_ky]

    FOR    ${item}    IN    @{thong_tin_hoa_don_tien_thue_dau_ky}
        Wait Until Page Contains Element
        ...    xpath=//android.view.View[contains(@content-desc, '${item}')]
        ...    5s
        ...    error=Không hiển thị thông tin [${item}] trên hóa đơn.
    END

Kiem Tra Hoa Don Tien Coc
     # Khởi tạo danh sách chứa các trường dữ liệu cần xác thực
    ${thong_tin_hoa_don_tien_coc}    Create List
    ...    Chưa thanh toán
    ...    Đặt cọc căn hộ ${dic_thong_tin_yeu_cau_thue_can_ho}[ten_can_ho]

    FOR    ${item}    IN    @{thong_tin_hoa_don_tien_coc}
        Wait Until Page Contains Element
        ...    xpath=//android.view.View[contains(@content-desc, '${item}')]
        ...    5s
        ...    error=Không hiển thị thông tin [${item}] trên hóa đơn.
    END

Format VND
    [Arguments]    ${amount}
    ${result}    Evaluate    "{:,}".format(int($amount)).replace(",", ".") + " VNĐ"
    RETURN    ${result}

Tinh Toan So Tien Thue Dau Ky
    [Arguments]    ${so_tien_thue_1_thang}    ${chu_ky_thanh_toan}
    ${so_tien_thue_1_thang}    Replace String Using Regexp
    ...    ${so_tien_thue_1_thang}
    ...    [^0-9]
    ...
    IF    '${chu_ky_thanh_toan}' == 'Nửa năm'
        ${discount}    Set Variable    3
        ${so_thang_thanh_toan}    Set Variable    6
    ELSE IF    '${chu_ky_thanh_toan}' == '1 năm'
        ${discount}    Set Variable    5
        ${so_thang_thanh_toan}    Set Variable    12
    ELSE IF    '${chu_ky_thanh_toan}' == 'Quý'
        ${discount}    Set Variable    0
        ${so_thang_thanh_toan}    Set Variable    3
    ELSE
        ${discount}    Set Variable    0
        ${so_thang}    Replace String Using Regexp
        ...    ${chu_ky_thanh_toan}
        ...    [^0-9]
        ${so_thang_thanh_toan}    Set Variable    3
    END
    ${so_tien_thue_dau_ky}    Evaluate
    ...    round(${so_thang_thanh_toan} * ${so_tien_thue_1_thang} * (100 - ${discount}) / 100)
    ${formated_so_tien_thue_dau_ky}    Format VND    ${so_tien_thue_dau_ky}
    RETURN    ${formated_so_tien_thue_dau_ky}
