*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Chup Anh Va Dong App

*** Test Cases ***
TC_01_So_Sanh_Du_Lieu_API_Va_UI_Phan_Tu_Dau_Tien_Trong_Danh_Sach_Hop-Dong
#    Bước 1: Lấy dữ liệu từ API
    ${first_hop_dong_dau_tien}=    Lay Phan Tu API Dau Tien Trong Danh Dach Hop Dong
    ${api_code_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][code]    #mã hợp đồng
    ${api_from_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][from]    #ngày bắt đầu thuê
    ${api_to_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][to]    #ngày gia hạn tiếp theo
    ${api_apartmentUu_name_phong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][apartmentUu][name]    #tên căn hộ
    ${api_address_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][apartmentUu][address]        #địa chỉ căn
    ${api_adRentPrice_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[adRentPrice]    #giá thuê

    Log To Console    ${api_code_hop_dong}
    Log To Console    ${api_from_hop_dong}
    Log To Console    ${api_to_hop_dong}
    Log To Console    ${api_apartmentUu_name_phong}
    Log To Console    ${api_address_hop_dong}
    Log To Console    ${api_adRentPrice_hop_dong}

#    Bước 2: Chuẩn hóa dữ liệu API
#    Format ngày tháng
    ${api_from_clean}=    Common - Chuan Hoa Ngay Thang Tu API    ${api_from_hop_dong}
    ${api_to_clean}=    Common - Chuan Hoa Ngay Thang Tu API    ${api_to_hop_dong}

#    Format tiền tệ
    ${api_adRentPrice_clean}=   Common - Chuan Hoa Tien Te Tu API       ${api_adRentPrice_hop_dong}

    Log To Console    \n--- DỮ LIỆU API ĐÃ CHUẨN HÓA ---
    Log To Console    ${api_from_clean}
    Log To Console    ${api_to_clean}
    Log To Console    ${api_adRentPrice_clean}

#    Buớc 3: Mở app và lấy dữ liệu từ giao diện để so sánh với API
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Danh Sach Hop Dong
    ...    ${api_code_hop_dong}
    ...    ${api_from_clean}
    ...    ${api_to_clean}
    ...    ${api_apartmentUu_name_phong}
    ...    ${api_address_hop_dong}
    ...    ${api_adRentPrice_clean}



TC_02_So_Sanh_Du_Lieu_API_Va_UI_Phan_Tu_Dau_Tien_Trong_Chi_Tiet_Hop-Dong
#    Bước 1: Lấy dữ liệu từ API
    ${first_hop_dong_dau_tien}=    Lay Phan Tu API Dau Tien Trong Danh Dach Hop Dong
    ${api_code_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][code]    #mã hợp đồng
    ${api_from_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][from]    #ngày bắt đầu thuê
#    ${api_to_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][to]    #ngày gia hạn tiếp theo
#    api trường chu kỳ thanh toán
    ${api_adRentPrice_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[adRentPrice]    #giá thuê
    ${api_deposit_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[deposit]    #tiền cọc
    ${api_apartmentUu_name_phong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][apartmentUu][name]    #tên căn hộ
    ${api_address_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[contractUu][apartmentUu][address]        #địa chỉ căn
    ${api_apartmentSize_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[apartmentUu][apartmentSize]    #diện tích căn
#    api trường số phòng
    ${api_renterUu_name_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[renterUu][name]    #tên khách thuê
    ${api_renterUu_phoneNumber_hop_dong}=    Set Variable    ${first_hop_dong_dau_tien}[renterUu][phoneNumber]    #số điện thoại

    Log To Console    ${api_code_hop_dong}
    Log To Console    ${api_from_hop_dong}
    Log To Console    ${api_adRentPrice_hop_dong}
    Log To Console    ${api_deposit_hop_dong}
    Log To Console    ${api_apartmentUu_name_phong}
    Log To Console    ${api_address_hop_dong}
    Log To Console    ${api_apartmentSize_hop_dong}
    Log To Console    ${api_renterUu_name_hop_dong}
    Log To Console    ${api_renterUu_phoneNumber_hop_dong}

#    Bước 2: Chuẩn hóa dữ liệu API
#    Format ngày tháng
    ${api_from_clean}=    Common - Chuan Hoa Ngay Thang Tu API    ${api_from_hop_dong}

#    Format tiền tệ
    ${api_adRentPrice_clean}=   Common - Chuan Hoa Tien Te Tu API       ${api_adRentPrice_hop_dong}
    ${api_preDeposit_clean}=    Common - Chuan Hoa Tien Te Tu API    ${api_deposit_hop_dong}

    Log To Console    \n--- DỮ LIỆU API ĐÃ CHUẨN HÓA ---
    Log To Console    ${api_from_clean}
    Log To Console    ${api_adRentPrice_clean}
    Log To Console    ${api_preDeposit_clean}

#    Buớc 3: Mở app và lấy dữ liệu từ giao diện để so sánh với API
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Chi Tiet Hop Dong    
    ...    ${api_code_hop_dong}    
    ...    ${api_from_clean}    
    ...    ${api_adRentPrice_clean}
    ...    ${api_preDeposit_clean}    
    ...    ${api_apartmentUu_name_phong}    
    ...    ${api_address_hop_dong}    
    ...    ${api_apartmentSize_hop_dong}
    ...    ${api_renterUu_name_hop_dong}    
    ...    ${api_renterUu_phoneNumber_hop_dong}

    Sleep    7s




#TC_01_So_Sanh_Du_Lieu_API_Va_UI_Phan_Tu_Dau_Tien_Trong_Danh_Sach_Hop-Dong
##    Bước 1: Lấy dữ liệu từ API
#    &{dic_api_hop_dong}    Lay Thong Tin Hop Dong Dau Tien Da Chuan Hoa Vao Dictionary
#
##    Lưu biến dic ở cấp độ toàn cục để gọi được trong file
#    Set Suite Variable    &{SUITE_DIC_HOP_DONG}    &{dic_api_hop_dong}
#
##    Thực hiện luồng UI màn danh sách
#    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
#    Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Danh Sach Hop Dong    ${SUITE_DIC_HOP_DONG}
#
#
#TC_02_So_Sanh_Du_Lieu_API_Va_UI_Phan_Tu_Dau_Tien_Trong_Chi_Tiet_Hop-Dong
#    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
#    Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Chi Tiet Hop Dong    ${SUITE_DIC_HOP_DONG}
#


    
