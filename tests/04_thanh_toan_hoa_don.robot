*** Settings ***
Resource    ../common/keywords.resource
#Test Setup    Setup-Open Application    user
#Test Teardown    Teardown - Close Application

#Suite Setup    run keywords    Mo Ung Dung Va Dang Nhap He Thong    ${dt_phone_number}    ${dt_password}
#...    AND    Set Library Search Order    AppiumLibrary    SeleniumLibrary
#Suite Teardown    Close Application
#Test Teardown    Don Dep Man Hinh Sau Khi Test

*** Test Cases ***
#TC_01_Thue_can_ho_thanh_cong
#    [Documentation]    Đăng ký thuê căn hộ thành công
#    [Tags]    smoke
#    [Setup]    Setup-Open Application    user
#    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
#    Thuc Hien Thue Can Ho    ${dt_so_nguoi_o}
#    [Teardown]    Teardown - Close Application

TC_02_Duyet_Hoa_Don_Thanh_Toan_Tien_Coc
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke flow
    [Setup]    Setup-Open Application    admin
    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
#    [Teardown]    Teardown - Close Application

TC_03_Duyet_Hoa_Don_Thanh_Toan_Tien_Thue
    [Documentation]    Admin duyệt hóa đơn tiền cọc
    [Tags]    smoke flow
#    [Setup]    Setup-Open Application    admin
#    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
    Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha
    [Teardown]    Teardown - Close Application

#TC01_Thanh_toan_hoa_don_tien_coc
#    [Documentation]    Thanh toán hóa đơn tiền cọc
#    [Tags]    smoke    flow
#    Thuc Hien Dang Nhap    ${dt_phone_number}    ${dt_password}
#    Thuc Hien Thanh Toan Hoa Don Tien Coc

#TC_02_Duyet_Hoa_Don_Thanh_Toan_Tien_Coc
#    [Documentation]    Admin duyệt hóa đơn tiền cọc
#    [Tags]    smoke flow
#    [Setup]    Setup-Open Application    admin
#    Thuc Hien Dang Nhap App Admin    ${dt_tai_khoan_admin}    ${dt_mat_khau_admin}    ${dt_display_name_admin}
#    Thuc Hien Duyet Hoa Don Thanh Toan Tien Coc
#    Thuc Hien Duyet Hoa Don Thanh Toan Tien Thue Nha
#    [Teardown]    Teardown - Close Application

#TC_WebAdmin_dang_nhap
#    ${service}=    Evaluate
#    ...    selenium.webdriver.chrome.service.Service(webdriver_manager.chrome.ChromeDriverManager().install())
#    ...    selenium, webdriver_manager.chrome
#    Create Webdriver    Chrome    service=${service}
#
#    Maximize Browser Window
#    Go To    http://admin-smart-homestay.m2wdemo.id.vn/
#
#    Common - Dang Nhap WebAdmin
#    Close Browser
