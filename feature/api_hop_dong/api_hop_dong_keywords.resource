*** Settings ***
Resource    ../../config/import.resource
Resource    api_hop_dong_variables.resource

*** Keywords ***
Lay Phan Tu API Dau Tien Trong Danh Dach Yeu Cau Ky Hop Dong
    ${access_token}    Common - Lay AccessToken Tu API Dang Nhap
    &{header}    Create Dictionary    Authorization=Bearer ${access_token}    Content-Type=application/json
    &{dic_data}=    Create Dictionary
    ${response_ds_yeu_cau_ky_hop_dong}     POST On Session    XanhStay    /api/v1/ContractRequest/list-contract-requests    headers=${header}    json=${dic_data}
    ${first_dic}    Get From List    ${response_ds_yeu_cau_ky_hop_dong.json()}[data][items]    0
    Log To Console    ${first_dic}
#    [Return]    ${response_ds_yeu_cau_ky_hop_dong.json()}[data][items][0]
    RETURN    ${first_dic}


Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Danh Sach Hop Dong
    [Arguments]    ${api_code}    ${api_from}    ${api_to}    ${api_price}    ${api_address}    ${api_name}
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hop_dong}

    ${locator_hop_dong_dau_tien}=    Set Variable    xpath=//android.view.View[contains(@content-desc, "HD")][1]
    Wait Until Page Contains Element    ${locator_hop_dong_dau_tien}    10s

    # Khởi tạo danh sách chứa các trường dữ liệu cần xác thực
    ${thong_tin_api_can_check}    Create List
    ...    ${api_code}
    ...    ${api_from}
    ...    ${api_to}
    ...    ${api_price}
    ...    ${api_address}
    ...    ${api_name}

    # Vòng lặp FOR quét qua từng từ khóa con trong danh sách
    FOR    ${item}    IN    @{thong_tin_api_can_check}
        Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc,'${item}')]    5s
        ...    error=LỖI CHỨC NĂNG: Giao diện yêu cầu xem phòng hiển thị sai lệch thông tin, không tìm thấy cụm từ: [${item}]
    END


Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Chi Tiet Hop Dong
    [Arguments]    ${api_code}    ${api_from}    ${api_adRentPrice}    ${api_deposit}    ${api_address}    ${api_apartmentUu}    ${api_apartmentSize}    ${api_renterUu_name}    ${api_renterUu_phoneNumber}
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_menu_tat_ca_hop_dong}

    ${locator_hop_dong_dau_tien}=    Set Variable    xpath=(//android.view.View[contains(@content-desc, "HD")])[1]
    Wait Until Page Contains Element    ${locator_hop_dong_dau_tien}    10s
    Common - Click Element    ${locator_hop_dong_dau_tien}

    # Khởi tạo danh sách chứa các trường dữ liệu cần xác thực
    ${thong_tin_api_can_check}    Create List
    ...    ${api_code}
    ...    ${api_from}
#    ...    ${api_to}
    ...    ${api_adRentPrice}
    ...    ${api_deposit}
    ...    ${api_address}
    ...    ${api_apartmentUu}
    ...    ${api_apartmentSize}
    ...    ${api_renterUu_name}
    ...    ${api_renterUu_phoneNumber}

    # Vòng lặp FOR quét qua từng từ khóa con trong danh sách
    FOR    ${item}    IN    @{thong_tin_api_can_check}
        Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc,'${item}')]    5s
        ...    error=LỖI CHỨC NĂNG: Giao diện yêu cầu xem phòng hiển thị sai lệch thông tin, không tìm thấy cụm từ: [${item}]
    END





#Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Chi Tiet Hop Dong NEW
#    [Arguments]    ${dic_api_hop_dong}
#    Common - Click Element    ${btn_menu}
#    Common - Click Element    ${btn_option_ca_nhan}
#    Common - Click Element    ${btn_menu_tat_ca_hop_dong}
#
#    # Bước kích vào màn chi tiết hợp đồng đầu tiên dựa trên Xpath gom nhóm chuẩn của bạn
#    ${btn_chi_tiet_hop_dong_dau_tien}=    Set Variable    xpath=(//android.view.View[contains(@content-desc, "HD")])[1]
#    Wait Until Page Contains Element    ${btn_chi_tiet_hop_dong_dau_tien}    10s
#    Common - Click Element    ${btn_chi_tiet_hop_dong_dau_tien}
#
#    Log To Console    \n--- BẮT ĐẦU ĐỐI CHIẾU MÀN CHI TIẾT ---
#    # Tạo danh sách các trường cần quét đối chiếu riêng cho màn Chi tiết
#    ${list_man_chi_tiet}    Create List
#    ...    ${dic_api_hop_dong.ma_hop_dong}
#    ...    ${dic_api_hop_dong.ngay_bat_dau}
#    ...    ${dic_api_hop_dong.ten_phong}
#    ...    ${dic_api_hop_dong.dia_chi}
#    ...    ${dic_api_hop_dong.so_tien}
#    ...    ${dic_api_hop_dong.tien_coc}
#    ...    ${dic_api_hop_dong.dien_tich}
#    ...    ${dic_api_hop_dong.ten_nguoi_thue}
#    ...    ${dic_api_hop_dong.sdt_nguoi_thue}
#
#    # Vòng lặp FOR quét qua giao diện màn chi tiết
#    FOR    ${item}    IN    @{list_man_chi_tiet}
#        Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc,'${item}')]    5s
#        ...    error=LỖI CHỨC NĂNG: Màn Chi Tiết hiển thị sai lệch thông tin, không tìm thấy cụm từ: [${item}]
#        Log To Console    => [PASS] Chi tiết hiển thị đúng: ${item}
#    END
#    Set Test Message    *HTML* <span style="color:green"><b>[PASS] DỮ LIỆU MÀN CHI TIẾT HỢP ĐỒNG CHÍNH XÁC 100%!</b></span>



#Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Danh Sach Hop Dong NEW
#    [Arguments]    ${dic_api_hop_dong}
#    Common - Click Element    ${btn_menu}
#    Common - Click Element    ${btn_option_ca_nhan}
#    Common - Click Element    ${btn_menu_tat_ca_hop_dong}
#
#    ${locator_hop_dong_dau_tien}=    Set Variable    xpath=//android.view.View[contains(@content-desc, "HD")][1]
#    Wait Until Page Contains Element    ${locator_hop_dong_dau_tien}    10s
#
#    Log To Console    \n--- BẮT ĐẦU ĐỐI CHIẾU MÀN DANH SÁCH ---
#    ${list_man_danh_sach}    Create List
#    ...    ${dic_api_hop_dong.ma_hop_dong}
#    ...    ${dic_api_hop_dong.ngay_bat_dau}
#    ...    ${dic_api_hop_dong.ngay_ket_thuc}
#    ...    ${dic_api_hop_dong.ten_phong}
#    ...    ${dic_api_hop_dong.dia_chi}
#    ...    ${dic_api_hop_dong.so_tien}
#
#    FOR    ${item}    IN    @{list_man_danh_sach}
#        Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc,'${item}')]    5s
#        ...    error=LỖI CHỨC NĂNG: Màn Danh Sách hiển thị sai thông tin, thiếu: [${item}]
#        Log To Console    => [PASS] Danh sách hiển thị đúng: ${item}
#    END
#    Set Test Message    *HTML* <span style="color:green"><b>[PASS] DỮ LIỆU MÀN DANH SÁCH HỢP ĐỒNG CHÍNH XÁC!</b></span>


#Lay Thong Tin Hop Dong Dau Tien Da Chuan Hoa Vao Dictionary
##    Lấy dữ liệu gốc API
#    ${first_hop_dong_dau_tien}    Lay Phan Tu API Dau Tien Trong Danh Dach Yeu Cau Ky Hop Dong
#
##    Chuẩn hóa các trường ngày tháng và tiền tệ
#    ${api_from_clean}    Common - Chuan Hoa Ngay Thang Tu API    ${first_hop_dong_dau_tien}[contractUu][from]
#    ${api_to_clean}    Common - Chuan Hoa Ngay Thang Tu API    ${first_hop_dong_dau_tien}[contractUu][to]
#    ${api_price_clean}    Common - Chuan Hoa Tien Te Tu API    ${first_hop_dong_dau_tien}[contractUu][price]
#    ${api_preDeposit_clean}    Common - Chuan Hoa Tien Te Tu API    ${first_hop_dong_dau_tien}[advertisementUu][preDeposit]
#
##    Đóng gói các trường dữ liệu hợp đồng vào dic
#    &{dic_thong_tin_hop_dong}    Create Dictionary
#    # --- Các trường cho TC_01 (Màn danh sách) ---
#    ...    ma_hop_dong=${first_hop_dong_dau_tien}[contractUu][code]
#    ...    ngay_bat_dau=${api_from_clean}
#    ...    ngay_ket_thuc=${api_to_clean}
#    ...    ten_phong=${first_hop_dong_dau_tien}[contractUu][apartmentUu][name]
#    ...    dia_chi=${first_hop_dong_dau_tien}[contractUu][apartmentUu][address]
#    ...    so_tien=${api_price_clean}
#    # --- Các trường bổ sung cho TC_02 (Màn chi tiết) ---
#    ...    tien_coc=${api_preDeposit_clean}
#    ...    dien_tich=${first_hop_dong_dau_tien}[apartmentUu][apartmentSize]
#    ...    ten_nguoi_thue=${first_hop_dong_dau_tien}[renterUu][name]
#    ...    sdt_nguoi_thue=${first_hop_dong_dau_tien}[renterUu][phoneNumber]
#
#    Log To Console    \n--- ĐÃ KHỞI TẠO DICTIONARY CHUNG THÀNH CÔNG ---
#    RETURN    &{dic_thong_tin_hop_dong}
