*** Settings ***
Resource    ../config/import.resource
Suite Setup   Mo Ung Dung Va Dang Nhap He Thong    ${dt_phone_number}    ${dt_password}
Suite Teardown   Teardown - Close Application

*** Test Cases ***
TC_01_Dang_ky_xem_can_ho_thanh_cong
    [Documentation]    Đăng ký xem căn hộ thành công
    [Tags]    smoke    flow
    Thuc Hien Dang ky Xem Can Ho    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}
    Go Back

TC_02_Dang_ky_xem_can_ho_da_bi_thue
    [Documentation]    Đăng ký xem căn hộ đã bị thuê
    [Tags]    flow
    IF    ${can_ho_da_thue_status}
        Skip    Skip chức năng Đăng ký căn hộ bị thuê
    ELSE
        Thuc Hien Dang Ky Can Ho Da Thue
    END

TC_03_Dang_Ky_Va_Kiem_Tra_Thong_Tin_Yeu_Cau_Xem_Phong
    [Documentation]    Đăng ký và kiềm tra thông tin yêu cầu xem phòng
    [Tags]    flow
    Thuc Hien Dang ky Xem Can Ho    ${dt_ho_ten}    ${dt_email}    ${dt_phone_number}
    Lay Thong Tin Can Ho Luu Vao Dictionary
    Go Back
    Kiem Tra Thong Tin Yeu Cau Xem Phong



#TC_04_Danh_Sach_Can_Ho_Quang_Cao

#TC_05_Chi_Tiet_Can_Ho_Quang_Cao

#TC06_Kiem_tra_he_thong_tu_dong_an_bai_quang_cao_can_ho_da_duoc_thue
#    [Documentation]    Hệ thống tự động ẩn bài quảng cáo căn hộ đã được thuê

#TC_07_Doi_lich_xem_can_ho_thanh_cong
#    [Documentation]    Đổi lịch xem căn hộ thành công
#    [Tags]    flow
#    Thuc Hien Doi Lich Can Ho
#    Go Back
