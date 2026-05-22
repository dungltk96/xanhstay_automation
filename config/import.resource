*** Settings ***
Library    BuiltIn
Library    AppiumLibrary
Library    DateTime
Library    String    
Library    Collections    #Xử lý mảng
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
Resource    ../feature/quang_cao/danh_sach_quang_cao.keywords.resource