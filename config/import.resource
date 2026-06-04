*** Settings ***
Library    BuiltIn    #Cung cấp các keyword cơ bản để phục vụ viết testcase (Log, Log To Console, Should Be Equal, Set Variable, Sleep, Run Keyword If)
Library    AppiumLibrary    #Cung cấp các keyword để open app, click phần tử, nhập dữ liệu, vuốt màn hình, kiểm tra hiển thị phần tử)
Library    DateTime    #Dùng để xử lý ngày giờ
Library    String    #Dùng để xử lý chuỗi ký tự
Library    Collections    #Xử lý mảng
Library    RequestsLibrary
#Library    SeleniumLibrary
Variables   ../data/device.yaml
Variables   ../data/data_${env}.yaml
Resource    ../common/keywords.resource
Resource    ../feature/dang_nhap/dang_nhap_keywords.resource
Resource    ../feature/dang_ky_xem_can_ho/dang_ky_xem_can_ho_keywords.resource
Resource    ../feature/thue_can_ho/thue_can_ho.keywords.resource
Resource    ../feature/quan_ly_hop_dong/xac_nhan_hop_dong.keywords.resource
Resource    ../feature/dang_xuat/dang_xuat.keywords.resource
Resource    ../feature/thanh_toan_hoa_don/thanh_toan_hoa_don.keywords.resource
Resource    ../feature/dat_coc_giu_cho/dat_coc_giu_cho.keywords.resource
Resource    ../feature/dang_ky_tai_khoan/dang_ky_tai_khoan_keywords.resource
Resource    ../feature/api_hop_dong/api_hop_dong_keywords.resource
