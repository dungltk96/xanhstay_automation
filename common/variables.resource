*** Variables ***
${btn_menu}                     xpath=//*[@bounds='[60,2762][270,2972]']

# 3 lựa chọn
${btn_option_ca_nhan}           id=btn_menu_personal
${btn_option_can_ho}            id=btn_menu_apartment
${btn_option_tim_nha}           id=btn_menu_find_house

# ${btn_option_ca_nhan} --> Lấy tất cả dữ liệu
${btn_menu_ca_nhan}             id=nav_tab_Cá nhân
${btn_menu_tat_ca_can_ho}       id=nav_tab_Căn hộ
${btn_menu_tat_ca_hop_dong}     id=nav_tab_Hợp đồng
${btn_menu_tat_ca_hoa_don}      id=nav_tab_Phiếu thanh toán

# ${btn_option_can_ho} --> Chỉ lấy dữ liệu của căn hộ đang chọn
${btn_menu_dashboard}           id=nav_tab_Căn hộ
${btn_menu_yeu_cau_sua_chua}    id=nav_tab_Yêu cầu sửa chữa
${btn_menu_hop_dong}            id=nav_tab_Hợp đồng
${btn_menu_hoa_don}             id=nav_tab_Phiếu thanh toán

# ${btn_option_tim_nha}
${menu_tim_nha}                 id=nav_tab_Tìm nhà
${menu_can_ho_da_luu}           id=nav_tab_Đã lưu
${menu_yeu_cau_xem_phong}       id=nav_tab_Yêu cầu xem phòng
${menu_yeu_cau_ky}              id=nav_tab_Yêu cầu ký hợp đồng

# Button khác
${btn_xem_chi_tiet_can_ho}      xpath=//android.widget.Button[@content-desc="Xem chi tiết"][1]
${date_picker_today}            xpath=//android.widget.Button[contains(@content-desc, 'Today')]
${nav_ui_thanh_toan_payos}      xpath=//android.widget.TextView[@text="Chi tiết đơn hàng"]
${btn_tiep_tuc}                 accessibility_id=Tiếp tục

# Thông báo từ hệ thống
${msg_thanh_cong}               thành công

# App admin
${menu_hoa_don_admin}           accessibility_id=Hóa đơn
