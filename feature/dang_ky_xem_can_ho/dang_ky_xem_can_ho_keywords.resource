*** Settings ***
Resource    ../../config/import.resource
Resource    dang_ky_xem_can_ho_variables.resource


*** Keywords ***
Thuc Hien Mo Danh Sach Can Ho Quang Cao
    Common - Click Element    ${menu_tim_nha}
    Wait Until Page Contains Element    ${btn_xem_chi_tiet_can_ho}

Thuc Hien Click Can Ho Dau Tien De Xem Chi Tiet
    Common - Click Element    ${menu_tim_nha}
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Sleep    3s
    Wait Until Page Contains Element    ${label_thong_tin_can_ho}

Thuc Hien Dang ky Xem Can Ho
    [Arguments]    ${ho_ten}    ${email}    ${so_dien_thoai}
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Lay Thong Tin Can Ho Luu Vao Dictionary
    Common - Click Element    ${btn_dang_ky_xem_can_ho}

#    Thực hiện điền form
    Common - Click Element    ${viewing_date_xem_can_ho}
    Common - Chon Ngay Tuong Lai    1
    Common - Click Element    ${btn_chon}
    Common - Click Element    ${btn_chon_gio_xem}

    ${value_ngay_xem_phong}    Common - Get Text Element    ${ngay_xem_phong_man_dang_ky_can_ho}
    Set To Dictionary    ${dic_thong_tin_yeu_cau_xem_can_ho}    ngay_xem_can_ho=${value_ngay_xem_phong}

#    Verify thông tin auto-fill trước khi submit (lấy giá trị element thực tế & so sánh kq mong muốn với kq thực tế)
    ${actual_ho_ten}    Common - Get Text Element    ${input_ho_ten}
    Should Be Equal As Strings    ${dt_ho_ten}    ${actual_ho_ten}

    ${actual_email}    Common - Get Text Element    ${input_email}
    Should Be Equal As Strings    ${dt_email}    ${actual_email}

    ${actual_so_dien_thoai}    Common - Get Text Element    ${input_so_dien_thoai}
    Should Be Equal As Strings    ${dt_phone_number}    ${actual_so_dien_thoai}
    Common - Click Element    ${btn_xac_nhan}
    Wait Until Page Contains    ${msg_thanh_cong}

Lay Thong Tin Can Ho Luu Vao Dictionary
    [Documentation]    Vừa vuốt màn hình vừa tìm data cất vào Dictionary
    ${value_dia_chi_can_ho}    Common - Get Attribute    ${dia_chi_can_ho_man_chi_tiet_can_ho}
    ${value_ten_can_ho}    Common - Get Attribute    ${ten_can_ho_man_chi_tiet_can_ho}
    ${value_ho_ten_chu_can_ho}    Common - Get Attribute    ${ho_ten_chu_can_ho_man_chi_tiet_can_ho}
    Common - Vuot Man Hinh Tim Element    ${sdt_chu_can_ho_man_chi_tiet_can_ho}
    ${value_sdt_chu_can_ho}    Common - Get Attribute    ${sdt_chu_can_ho_man_chi_tiet_can_ho}

    Set To Dictionary
    ...    ${dic_thong_tin_yeu_cau_xem_can_ho}
    ...    dia_chi_can_ho=${value_dia_chi_can_ho}
    ...    ten_can_ho=${value_ten_can_ho}
    ...    ho_ten_chu_can_ho=${value_ho_ten_chu_can_ho}
    ...    sdt_chu_can_ho=${value_sdt_chu_can_ho}

Xu Ly Dia Chi
    [Arguments]    ${dia_chi_day_du}
    ${dia_chi_rut_gon}    Replace String Using Regexp    ${dia_chi_day_du}    ,\\s*[^,]+$    ${EMPTY}

    # Khử khoảng trắng thừa an toàn ở hai đầu
    ${dia_chi_rut_gon}    Strip String    ${dia_chi_rut_gon}

    RETURN    ${dia_chi_rut_gon}

Xu Ly Ngay Thang
    [Arguments]    ${thoi_gian_day_du}
    ${thoi_gian_rut_gon}    Replace String Using Regexp    ${thoi_gian_day_du}    ^.*\\s(?=[0-9]{2}/)    ${EMPTY}
    ${thoi_gian_rut_gon}    Strip String    ${thoi_gian_rut_gon}
    RETURN    ${thoi_gian_rut_gon}

Kiem Tra Thong Tin Yeu Cau Xem Phong
    Common - Click Element    ${menu_yeu_cau_xem_phong}

    # Bóc tách thời gian
    ${short_date}    Xu Ly Ngay Thang    ${dic_thong_tin_yeu_cau_xem_can_ho}[ngay_xem_can_ho]
    Log To Console    Thời gian sau khi xử lý: ${short_date}

    # Lấy địa chỉ từ Dictionary và cắt bỏ cấp Tỉnh/Thành phố
    ${short_addres}    Xu Ly Dia Chi    ${dic_thong_tin_yeu_cau_xem_can_ho}[dia_chi_can_ho]
    Log To Console    Địa chỉ sau khi xử lý: ${short_addres}

    # Khởi tạo danh sách chứa các trường dữ liệu cần xác thực
    ${thong_tin_can_ho}    Create List
    ...    Đã xác nhận
    ...    ${short_date}
    ...    ${dic_thong_tin_yeu_cau_xem_can_ho}[ten_can_ho]
    ...    ${short_addres}
    ...    ${dic_thong_tin_yeu_cau_xem_can_ho}[sdt_chu_can_ho]
    ...    ${dic_thong_tin_yeu_cau_xem_can_ho}[ho_ten_chu_can_ho]

    FOR    ${item}    IN    @{thong_tin_can_ho}
        Wait Until Page Contains Element
        ...    xpath=//android.view.View[contains(@content-desc, '${item}')]
        ...    5s
        ...    error=Không hiển thị thông tin [${item}] trên thông tin yêu cầu xem phòng.
    END
