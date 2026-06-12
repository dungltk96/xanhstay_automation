*** Settings ***
Resource    ../../config/import.resource
Resource    api_hop_dong_variables.resource


*** Keywords ***
Lay Phan Tu API Dau Tien Trong Danh Dach Hop Dong
    ${access_token}=    Common - Lay AccessToken Tu API Dang Nhap
    &{header}=    Create Dictionary    Authorization=Bearer ${access_token}    Content-Type=application/json
    &{dic_data}=    Create Dictionary
    ${response_ds_yeu_cau_ky_hop_dong}=    POST On Session
    ...    XanhStay
    ...    /api/v1/ContractRequest/list-contract-requests
    ...    headers=${header}
    ...    json=${dic_data}
    ${first_dic}=    Get From List    ${response_ds_yeu_cau_ky_hop_dong.json()}[data][items]    0
    Log To Console    ${first_dic}
#    [Return]    ${response_ds_yeu_cau_ky_hop_dong.json()}[data][items][0]
    RETURN    ${first_dic}

Lay Du Lieu Tu API Hop Dong Va Chuan Hoa Du Lieu API
#    Bước 1: Lấy dữ liệu từ API
    ${first_hop_dong_dau_tien}=    Lay Phan Tu API Dau Tien Trong Danh Dach Hop Dong
    ${value_api_code_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][code]    # mã hợp đồng
    Set Suite Variable    ${api_code_hop_dong}    ${value_api_code_hop_dong}

    ${value_api_from_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][from]    # ngày bắt đầu thuê
    Set Suite Variable    ${api_from_hop_dong}    ${value_api_from_hop_dong}

    ${value_api_to_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][to]    # ngày gia hạn tiếp theo
    Set Suite Variable    ${api_to_hop_dong}    ${value_api_to_hop_dong}

    ${value_api_ten_can_ho}=    Set Variable    # tên căn hộ
    ...    ${first_hop_dong_dau_tien}[contractUu][apartmentUu][name]
    Set Suite Variable    ${api_ten_can_ho}    ${value_api_ten_can_ho}

    ${value_api_dia_chi_can_ho}=    Set Variable    # địa chỉ căn
    ...    ${first_hop_dong_dau_tien}[contractUu][apartmentUu][address]
    Set Suite Variable    ${api_dia_chi_can_ho}    ${value_api_dia_chi_can_ho}

    ${value_api_gia_thue_can_ho_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[adRentPrice]    # giá thuê
    Set Suite Variable    ${api_gia_thue_can_ho_hop_dong}    ${value_api_gia_thue_can_ho_hop_dong}

    ${value_api_tien_coc_can_ho}=    Set Variable    ${first_hop_dong_dau_tien}[deposit]    # tiền cọc
    Set Suite Variable    ${api_tien_coc_can_ho}    ${value_api_tien_coc_can_ho}

    ${value_api_dien_tich_can_ho}=    Set Variable    # diện tích căn
    ...    ${first_hop_dong_dau_tien}[apartmentUu][apartmentSize]
    Set Suite Variable    ${api_dien_tich_can_ho}    ${value_api_dien_tich_can_ho}

    ${value_api_ten_khach_thue_can_ho}=    Set Variable    # tên khách thuê
    ...    ${first_hop_dong_dau_tien}[renterUu][name]
    Set Suite Variable    ${api_ten_khach_thue_can_ho}    ${value_api_ten_khach_thue_can_ho}

    ${value_api_sdt_khach_thue_can_ho}=    Set Variable    # số điện thoại
    ...    ${first_hop_dong_dau_tien}[renterUu][phoneNumber]
    Set Suite Variable    ${api_sdt_khach_thue_can_ho}    ${value_api_sdt_khach_thue_can_ho}

#    Bước 2: Chuẩn hóa dữ liệu API
#    Format ngày tháng
    ${api_from_formated}=    Common - Chuan Hoa Ngay Thang Tu API    ${value_api_from_hop_dong}
    Set Suite Variable    ${api_from_hop_dong}    ${api_from_formated}

    ${api_to_formated}=    Common - Chuan Hoa Ngay Thang Tu API    ${value_api_to_hop_dong}
    Set Suite Variable    ${api_to_hop_dong}    ${api_to_formated}

#    Format tiền tệ
    ${api_gia_thue_can_ho_formated}=    Common - Chuan Hoa Tien Te Tu API    ${value_api_gia_thue_can_ho_hop_dong}
    Set Suite Variable    ${api_gia_thue_can_ho}    ${api_gia_thue_can_ho_formated}

    ${api_tien_coc_can_ho_formated}=    Common - Chuan Hoa Tien Te Tu API    ${value_api_tien_coc_can_ho}
    Set Suite Variable    ${api_tien_coc_can_ho}    ${api_tien_coc_can_ho_formated}

    Log To Console    ${api_code_hop_dong}
    Log To Console    ${api_from_hop_dong}
    Log To Console    ${api_to_hop_dong}
    Log To Console    ${api_gia_thue_can_ho_hop_dong}
    Log To Console    ${api_tien_coc_can_ho}
    Log To Console    ${api_ten_can_ho}
    Log To Console    ${api_dia_chi_can_ho}
    Log To Console    ${api_dien_tich_can_ho}
    Log To Console    ${api_ten_khach_thue_can_ho}
    Log To Console    ${api_sdt_khach_thue_can_ho}

    Log To Console    \n--- DỮ LIỆU API ĐÃ CHUẨN HÓA ---
    Log To Console    ${api_from_formated}
    Log To Console    ${api_to_formated}
    Log To Console    ${api_gia_thue_can_ho_formated}
    Log To Console    ${api_tien_coc_can_ho}

Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Danh Sach Hop Dong
    [Arguments]
    ...    ${api_code}
    ...    ${api_from}
    ...    ${api_to}
    ...    ${api_ten_can_ho}
    ...    ${api_dia_chi_can_ho}
    ...    ${api_gia_thue_can_ho}
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hop_dong}

    ${locator_hop_dong_dau_tien}=    Set Variable    ${btn_chi_tiet_hop_dong_dau_tien}
    Wait Until Page Contains Element    ${locator_hop_dong_dau_tien}    10s

    # Khởi tạo danh sách chứa các trường dữ liệu cần xác thực
    ${thong_tin_api_can_check}=    Create List
    ...    ${api_code}
    ...    ${api_from}
    ...    ${api_to}
    ...    ${api_ten_can_ho}
    ...    ${api_dia_chi_can_ho}
    ...    ${api_gia_thue_can_ho}

    # Vòng lặp FOR quét qua từng từ khóa con trong danh sách
    FOR    ${item}    IN    @{thong_tin_api_can_check}
        Wait Until Page Contains Element
        ...    xpath=//android.view.View[contains(@content-desc,'${item}')]
        ...    5s
        ...    error=LỖI CHỨC NĂNG: Giao diện yêu cầu xem phòng hiển thị sai lệch thông tin, không tìm thấy cụm từ: [${item}]
    END

Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Chi Tiet Hop Dong
    [Arguments]
    ...    ${api_code}
    ...    ${api_from}
    ...    ${api_gia_thue_can_ho}
    ...    ${api_tien_coc_can_ho}
    ...    ${api_ten_can_ho}
    ...    ${api_dia_chi_can_ho}
    ...    ${api_dien_tich_can_ho}
    ...    ${api_ten_khach_thue}
    ...    ${api_sdt_khach_thue}
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hop_dong}

    ${locator_hop_dong_dau_tien}=    Set Variable    ${btn_chi_tiet_hop_dong_dau_tien}
    Wait Until Page Contains Element    ${locator_hop_dong_dau_tien}    10s
    Common - Click Element    ${locator_hop_dong_dau_tien}

    # Khởi tạo danh sách chứa các trường dữ liệu cần xác thực
    ${thong_tin_api_can_check}=    Create List
    ...    ${api_code}
    ...    ${api_from}
    ...    ${api_gia_thue_can_ho}
    ...    ${api_tien_coc_can_ho}
    ...    ${api_dia_chi_can_ho}
    ...    ${api_ten_can_ho}
    ...    ${api_dien_tich_can_ho}
    ...    ${api_ten_khach_thue}
    ...    ${api_sdt_khach_thue}

    # Vòng lặp FOR quét qua từng từ khóa con trong danh sách
    FOR    ${item}    IN    @{thong_tin_api_can_check}
        Wait Until Page Contains Element
        ...    xpath=//android.view.View[contains(@content-desc,'${item}')]
        ...    5s
        ...    error=LỖI CHỨC NĂNG: Giao diện yêu cầu xem phòng hiển thị sai lệch thông tin, không tìm thấy cụm từ: [${item}]
    END
