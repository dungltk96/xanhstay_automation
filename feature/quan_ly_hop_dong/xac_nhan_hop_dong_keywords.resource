*** Settings ***
Resource    ../../config/import.resource
Resource    xac_nhan_hop_dong_variables.resource


*** Keywords ***
Di Vao Man Hinh Chi Tiet Hop Dong
    [Documentation]    Tìm data trạng thái [Chờ lập hợp đồng] và click vào chi tiết
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_tim_nha}
    Common - Click Element    ${menu_yeu_cau_ky}

    Common - Vuot Man Hinh Tim Element    ${ds_hop_dong_co_trang_cho_lap_hop_dong}
    Wait Until Page Contains Element
    ...    ${ds_hop_dong_co_trang_cho_lap_hop_dong}
    Common - Click Element    ${ds_hop_dong_co_trang_cho_lap_hop_dong}

    Wait Until Page Contains Element    ${btn_detail_yc_hop_dong}
    Common - Click Element    ${btn_detail_yc_hop_dong}
    Log To Console    \n[Info] Đã truy cập màn hình Chi tiết hợp đồng thành công!

# Di Vao Man Hinh Chi Tiet Hop Dong Hop Le
#    [Documentation]    Tìm data trạng thái [Chờ lập hợp đồng] và click vào chi tiết hợp đồng đầu tiên
#    Common - Click Element    ${btn_menu}
#    Common - Click Element    ${btn_option_tim_nha}
#    Common - Click Element    ${menu_yeu_cau_ky}
#    Common - Vuot Man Hinh Tim Element    ${ds_hop_dong_co_trang_cho_lap_hop_dong}    3
#    Common - Click Element    ${ds_hop_dong_co_trang_cho_lap_hop_dong}
#    Log To Console    \n[Info] Đã truy cập màn hình Chi tiết hợp đồng thành công!

Kiem Tra Loi Khong Tich Dieu Khoan
    [Documentation]    Nhấn Xác nhận khi chưa tích chọn để bắt lỗi mặc định
    Common - Click Element    ${btn_xac_nhan_hop_dong}
    Wait Until Page Contains    ${msg_untick_err}
    Log To Console    \n[Pass] TC01: Báo lỗi chưa đồng ý điều khoản chuẩn xác!
    Wait Until Page Does Not Contain    ${msg_untick_err}

Kiem Tra Loi Nghiep Vu Chua Xac Thuc KYC
    [Documentation]    Tích checkbox và verify lỗi dựa theo trạng thái Account
    [Arguments]    ${cau_thong_bao_mong_doi}
    Common - Click Element    ${tick_checkbox}
    Common - Click Element    ${btn_xac_nhan_hop_dong}
    Wait Until Page Contains    ${cau_thong_bao_mong_doi}
    Log To Console    \n[Pass] TC02: Báo lỗi nghiệp vụ -> ${cau_thong_bao_mong_doi}
    Wait Until Page Does Not Contain    ${cau_thong_bao_mong_doi}

Kiem Tra Loi Nghiep Vu Chua Thanh Toán Bill
    [Documentation]    Tích checkbox và verify lỗi theo trạng thái Account
    [Arguments]    ${cau_thong_bao_mong_doi}
    Common - Click Element    ${tick_checkbox}
    Common - Click Element    ${btn_xac_nhan_hop_dong}
    Wait Until Page Contains    ${cau_thong_bao_mong_doi}
    Log To Console    \n[Pass] TC03: Báo lỗi nghiệp vụ -> ${cau_thong_bao_mong_doi}
    Wait Until Page Does Not Contain    ${cau_thong_bao_mong_doi}

Kiem Tra Xac Nhan Hop Dong Thanh Cong
    [Documentation]    Tích checkbox và verify lỗi theo trạng thái Account
    [Arguments]    ${cau_thong_bao_mong_doi}
    Common - Click Element    ${tick_checkbox}
    Common - Click Element    ${btn_xac_nhan_hop_dong}
    Wait Until Page Contains    ${cau_thong_bao_mong_doi}
    Wait Until Page Does Not Contain    ${cau_thong_bao_mong_doi}
    Common - Click Element    ${btn_dong}
