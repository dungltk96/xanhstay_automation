*** Settings ***
Resource            ../config/import.resource

Suite Setup         Run Keywords    Setup - Open Application
...                     AND    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
...                     AND    Lay Du Lieu Tu API Hop Dong Va Chuan Hoa Du Lieu API
Test Setup          Common - Test Setup
Test Teardown       Common - Test Teardown


*** Test Cases ***
TC_01_Thue_can_ho_thanh_cong
    [Documentation]    Đăng ký thuê căn hộ thành công
    [Tags]    smoke    flow
#    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}

TC_02_Kiem_tra_he_thong_tu_dong_tao_hop_dong_va_doi_chieu_du_lieu_danh_sach_hop_dong_giua_API_va_UI
    [Documentation]    Kiểm tra hệ thống tự động tạo hợp đồng và đối chiếu dữ liệu giữa API và giao diện phần tử đầu tiên màn danh sách hợp đồng
    [Tags]    flow
    Kiem Tra Thong Tin Phan Tu Dau Tien Trong Man Danh Sach Hop Dong
    ...    ${api_code_hop_dong}
    ...    ${api_from_hop_dong}
    ...    ${api_to_hop_dong}
    ...    ${api_ten_can_ho}
    ...    ${api_dia_chi_can_ho}
    ...    ${api_gia_thue_can_ho}

TC_03_Kiem_tra_he_thong_tu_dong_tao_hop_dong_va_doi_chieu_du_lieu_chi_tiet_hop_dong_giua_API_va_UI
    [Documentation]    Kiểm tra hệ thống tự động tạo hợp đồng và đối chiếu dữ liệu giữa API và giao diện phần tử đầu tiên màn chi tiết hợp đồng
    [Tags]    flow
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
