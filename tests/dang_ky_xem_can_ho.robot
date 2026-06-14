*** Settings ***
Resource            ../config/import.resource

Suite Setup         Mo Ung Dung Va Dang Nhap He Thong    ${dt_phone_number}    ${dt_password}
Suite Teardown      Teardown - Close Application
Test Teardown       Run Keyword If Test Failed    Capture Page Screenshot    ${TEST_NAME}.png


*** Test Cases ***
 TC_01_Mo_danh_sach_can_ho_quang_cao
    [Documentation]    Mở danh sách căn hộ quảng cáo
    Thuc Hien Mo Danh Sach Can Ho Quang Cao

TC_02_Click_can_ho_dau_tien_de_xem_cho_tiet
    [Documentation]    Mở chi tiết màn căn hộ quảng cáo
    Thuc Hien Click Can Ho Dau Tien De Xem Chi Tiet

TC_03_Dang_ky_xem_can_ho_thanh_cong
    [Documentation]    Đăng ký xem căn hộ
    [Tags]    smoke    flow
    Thuc Hien Dang ky Xem Can Ho    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}

TC_04_Dang_ky_va_kiem_tra_thong_tin_yeu_cau_xem_phong
    [Documentation]    Đăng ký và kiềm tra thông tin yêu cầu xem phòng
    [Tags]    flow
    Kiem Tra Thong Tin Yeu Cau Xem Phong
