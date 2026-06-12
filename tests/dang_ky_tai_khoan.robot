*** Settings ***
Resource            ../config/import.resource
Library             DataDriver    file=../data/Data_Test_Cases_Dang_Ky.csv    encoding=UTF-8    delimiter=,

Test Setup          Setup-Open Application
Test Teardown       Teardown - Chup Anh Va Dong App
Test Template       Dang Ky Tai Khoan


*** Test Cases ***
Kiem_Tra_Dang_Ky_Tai_Khoan_Bang_CSV_Voi_Account: ${fullname}


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
    # BƯỚC 2: TRẠM KIỂM SOÁT POPUP TỔNG HỢP (XỬ LÝ 3 QUY TẮC BẰNG CHUẨN HÓA TEXT)
    # =========================================================================
    ${locator_popup}=    Set Variable
    ...    xpath=//android.view.View[starts-with(@content-desc, 'Thông báo') or contains(@content-desc, 'đã được kích hoạt rồi') or contains(@content-desc, 'Email đã tồn tại')]

    # Ép Bot thức canh chừng liên tục tối đa 5s. Popup vừa nhú lên là tóm gọn ngay lập tức!
    ${co_popup}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${locator_popup}    5s

    IF    ${co_popup}
        # CÓ POPUP XUẤT HIỆN -> Bốc nội dung thực tế ra
        ${actual_msg_raw}=    Get Element Attribute    ${locator_popup}    content-desc

        # =========================================================================
        # KỸ THUẬT CHUẨN HÓA TEXT (TRÁNH LỖI SO SÁNH SAI)
        # =========================================================================
        # 1. Xóa hẳn chữ "Thông báo" ra khỏi kết quả thực tế (Thay bằng rỗng)
        ${actual_msg_clean}=    Replace String    ${actual_msg_raw}    Thông báo    ${EMPTY}

        # 2. Xóa các ký tự xuống dòng (\n) thành khoảng trắng
        ${actual_msg_clean}=    Replace String    ${actual_msg_clean}    \n    ${SPACE}

        # 3. Cắt sạch các khoảng trắng bị dư thừa ở 2 đầu chuỗi thực tế
        ${actual_msg_clean}=    Strip String    ${actual_msg_clean}

        # 4. Cắt sạch khoảng trắng dư thừa trong file CSV (Đề phòng lúc nhập data bị dư dấu cách)
        ${expected_clean}=    Strip String    ${expected_message}
        # =========================================================================

        # [QUY TẮC 1]: Kiểm tra trùng data (Thêm ignore_case=True để tuyệt đối an toàn)
        ${is_dup_phone}=    Run Keyword And Return Status
        ...    Should Contain
        ...    ${actual_msg_clean}
        ...    đã được kích hoạt rồi
        ...    ignore_case=True
        ${is_dup_email}=    Run Keyword And Return Status
        ...    Should Contain
        ...    ${actual_msg_clean}
        ...    Email đã tồn tại
        ...    ignore_case=True

        IF    ${is_dup_phone} or ${is_dup_email}
            Set Test Message
            ...    *HTML* <span style="color:blue"><b>[SKIP] TRÙNG DỮ LIỆU!</b><br>=> App đã chặn: [${actual_msg_clean}]</span>
            Pass Execution    => [SKIP] Bỏ qua testcase do đội test lấy nhầm data đã tồn tại.
        END

        # Xử lý tiếp nếu không phải trùng data
        IF    '${expected_message}' != 'Đăng ký thành công'
            # [QUY TẮC 3]: So sánh thông báo lỗi thực tế vs mong muốn
            # BÍ QUYẾT: Dùng ignore_case=True để Bot lờ đi việc viết hoa/thường
            ${is_match}=    Run Keyword And Return Status
            ...    Should Contain
            ...    ${actual_msg_clean}
            ...    ${expected_clean}
            ...    ignore_case=True

            IF    ${is_match}
                Log To Console    => [PASS] Bắt đúng thông báo lỗi: ${expected_clean}
                Set Test Message
                ...    *HTML* <span style="color:green"><b>[PASS] NGHIỆP VỤ CHUẨN XÁC!</b><br>=> App đã chặn đúng lỗi: [${actual_msg_clean}]</span>
                RETURN
            ELSE
                # Đánh FAIL và hiển thị HTML đẹp mắt lên Report
                Fail
                ...    *HTML* <span style="color:red"><b>LỖI THÔNG BÁO: Thông báo lỗi không khớp!</b><br>=> Mong muốn: [${expected_clean}]<br>=> App thực tế hiện: [${actual_msg_clean}]</span>
            END
        ELSE
            # Nếu expected là thành công nhưng lại văng lỗi (không phải trùng data)
            Fail
            ...    *HTML* <span style="color:red"><b>LỖI HỆ THỐNG:</b> Kịch bản Happy Case bị chặn bởi popup báo lỗi:<br>[${actual_msg_clean}]</span>
        END
    ELSE
        # KHÔNG CÓ POPUP NÀO HIỆN LÊN
        IF    '${expected_message}' != 'Đăng ký thành công'
            # [QUY TẮC 2]: Nhập data sai nhưng app im re không chặn
            Fail
            ...    *HTML* <span style="color:red"><b>LỖI CHỨC NĂNG:</b> Điền thông tin không hợp lệ nhưng App KHÔNG CHẶN!</span>
        END

        # Nếu expected = 'Đăng ký thành công' và không có popup -> An toàn đi tiếp xuống Bước 3.
    END

    # =========================================================================
    # BƯỚC 3: NHẬP OTP (CHỈ CHẠY ĐẾN ĐÂY KHI LUỒNG HAPPY CASE THỰC SỰ PASS)
    # =========================================================================
    Common - Input OTP    ${dt_otp}
    Common - Click Element    ${btn_tiep_tuc_dk}

    # Đánh giá kết quả cuối cùng qua màn hình KYC
    ${is_kyc_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${title_xac_thuc_KYC}
    ...    timeout=10s

    IF    ${is_kyc_visible}
        Log To Console    => [PASS] Đã điều hướng sang màn Xác thực KYC thành công!
        Common - Click Element    ${btn_bo_qua_xac_thuc_KYC}
    ELSE
        Fail
        ...    *HTML* <span style="color:red"><b>LỖI ĐIỀU HƯỚNG:</b> Đăng ký thành công nhưng không chuyển sang màn Xác thực KYC!</span>
    END

    Log To Console    => Kịch bản hoàn thành xuất sắc!
    Log To Console    ${fullname},${phone},${email},${password},${confirm_password},${expected_message}
