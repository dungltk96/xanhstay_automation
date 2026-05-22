*** Variables ***
${btn_menu}    xpath=//*[@bounds='[60,2762][270,2972]']

#3 lựa chọn
${btn_option_ca_nhan}    id=btn_menu_personal
${btn_option_can_ho}    id=btn_menu_apartment
${btn_option_tim_nha}    id=btn_menu_find_house

#${btn_option_ca_nhan} --> Lấy tất cả dữ liệu
${btn_menu_ca_nhan}    xpath=//*[@bounds='[368,2792][606,2942]']
${btn_menu_tat_ca_can_ho}    xpath=//*[@bounds='[606,2792][844,2942]']
${btn_menu_tat_ca_hop_dong}    xpath=//*[@bounds='[844,2792][1082,2942]']
${btn_menu_tat_ca_hoa_don}    xpath=//*[@bounds='[1082,2792][1320,2942]']

#${btn_option_can_ho} --> Chỉ lấy dữ liệu của căn hộ đang chọn
${btn_menu_dashboard}    xpath=//*[@bounds='[368,2792][606,2942]']
${btn_menu_yeu_cau_sua_chua}    xpath=//*[@bounds='[606,2792][844,2942]']
${btn_menu_hop_dong}    xpath=//*[@bounds='[844,2792][1082,2942]']
${btn_menu_tat_ca_hoa_don}    xpath=//*[@bounds='[1082,2792][1320,2942]']

#${btn_option_tim_nha}
${menu_tim_nha}    xpath=//*[@bounds='[368,2792][606,2942]']
${menu_can_ho_da_luu}    xpath=//*[@bounds='[606,2792][844,2942]']
${menu_yeu_cau_xem_phong}    xpath=//*[@bounds='[844,2792][1082,2942]']
${menu_yeu_cau_ky}    xpath=//*[@bounds='[1082,2792][1320,2942]']

#Button khác
${btn_xem_chi_tiet_can_ho}    xpath=//android.widget.ImageView[@resource-id='btn_view_ads_detail'][1]
${date_picker_today}    xpath=//android.widget.Button[contains(@content-desc, 'Today')]

#Thông báo từ hệ thống
${msg_thanh_cong}    thành công
