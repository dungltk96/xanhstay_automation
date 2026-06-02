*** Settings ***
Resource    ../config/import.resource
Suite Setup   Mo Ung Dung Va Dang Nhap He Thong    ${dt_phone_number}    ${dt_password}
Suite Teardown   Close Application
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot    ${TEST_NAME}.png

*** Test Cases ***
TC_01_Dang_ky_xem_can_ho_thanh_cong
    [Documentation]    Đăng ký xem căn hộ thành công
    [Tags]    smoke    flow
    Thuc Hien Dang ky Xem Can Ho    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}
    Go Back

TC_02_Dang_Ky_Va_Kiem_Tra_Thong_Tin_Yeu_Cau_Xem_Phong
    [Documentation]    Đăng ký và kiềm tra thông tin yêu cầu xem phòng
    [Tags]    flow
    Thuc Hien Dang ky Xem Can Ho    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}
    Go Back
    Kiem Tra Thong Tin Yeu Cau Xem Phong

TC_03_Kiem_Tra_Thong_Tin_Thoi_Gian_Va_Dia_Chi_Xem_Phong
    [Documentation]    Đăng ký và kiềm tra thông tin ngày xem phòng
    [Tags]    flow
    Thuc Hien Dang ky Xem Can Ho    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}
    Go Back
    Kiem Tra Thong Tin Thoi Gian Va Dia Chi Xem Phong

#TC04_Kiem_tra_he_thong_tu_dong_an_bai_quang_cao_can_ho_da_duoc_thue
#    [Documentation]    Hệ thống tự động ẩn bài quảng cáo căn hộ đã được thuê

#TC_05_Doi_lich_xem_can_ho_thanh_cong
#    [Documentation]    Đổi lịch xem căn hộ thành công
#    [Tags]    flow
#    Thuc Hien Doi Lich Can Ho
#    Go Back

##Dia_Chi_Rut_Gon
##    ${short_addres}    Xu Ly Dia Chi    Số 10 Ngọc Hà, Phường Ngọc Hà, Thành phố Hà Nội
##    Log To Console    ${short_addres}
#
##Thoi_Gian_Rut_Gon
##    ${short_date}    Xu Ly Ngay Thang    00:00 - 00:00 25/05/2026
##    Log To Console    Ngày tháng sau khi tách: ${short_date}
