*** Settings ***
Resource    ../config/import.resource
Resource    ../common/variables.resource

*** Keywords ***
Setup-Open application
    Open Application
    ...    remote_url=${remote_url}
    ...    automationName=${automationName}
    ...    platformName=${platformName}
    ...    deviceName=${deviceName}
    ...    platformVersion=${platformVersion}
    ...    appPackage=${appPackage}
    ...    appActivity=${appActivity}
    ...    noReset=${noReset}
    ...    fullReset=${fullReset}
#    ...    app=${EXECDIR}/app/${app_name}
#    ...    disableIdLocatorAutocompletion=${disableIdLocatorAutocompletion}

Teardown - Close application
    Close Application
    
Common - Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

#Tên hàm dùng chung tự định nghĩa
Common - Input Element

#    Khai báo các tham số đầu vào (parameters) bắt buộc khi gọi hàm
    [Arguments]    ${input_locator}    ${value}

#    Cơ chế chờ đợi chủ động, chờ cho đến khi ô nhập liệu thực sự hiện hình "visible" trên giao diện app rồi mới đi tiếp.
#    Giải quyết triệt để lỗi ElementNotFound (không tìm thấy phần tử) do thiết bị giật lag, mạng chậm hoặc app tốn thời gian render màn hình.
    Wait Until Element Is Visible    ${input_locator}

#    Xóa trắng dữ liệu cũ
    Clear Text    ${input_locator}

#    Nhập dữ liệu mới
    Input Text    ${input_locator}    ${value}

#Common - Input Current Date

