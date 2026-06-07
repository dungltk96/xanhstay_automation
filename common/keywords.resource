*** Settings ***
Resource    ../config/import.resource
Resource    ../common/variables.resource

*** Keywords ***
Setup-Open Application
    [Documentation]    Mở ứng dụng tùy chọn. Mặc định là mở App User. Truyền 'admin' để mở App Admin.
    [Arguments]    ${app_type}=user

    # 1. Khởi tạo biến lưu package và activity mặc định (là của User)
    ${target_package}=     Set Variable    ${user_appPackage}
    ${target_activity}=    Set Variable    ${user_appActivity}

    # 2. Đổi hướng sang App Admin nếu được yêu cầu
    IF    '${app_type}' == 'admin'
        ${target_package}=     Set Variable    ${admin_appPackage}
        ${target_activity}=    Set Variable    ${admin_appActivity}
    END

    # 3. Mở App với biến động (Dynamic Variables)
    Open Application
    ...    remote_url=${remote_url}
    ...    automationName=${automationName}
    ...    platformName=${platformName}
    ...    deviceName=${deviceName}
    ...    platformVersion=${platformVersion}
    ...    appPackage=${target_package}
    ...    appActivity=${target_activity}
    ...    noReset=${noReset}
    ...    fullReset=${fullReset}
    ...    disableIdLocatorAutocompletion=${disableIdLocatorAutocompletion}
#    ...    app=${EXECDIR}/app/${app_name}
    Log To Console    \n[Info] Đã mở thành công App: ${app_type}

Teardown - Close application
    Close Application

Teardown - Chup Anh Va Dong App
    # 1. Lấy tên Test Case gốc
    ${raw_name}=    Set Variable    ${TEST_NAME}

    # 2. Xóa các ký tự cấm của Windows (\ / : * ? " < > |) và thay bằng dấu gạch dưới (_)
    # Sử dụng Regular Expression (Regexp) để quét sạch một lần
    ${safe_name}=    Replace String Using Regexp    ${raw_name}    [:\\\\/*?"<>|]    _

    # 3. Xử lý khoảng trắng: Biến tất cả khoảng trắng thành 1 dấu gạch dưới
    ${safe_name}=    Replace String Using Regexp    ${safe_name}    \\s+    _

    # (Tùy chọn) 4. Cắt bỏ dấu gạch dưới ở 2 đầu tên file nếu có (để tên file gọn gàng hơn)
    ${safe_name}=    Strip String    ${safe_name}    characters=_

    # 5. Chụp ảnh nếu TC Fail với tên file
    Run Keyword If Test Failed    Capture Page Screenshot    ${safe_name}.png

    # 6. Đóng App
    Teardown - Close Application


Teardown - Chup Anh Khi Loi
    [Documentation]    Hàm bổ trợ làm sạch tên file ảnh theo chuẩn Windows để tránh lỗi lưu ảnh
    ${raw_name}=    Set Variable    ${TEST_NAME}
    ${safe_name}=    Replace String Using Regexp    ${raw_name}    [:\\\\/*?"<>|]    _
    ${safe_name}=    Replace String Using Regexp    ${safe_name}    \\s+    _
    ${safe_name}=    Strip String    ${safe_name}    characters=_
    Capture Page Screenshot    ${safe_name}.png

Common - Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    30s
    Click Element    ${locator}

Common - Input Element
#    Khai báo các tham số đầu vào (parameters) bắt buộc khi gọi hàm
    [Arguments]    ${input_locator}    ${value}    ${error_msg_input}=Lỗi: Không tìm thấy ô để nhập liệu!

#    Cơ chế chờ đợi chủ động, chờ cho đến khi ô nhập liệu thực sự hiện hình "visible" trên giao diện app rồi mới đi tiếp.
    Wait Until Element Is Visible    ${input_locator}    5s    error=${error_msg_input}
    Clear Text    ${input_locator}
    Input Text    ${input_locator}    ${value}

Common - Chon Ngay Tuong Lai
    [Arguments]    ${so_ngay_cong_them}

    # 1. Tính toán ngày tương lai (Chỉ lấy số ngày)
    ${ngay_tuong_lai}=    Get Current Date    increment=${so_ngay_cong_them} days    result_format=%d

    # 2. Ép kiểu để xóa số 0 ở đầu (Ví dụ: "05" -> 5)
    ${ngay_chuan}=    Convert To Integer    ${ngay_tuong_lai}
    Log    Ngày cần chọn là: ${ngay_chuan}

    ${locator_ngay_tuong_lai}=    Set Variable    xpath=//*[contains(@content-desc, '${ngay_chuan},')]

    # 4. Chờ và Click chọn ngày
    Wait Until Page Contains Element    ${locator_ngay_tuong_lai}
    Common - Click Element    ${locator_ngay_tuong_lai}

Common - Vuot Man Hinh Tim Element
    [Arguments]    ${locator}    ${so_lan_vuot_toi_da}=5
    [Documentation]    Vuốt màn hình từ dưới lên trên để tìm element bị khuất theo tỷ lệ %

    FOR    ${index}    IN RANGE    ${so_lan_vuot_toi_da}
        # Kiểm tra xem phần tử đã xuất hiện trên màn hình chưa (Không chờ lâu, quét nhanh)
        ${da_thay_chua}=    Run Keyword And Return Status    Page Should Contain Element    ${locator}

        # Nếu đã thấy rồi thì thoát vòng lặp ngay lập tức
        IF    ${da_thay_chua}
            Log    [Thành công] Đã tìm thấy phần tử ở lần cuộn thứ ${index}
            BREAK
        END

        # Nếu chưa thấy, tiến hành vuốt từ dưới (y=80%) lên trên (y=20%) ở giữa màn hình (x=50%)
        # Tham số cuối (1000) là thời gian vuốt 1000ms = 1 giây để vuốt mượt mà
        Swipe By Percent    50    80    50    20    1000ms

        # Dừng lại 1 chút để giao diện load kịp sau khi vuốt
        Sleep    1s
    END

    # Chốt chặn cuối cùng: Đảm bảo phần tử thực sự hiển thị hợp lệ trước khi cho đi tiếp
    Wait Until Page Contains Element    ${locator}    5s    error=LỖI TÌM KIẾM: Đã cuộn hết cỡ nhưng không thấy phần tử ${locator}

Common - Keo De Lam Moi Man Hinh
    [Documentation]    Thực hiện cử chỉ Pull-to-refresh bằng cách vuốt dọc từ trên xuống dưới.
    [Arguments]    ${thoi_gian_vuot}=2000ms

    # Bắt đầu từ giữa màn hình phía trên (X=50%, Y=40%)
    # Kéo mạnh xuống phía dưới (X=50%, Y=90%)
    # Thời gian kéo mặc định 2000ms (1 giây)
    Swipe By Percent    50    40    50    90    ${thoi_gian_vuot}

    # Chờ một chút để app xuất hiện icon xoay vòng (loading spinner) và tải dữ liệu mới
    Sleep    3s

Mo Ung Dung Va Dang Nhap He Thong
    [Arguments]    ${phone}    ${password}
    [Documentation]    Gộp bước mở Appium và Đăng nhập để dùng cho Suite Setup
    Setup-Open Application
    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
    Log To Console         \n[Info] Đã mở App và Đăng nhập thành công!

#Dọn dẹp
Don Dep Man Hinh Sau Khi Test
    Run Keyword And Ignore Error    Go Back

Common - Lay AccessToken Tu API Dang Nhap
    Create Session    XanhStay    http://smart-homestay-api-dev.m2wdemo.id.vn
    &{dic_data_login}    Create Dictionary    username=${dt_phone_number}    password=${dt_password}
    ${response}=    POST On Session    XanhStay    /api/v1/Auth/login    json=${dic_data_login}
    Log To Console     ${response.json()}[data][accessToken]
    RETURN    ${response.json()}[data][accessToken]

Common - Chuan Hoa Ngay Thang Tu API
    [Arguments]    ${api_date_raw}

    # Thư viện DateTime của Robot Framework tự động hiểu định dạng ISO có chữ T
    ${formatted_date}=    Convert Date    ${api_date_raw}    result_format=%d/%m/%Y
    RETURN    ${formatted_date}

Common - Chuan Hoa Tien Te Tu API
    [Arguments]    ${api_price_raw}

    # Sử dụng Evaluate để chạy hàm Format số của Python:
    # 1. Ép kiểu về float. 2. Format có dấu phẩy (7,000,000). 3. Đổi phẩy thành chấm (7.000.000)
    ${formatted_price}=    Evaluate    "{:,.0f}".format(float('${api_price_raw}')).replace(',', '.')
    RETURN    ${formatted_price}




#Common - Dang Nhap WebAdmin
#    Set Library Search Order    SeleniumLibrary    AppiumLibrary
#    Common - Click Element    ${msg_bat_thong_bao_web}
#
#    Common - Click Element    ${ten_tai_khoan_admin}
#
#    Common - Click Element    ${mat_khau_admin}
#
#    Common - Click Element    ${btn_dang_nhap_admin}
