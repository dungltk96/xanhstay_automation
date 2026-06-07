*** Settings ***
Resource    ../../config/import.resource
Resource    xac_nhan_hop_dong.variables.resource

*** Keywords ***
# --- THẺ 1: ĐIỀU HƯỚNG ---
Di Vao Man Hinh Chi Tiet Hop Dong
    [Documentation]    Tìm data trạng thái [Chờ lập hợp đồng] và click vào chi tiết
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_tim_nha}
    Common - Click Element    ${menu_yeu_cau_ky}

    Common - Vuot Man Hinh Tim Element    ${danh_sach_hop_dong_co_trang_cho_lap_hd}
    Wait Until Page Contains Element    ${danh_sach_hop_dong_co_trang_cho_lap_hd}    #error:Không tìm thấy hợp đồng có trạng thái [Chờ lập hợp đồng]
    Common - Click Element    ${danh_sach_hop_dong_co_trang_cho_lap_hd}
    
    Wait Until Page Contains Element    ${btn_detail_yc_hop_dong}    #error:Không kích được vào chi tiết hợp đồng
    Common - Click Element    ${btn_detail_yc_hop_dong}
    Log To Console    \n[Info] Đã truy cập màn hình Chi tiết hợp đồng thành công!

Di Vao Man Hinh Chi Tiet Hop Dong Hop Le
    [Documentation]    Tìm data trạng thái [Chờ lập hợp đồng] và click vào chi tiết hợp đồng đầu tiên
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_tim_nha}
    Common - Click Element    ${menu_yeu_cau_ky}
    Common - Vuot Man Hinh Tim Element    ${ds_hop_dong_co_trang_cho_lap_hd_chon_pt01}    3
    Common - Click Element    ${ds_hop_dong_co_trang_cho_lap_hd_chon_pt01}    #Không kích được vào chi tiết hợp đồng
    Log To Console    \n[Info] Đã truy cập màn hình Chi tiết hợp đồng thành công!

# --- THẺ 2: KIỂM CHỨNG GIAO DIỆN (UNTICK) ---
Kiem Tra Loi Khong Tich Dieu Khoan
    [Documentation]    Nhấn Xác nhận khi chưa tích chọn để bắt lỗi mặc định
    Common - Click Element    ${btn_xac_nhan_hop_dong}
    Wait Until Page Contains    ${msg_untick_err}
    Log To Console    \n[Pass] TC01: Báo lỗi chưa đồng ý điều khoản chuẩn xác!
    Wait Until Page Does Not Contain    ${msg_untick_err}

# --- THẺ 3: KIỂM CHỨNG NGHIỆP VỤ (TICK - DYNAMIC) ---
Kiem Tra Loi Nghiep Vu Chua Xac Thuc KYC
    [Arguments]    ${cau_thong_bao_mong_doi}
    [Documentation]    Tích checkbox và verify lỗi linh hoạt dựa theo trạng thái Account
    Common - Click Element    ${tick_checkbox}
    Common - Click Element    ${btn_xac_nhan_hop_dong}
    Wait Until Page Contains Element    ${cau_thong_bao_mong_doi}
    Log To Console    \n[Pass] TC02: Báo lỗi nghiệp vụ -> ${cau_thong_bao_mong_doi}
    Wait Until Page Does Not Contain Element    ${cau_thong_bao_mong_doi}

Kiem Tra Loi Nghiep Vu Chua Xac Thanh Toán Bill
    [Arguments]    ${cau_thong_bao_mong_doi}
    [Documentation]    Tích checkbox và verify lỗi linh hoạt dựa theo trạng thái Account
    Common - Click Element    ${tick_checkbox}
    Common - Click Element    ${btn_xac_nhan_hop_dong}
    Wait Until Page Contains Element    ${cau_thong_bao_mong_doi}
    Log To Console    \n[Pass] TC03: Báo lỗi nghiệp vụ -> ${cau_thong_bao_mong_doi}
    Wait Until Page Does Not Contain Element    ${cau_thong_bao_mong_doi}

Kiem Tra Xac Nhan Hop Dong Thanh Cong
    [Arguments]    ${cau_thong_bao_mong_doi}
    [Documentation]    Tích checkbox và verify lỗi linh hoạt dựa theo trạng thái Account
    Common - Click Element    ${tick_checkbox}
    Common - Click Element    ${btn_xac_nhan_hop_dong}
    Wait Until Element Is Visible    ${cau_thong_bao_mong_doi}    15s

#    ${status_cau_thong_bao_mong_doi}    Run Keyword And Return Status    Wait Until Element Is Visible    ${cau_thong_bao_mong_doi}    15s
#    Should Be True    ${status_cau_thong_bao_mong_doi}
#    ...    msg=\n[LỖI CHỨC NĂNG]: Giao diện hiển thị thông báo lỗi không mong muốn!. Không tìm thấy thông báo mong đợi: [${cau_thong_bao_mong_doi}]
    Common - Click Element    ${btn_dong}