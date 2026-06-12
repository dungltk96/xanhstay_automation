*** Settings ***
Resource            ../config/import.resource

Test Setup         Mo Ung Dung Va Dang Nhap He Thong    ${dt_phone_number}    ${dt_password}
Test Teardown      Teardown - Chup Anh Va Dong App


*** Test Cases ***
TC01_Xac_nhan_hop_dong_that_bai_do_chua_tick_dieu_khoan
    [Documentation]    Không tích điều khoản -> Báo lỗi UI
    [Tags]    flow
    Di Vao Man Hinh Chi Tiet Hop Dong
    Kiem Tra Loi Khong Tich Dieu Khoan

TC02_Xac_nhan_hop_dong_that_bai_do_chua_xac_thuc_KYC
    [Documentation]    Có tích điều khoản -> Báo lỗi chưa KYC
    [Tags]    flow
    IF    ${kyc_status}
        Skip    Bỏ qua kịch bản kiểm thử này do tài khoản hiện tại đã hoàn tất KYC.
    ELSE
        Di Vao Man Hinh Chi Tiet Hop Dong
        Kiem Tra Loi Nghiep Vu Chua Xac Thuc KYC    ${msg_KYC_err}
    END

TC03_Xac_nhan_hop_dong_that_bai_do_chua_thanh_toan_bill
    [Documentation]    Có tích điều khoản -> Báo lỗi chưa thanh toán hóa đơn
    [Tags]    flow
    Di Vao Man Hinh Chi Tiet Hop Dong
    Kiem Tra Loi Nghiep Vu Chua Xac Thanh Toán Bill    ${msg_payment_err}

TC_04_Xac_nhan_hop_dong_thanh_cong
    [Documentation]    Xác nhận hợp đồng thành công
    [Tags]    smoke    flow
    Di Vao Man Hinh Chi Tiet Hop Dong Hop Le
    Kiem Tra Xac Nhan Hop Dong Thanh Cong    ${title_thong_bao_xac_nhan_hop_dong_success}
