*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Close Application
Test Teardown    Teardown - Chup Anh Va Dong App
Library    DataDriver    file=../data/Danh_Sach_Test_Cases_Dang_Ky_Day_Du.csv    encoding=UTF-8    delimiter=;
Test Template     Dang Ky Tai Khoan

*** Test Cases ***
Kiem Tra Dang Ky Tai Khoan Bang CSV Voi Account: ${fullname}

*** Keywords ***
Dang Ky Tai Khoan
    [Documentation]    Kiểm tra chức năng đăng ký tài khoản
    [Tags]    smoke    verify
    [Arguments]    ${fullname}    ${phone}    ${email}    ${password}    ${confirm_password}    ${expected_message}

    Log To Console    \n-----------------------------------------------------------
    Log To Console    Đang test data: ${fullname} | Mong muốn: ${expected_message}

    # =========================================================================
    # BƯỚC 1: ĐIỀU HƯỚNG VÀ ĐIỀN FORM
    # =========================================================================
    Common - Click Element    ${btn_menu}
    Common - Click Element    ${btn_option_ca_nhan}
    Common - Click Element    ${btn_nav_dang_nhap}
    Common - Click Element    ${btn_nav_dang_ky}

    Common - Click Element    ${input_ho_ten_dk}
    Common - Input Element    ${input_ho_ten_dk}    ${fullname}

    Common - Click Element    ${input_sdt_dk}
    Common - Input Element    ${input_sdt_dk}    ${phone}

    Common - Click Element    ${input_email_dk}
    Common - Input Element    ${input_email_dk}    ${email}

    Common - Click Element    ${input_mat_khau_dk}
    Common - Input Element    ${input_mat_khau_dk}    ${password}

    Common - Click Element    ${input_nhap_lai_mat_khau_dk}
    Common - Input Element    ${input_nhap_lai_mat_khau_dk}    ${confirm_password}

    Hide Keyboard
    Common - Click Element    ${checkbox_dieu_khoan_dk}

    # THAO TÁC QUYẾT ĐỊNH: Bấm 2 nút này để App gửi request kiểm tra dữ liệu
    Common - Click Element    ${btn_nhan_ma_qua_email_dk}
    Common - Click Element    ${btn_lay_ma_OTP_dk}

    # =========================================================================
    # BƯỚC 2: TRẠM KIỂM SOÁT POPUP TỔNG HỢP (XỬ LÝ 3 QUY TẮC CỦA BẠN)
    # =========================================================================
    # Tìm xem có bất kỳ popup nào hiện lên không (Thông báo lỗi hoặc Trùng data)
    # Bổ sung thêm các từ khóa nhận diện lỗi phổ biến của app vào điều kiện 'or'
    ${locator_popup}    Set Variable    xpath=//android.view.View[contains(@content-desc, 'Thông báo') or contains(@content-desc, 'đã được kích hoạt rồi')]

    # Ép Bot thức canh chừng liên tục tối đa 5s. Popup vừa nhú lên là tóm gọn ngay lập tức!
    ${co_popup}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${locator_popup}    5s

    IF    ${co_popup}
        # CÓ POPUP XUẤT HIỆN -> Bốc nội dung thực tế ra
        ${actual_msg_raw}=    Get Element Attribute    ${locator_popup}    content-desc

        # CHUẨN HÓA CHUỖI: Ép dấu xuống dòng (\n) thành khoảng trắng để khớp với CSV
        ${actual_msg_full}=    Replace String    ${actual_msg_raw}    \n    ${SPACE}

        # [QUY TẮC 1]: Kiểm tra trùng data -> Đánh PASS (SKIP)
        ${is_duplicate}=    Run Keyword And Return Status    Should Contain    ${actual_msg_full}    đã được kích hoạt rồi
        IF    ${is_duplicate}
            Pass Execution    => [SKIP] Bỏ qua testcase do đội test lấy nhầm data đã kích hoạt.
        END

        # Xử lý tiếp nếu không phải trùng data
        IF    '${expected_message}' != 'Đăng ký thành công'

            # [QUY TẮC 3]: So sánh thông báo lỗi thực tế vs mong muốn
            ${is_match}=    Run Keyword And Return Status    Should Contain    ${actual_msg_full}    ${expected_message}
            IF    ${is_match}
                Log To Console    => [PASS] Bắt đúng thông báo lỗi: ${expected_message}
                Set Test Message    *HTML* <span style="color:green"><b>[PASS] NGHIỆP VỤ CHUẨN XÁC!</b><br>=> App đã chặn đúng lỗi: [${actual_msg_full}]</span>
                Return From Keyword    # Lệnh kết thúc thành công cho luồng lỗi
            ELSE
                # Đánh FAIL và văng ra chính xác câu báo lỗi bạn yêu cầu
                Fail    LỖI NGHIỆP VỤ: Thông báo lỗi không khớp! \n\n=> Mong muốn: [${expected_message}] \n=> App thực tế hiện: [${actual_msg_full}]
            END

        ELSE
            # Nếu expected là thành công nhưng lại văng lỗi (không phải trùng data)
            Fail    LỖI HỆ THỐNG: Kịch bản Happy Case bị chặn bởi popup báo lỗi: [${actual_msg_full}]
        END

    ELSE
        # KHÔNG CÓ POPUP NÀO HIỆN LÊN
        IF    '${expected_message}' != 'Đăng ký thành công'
            # [QUY TẮC 2]: Nhập data sai nhưng app im re không chặn
            Fail    Lỗi chức năng: Điền thông tin không hợp lệ vẫn cho phép đăng ký (App không chặn)!
        END

        # Nếu expected = 'Đăng ký thành công' và không có popup -> An toàn đi tiếp xuống Bước 3.
    END


    # =========================================================================
    # BƯỚC 3: NHẬP OTP (CHỈ CHẠY ĐẾN ĐÂY KHI LUỒNG HAPPY CASE THỰC SỰ PASS)
    # =========================================================================
    # LƯU Ý: Không gọi click nút "Lấy mã OTP" ở đây nữa vì đã click ở trên rồi!

    Common - Click Element    ${input_OPT_1}
    Common - Input Element    ${input_OPT_1}    1
    Common - Click Element    ${input_OPT_2}
    Common - Input Element    ${input_OPT_2}    2
    Common - Click Element    ${input_OPT_3}
    Common - Input Element    ${input_OPT_3}    3
    Common - Click Element    ${input_OPT_4}
    Common - Input Element    ${input_OPT_4}    4
    Common - Click Element    ${input_OPT_5}
    Common - Input Element    ${input_OPT_5}    5
    Common - Click Element    ${input_OPT_6}
    Common - Input Element    ${input_OPT_6}    6

    Common - Click Element    ${btn_tiep_tuc_dk}

    # Đánh giá kết quả cuối cùng qua màn hình KYC
    ${is_kyc_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${title_xac_thuc_KYC}    timeout=10s

    IF    ${is_kyc_visible}
        Log To Console    => [PASS] Đã điều hướng sang màn Xác thực KYC thành công!
        Common - Click Element    ${btn_bo_qua_xac_thuc_KYC}
    ELSE
        Fail    LỖI: Đăng ký thành công nhưng không chuyển sang màn Xác thực KYC!
    END

    Log To Console    => Kịch bản hoàn thành xuất sắc!
    Log To Console    ${fullname},${phone},${email},${password},${confirm_password},${expected_message}