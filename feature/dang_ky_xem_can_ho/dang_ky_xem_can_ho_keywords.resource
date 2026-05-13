*** Settings ***
Resource    ../../config/import.resource
Resource    dang_ky_xem_can_ho_variables.resource

*** Keywords ***
Thuc Hien Dang Ky Can Ho Khi Chua Login
    [Arguments]    ${ho_ten}    ${email}    ${so_dien_thoai}
    
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Common - Click Element    ${btn_dang_ky_xem_can_ho}
    
#    ${ngay_hien_tai}    Get Current Date    result_format=%d/%m/%Y
#    ${locator_ngay_hom_nay}=    Replace String    ${date_picker_item}    [date]    ${ngay_hien_tai}
    
#    Common - Click Element    ${locator_ngay_hom_nay}

    Common - Click Element    ${viewing_date_xem_can_ho}
    Common - Click Element    ${date_picker_today}
    Common - Click Element    ${btn_chon}

#    Lấy giá trị element thực tế & so sánh kq mong muốn với kq thực tế
    ${actual_ho_ten}    Get Text    ${input_ho_ten}
    Should Be Equal As Strings    ${dt_ho_ten}    ${actual_ho_ten}

    ${actual_email}    Get Text    ${input_email}
    Should Be Equal As Strings    ${dt_email}    ${actual_email}
    
    ${actual_so_dien_thoai}    Get Text    ${input_so_dien_thoai}
    Should Be Equal As Strings    ${dt_phone_number}    ${actual_so_dien_thoai}

    Common - Click Element    ${btn_xac_nhan}

    Wait Until Page Contains    ${msg_thanh_cong}

#Thuc Hien Dang Ky Xem Can Ho Khi Co Login