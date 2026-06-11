*** Settings ***
Resource    ../../config/import.resource
Resource    dang_ky_xem_can_ho_variables.resource

*** Keywords ***
Thuc Hien Dang ky Xem Can Ho
    [Arguments]    ${ho_ten}    ${email}    ${so_dien_thoai}
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_tim_nha}
    Common - Click Element    ${menu_tim_nha}
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Sleep    5s
    Lay Thong Tin Can Ho Luu Vao Dictionary
    Common - Click Element    ${btn_dang_ky_xem_can_ho}

#   Thực hiện điền form
    Common - Click Element    ${viewing_date_xem_can_ho}
    Common - Chon Ngay Tuong Lai    1
    Common - Click Element    ${btn_chon}
    Common - Click Element     ${btn_chon_gio_xem}

    Wait Until Page Contains Element   ${ngay_xem_phong_man_dang_ky_can_ho}
    ${value_ngay_xem_phong}    Get Text    ${ngay_xem_phong_man_dang_ky_can_ho}
    Set To Dictionary    ${dic_thong_tin_yeu_cau_xem_can_ho}    ngay_xem_can_ho=${value_ngay_xem_phong}

#   Verify thông tin auto-fill trước khi submit (lấy giá trị element thực tế & so sánh kq mong muốn với kq thực tế)
    Common - Get Text Element    ${dt_ho_ten}    ${actual_ho_ten}
    Common - Get Text Element    ${dt_email}    ${actual_ho_ten}
    Common - Get Text Element    ${dt_phone_number}    ${actual_ho_ten}

#    Wait Until Page Contains Element    ${input_ho_ten}    30s
#    ${actual_ho_ten}    Get Text    ${input_ho_ten}
#    Should Be Equal As Strings    ${dt_ho_ten}    ${actual_ho_ten}
#
#    ${actual_email}    Get Text    ${input_email}
#    Should Be Equal As Strings    ${dt_email}    ${actual_email}
#
#    ${actual_so_dien_thoai}    Get Text    ${input_so_dien_thoai}
#    Should Be Equal As Strings    ${dt_phone_number}    ${actual_so_dien_thoai}
#
#    Common - Click Element    ${btn_xac_nhan}
#    Wait Until Page Contains    ${msg_thanh_cong}


Thuc Hien Dang Ky Can Ho Da Thue
    Common - Click Element    ${menu_tim_nha}
    Common - Vuot Man Hinh Tim Element    ${btn_xem_chi_tiet_can_ho_da_thue}
    Common - Click Element    ${btn_xem_chi_tiet_can_ho_da_thue}
    Lay Thong Tin Can Ho Luu Vao Dictionary
    Common - Click Element    ${btn_dang_ky_xem_can_ho}
    Common - Click Element    ${btn_dang_ky_xem_can_ho}
    Sleep    5s

#   Thực hiện điền form
    Common - Click Element    ${viewing_date_xem_can_ho}
    Common - Click Element    ${date_picker_today}
    Common - Click Element    ${btn_chon}

#    Lấy giá trị element thực tế & so sánh kq mong muốn với kq thực tế
    Wait Until Page Contains Element    ${input_ho_ten}    30s
    ${actual_ho_ten}    Get Text    ${input_ho_ten}
    Should Be Equal As Strings    ${dt_ho_ten}    ${actual_ho_ten}

    ${actual_email}    Get Text    ${input_email}
    Should Be Equal As Strings    ${dt_email}    ${actual_email}

    ${actual_so_dien_thoai}    Get Text    ${input_so_dien_thoai}
    Should Be Equal As Strings    ${dt_phone_number}    ${actual_so_dien_thoai}

    Common - Click Element    ${btn_xac_nhan}

    Wait Until Page Contains    ${msg_loi_can_ho_da_cho_thue}    error=LỖI NGHIỆP VỤ: Đăng ký căn hộ đã thuê không thấy báo lỗi như kịch bản!
    
    
Lay Thong Tin Can Ho Luu Vao Dictionary
    [Documentation]    Vừa vuốt màn hình vừa tìm data cất vào Dictionary

    Wait Until Page Contains Element    ${dia_chi_can_ho_man_chi_tiet_can_ho}
    ${value_dia_chi_can_ho}    Get Element Attribute        ${dia_chi_can_ho_man_chi_tiet_can_ho}    content-desc

    Wait Until Page Contains Element    ${ten_can_ho_man_chi_tiet_can_ho}
    ${value_ten_can_ho}    Get Element Attribute    ${ten_can_ho_man_chi_tiet_can_ho}    content-desc

    Common - Vuot Man Hinh Tim Element    ${sdt_chu_tro_man_chi_tiet_can_ho}    ${2}
    Wait Until Page Contains Element    ${sdt_chu_tro_man_chi_tiet_can_ho}
    ${value_sdt_chu_tro}    Get Element Attribute    ${sdt_chu_tro_man_chi_tiet_can_ho}    content-desc

    Set To Dictionary    ${dic_thong_tin_yeu_cau_xem_can_ho}    sdt_can_ho=${value_sdt_chu_tro}    dia_chi_can_ho=${value_dia_chi_can_ho}    ten_can_ho=${value_ten_can_ho}


Xu Ly Dia Chi
    [Arguments]    ${dia_chi_day_du}
    ${dia_chi_rut_gon}=    Replace String Using Regexp    ${dia_chi_day_du}    ,\\s*[^,]+$    ${EMPTY}

    # Khử khoảng trắng thừa an toàn ở hai đầu
    ${dia_chi_rut_gon}=    Strip String    ${dia_chi_rut_gon}

    RETURN    ${dia_chi_rut_gon}


Xu Ly Ngay Thang
    [Arguments]    ${thoi_gian_day_du}
    ${thoi_gian_rut_gon}=    Replace String Using Regexp    ${thoi_gian_day_du}    ^.*\\s(?=[0-9]{2}/)    ${EMPTY}
    ${thoi_gian_rut_gon}=    Strip String    ${thoi_gian_rut_gon}
    RETURN    ${thoi_gian_rut_gon}


Kiem Tra Thong Tin Yeu Cau Xem Phong
    # Click mở màn hình danh sách Yêu cầu xem phòng
    Common - Click Element    ${menu_yeu_cau_xem_phong}

    #Bóc tách thời gian
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
    ...    ${dic_thong_tin_yeu_cau_xem_can_ho}[sdt_can_ho]

    # Vòng lặp FOR quét qua từng từ khóa con trong danh sách
    FOR    ${item}    IN    @{thong_tin_can_ho}
        Wait Until Page Contains Element    xpath=//android.view.View[contains(@content-desc, '${item}')]    5s
        ...    error=LỖI CHỨC NĂNG: Giao diện yêu cầu xem phòng hiển thị sai lệch thông tin, không tìm thấy cụm từ: [${item}]
    END


Thuc Hien Doi Lich Can Ho
    Common - Click Element    ${btn_xem_chi_tiet_can_ho}
    Common - Click Element    ${btn_dang_ky_xem_can_ho}

#    Check xem nội dung có hiển thị đúng như luồng yêu cầu không
    Wait Until Page Contains Element   ${lbl_da_dang_ky_lich}    30s

#    Tiến hành đổi lịch xem sang ngày mai
    Common - Click Element    ${viewing_date_xem_can_ho}
    Common - Chon Ngay Tuong Lai    1
    Common - Click Element    ${btn_chon}

#   Verify thông tin auto-fill trước khi submit (lấy giá trị element thực tế & so sánh kq mong muốn với kq thực tế)
    Wait Until Page Contains Element    ${input_ho_ten}    30s
    ${actual_ho_ten}    Get Text    ${input_ho_ten}
    Should Be Equal As Strings    ${dt_ho_ten}    ${actual_ho_ten}    #msg=LỖI DATA: Họ tên tự động điền không đúng!

    ${actual_email}    Get Text    ${input_email}
    Should Be Equal As Strings    ${dt_email}    ${actual_email}    #msg=LỖI DATA: Email tự động điền không đúng!

    ${actual_so_dien_thoai}    Get Text    ${input_so_dien_thoai}
    Should Be Equal As Strings    ${dt_phone_number}    ${actual_so_dien_thoai}    #msg=LỖI DATA: SĐT tự động điền không đúng!

    Common - Click Element    ${btn_xac_nhan}

#    Check thông báo đổi lịch thành công
    Wait Until Page Contains    ${msg_doi_lich_thanh_cong}    #error=LỖI NGHIỆP VỤ: Đã ấn xác nhận nhưng không thấy thông báo Đổi lịch thành công!