*** Variables ***
${btn_thue_can_ho}                          accessibility_id=Thuê căn hộ
${ds_chu_ky_thanh_toan}                     id=contract_type

${ds_thoi_han_hop_dong}                     id=contract_duration
${btn_chon_chu_ky_thanh_toan}               xpath=//android.widget.Button[contains(@content-desc,"tháng")][1]

${viewing_date_thue_can_ho}                 xpath=//android.view.View[@content-desc="Ngày vào ở *"]/following-sibling::android.view.View[1]
${btn_ok}                                   accessibility_id=OK

${input_so_nguoi_o}                         xpath=//android.view.View[@content-desc="Số người ở *"]/following-sibling::android.widget.EditText
${btn_xac_nhan}                             accessibility_id=Xác nhận

${btn_dong}                                 accessibility_id=Đóng
${title_dang_ky_thue_phong_thanh_cong}      xpath=//android.view.View[contains(@content-desc, 'Đăng ký thành công')]
${content_dang_ky_thue_phong_thanh_cong}    xpath=//android.view.View[contains(@content-desc, 'Cảm ơn bạn đã đăng ký thuê căn hộ')]

${so_tien_thue_1_thang}                     xpath=//android.view.View[contains(@content-desc, 'VNĐ')][1]
${ten_can_ho_man_dang_ky_thue_can_ho}       xpath=//android.view.View[@content-desc="Tên căn hộ:"]/following-sibling::android.view.View[1]
&{dic_thong_tin_yeu_cau_thue_can_ho}        ten_can_ho=${NONE}    tien_coc_can_ho=${NONE}    tien_thue_dau_ky=${NONE}
