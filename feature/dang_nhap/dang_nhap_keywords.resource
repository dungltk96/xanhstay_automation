*** Settings ***
Resource    ../../config/import.resource
Resource    dang_nhap_variables.resource


*** Keywords ***
Thuc Hien Dang Nhap Thanh Cong
    [Arguments]    ${so_dien_thoai}    ${mat_khau}    ${display_name}

    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_open_form_login}

    Common - Click Element    ${input_phone_number}
    Common - Input Element    ${input_phone_number}    ${so_dien_thoai}

    Common - Click Element    ${input_password}
    Common - Input Element    ${input_password}    ${mat_khau}

    Common - Click Element    ${btn_nav_login}

    Sleep    3s

    Common - Click Element    ${menu_can_ho_da_luu}

    Wait Until Page Contains Element
    ...    ${lbl_chao_mung_user}
    ...    10s
    ...    error=LỖI HỆ THỐNG: Không tìm thấy phần tử hiển thị thông tin Chào mừng tại menu Đã lưu!
    ${actual_text}    Get Element Attribute    ${lbl_chao_mung_user}    content-desc
    ${expected_text}    Set Variable    Chào mừng\n${display_name}
    Should Be Equal As Strings
    ...    ${expected_text}
    ...    ${actual_text}
    ...    msg=LỖI NGHIỆP VỤ: Kết quả thực tế [${actual_text}] không khớp với kết quả mong muốn [${expected_text}]!

Thuc Hien Dang Nhap That Bai
    [Arguments]    ${so_dien_thoai}    ${mat_khau}

    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_open_form_login}

    Common - Click Element    ${input_phone_number}
    Common - Input Element    ${input_phone_number}    ${so_dien_thoai}

    Common - Click Element    ${input_password}
    Common - Input Element    ${input_password}    ${mat_khau}

    Common - Click Element    ${btn_nav_login}
    Sleep    3s

Thuc Hien Dang Nhap
    [Arguments]    ${so_dien_thoai}    ${mat_khau}

    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_open_form_login}

    Common - Click Element    ${input_phone_number}
    Common - Input Element    ${input_phone_number}    ${so_dien_thoai}

    Common - Click Element    ${input_password}
    Common - Input Element    ${input_password}    ${mat_khau}

    Common - Click Element    ${btn_nav_login}

Thuc Hien Dang Nhap App Admin
    [Arguments]    ${tai_khoan_admin}    ${mat_khau_admin}    ${display_name_admin}

    Common - Click Element    ${input_tai_khoan_admin}
    Common - Input Element    ${input_tai_khoan_admin}    ${tai_khoan_admin}

    Common - Click Element    ${input_password_admin}
    Common - Input Element    ${input_password_admin}    ${mat_khau_admin}

    Common - Click Element    ${btn_login_admin}
