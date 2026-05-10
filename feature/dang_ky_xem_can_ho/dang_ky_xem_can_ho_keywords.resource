*** Settings ***
Resource    ../../config/import.resource
Resource    dang_ky_xem_can_ho_variables.resource

*** Keywords ***
Thuc Hien Dang Ky Xem Can Ho Khi Login
    [Arguments]    ${ho_ten}    ${email}    ${so_dien_thoai}
    
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Common - Click Element    ${btn_dang_ky_xem_can_ho}
    
#    ${ngay_hien_tai}    Get Current Date    result_format=%d/%m/%Y
#    ${locator_ngay_hom_nay}=    Replace String    ${date_picker_item}    [date]    ${ngay_hien_tai}
    
#    Common - Click Element    ${locator_ngay_hom_nay}

    Common - Click Element    ${viewing_date}
    Common - Click Element    ${date_picker_today}
    Common - Click Element    ${btn_chon}

    Common - Click Element    ${input_ho_ten}
    Common - Input Element    ${input_ho_ten}    ${ho_ten}

    Common - Click Element    ${input_email}
    Common - Input Element    ${input_email}    ${email}

    Should Be Equal As Strings    phone_number           
    Common - Click Element    ${input_so_dien_thoai}
    Common - Input Element    ${input_so_dien_thoai}    ${so_dien_thoai}

    Common - Click Element    ${btn_xac_nhan}

    Wait Until Page Contains    ${msg_thanh_cong}

#Thuc Hien Dang Ky Xem Can Ho Khi Co Login