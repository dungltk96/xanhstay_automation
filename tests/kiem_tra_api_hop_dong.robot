*** Settings ***
Resource            ../config/import.resource

Suite Setup         Run Keywords    Setup - Open Application
...                     AND    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
...                     AND    Lay Du Lieu Tu API Hop Dong Va Chuan Hoa Du Lieu API
Test Setup          Common - Test Setup
Test Teardown       Common - Test Teardown


*** Test Cases ***
TC_01_So_Sanh_Du_Lieu_API_Va_UI_Phan_Tu_Dau_Tien_Trong_Danh_Sach_Hop-Dong
    Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Danh Sach Hop Dong
    ...    ${api_code_hop_dong}
    ...    ${api_from_hop_dong}
    ...    ${api_to_hop_dong}
    ...    ${api_ten_can_ho}
    ...    ${api_dia_chi_can_ho}
    ...    ${api_gia_thue_can_ho}

TC_02_So_Sanh_Du_Lieu_API_Va_UI_Phan_Tu_Dau_Tien_Trong_Chi_Tiet_Hop-Dong
    Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Chi Tiet Hop Dong
    ...    ${api_code_hop_dong}
    ...    ${api_from_hop_dong}
    ...    ${api_gia_thue_can_ho}
    ...    ${api_tien_coc_can_ho}
    ...    ${api_ten_can_ho}
    ...    ${api_dia_chi_can_ho}
    ...    ${api_dien_tich_can_ho}
    ...    ${api_ten_khach_thue_can_ho}
    ...    ${api_sdt_khach_thue_can_ho}
    Sleep    7s
