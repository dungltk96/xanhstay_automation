*** Variables ***
${btn_thue_can_ho}    accessibility_id=Thuê căn hộ
${viewing_contract}    xpath=(//android.widget.Button[@content-desc="Lựa chọn"])[1]
${chon_thang}    accessibility_id=Theo tháng

${viewing_thoi_han_thue}    accessibility_id=Lựa chọn
${chon_thoi_han_thue}    accessibility_id=3 tháng

${viewing_date_thue_can_ho}    xpath=//android.view.View[@content-desc="Ngày vào ở *"]/following-sibling::android.view.View[1]
${btn_ok}    accessibility_id=OK

${input_so_nguoi_o}    xpath=//android.view.View[@content-desc="Số người ở *"]/following-sibling::android.widget.EditText
${btn_xac_nhan}    accessibility_id=Xác nhận

${btn_dong}    accessibility_id=Đóng






#${btn_menu}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]
#${btn_tim_nha}    xpath=(//android.view.View[@content-desc="Tìm nhà"])[2]
#
#${btn_thue_can_ho}    accessibility_id=Thuê căn hộ
#${viewing_contract}    id=contract_type
#${chon_thang}    accessibility_id=Theo tháng
#
#${viewing_thoi_han_thue}    accessibility_id=Lựa chọn
#${chon_thoi_han_thue}    accessibility_id=3 tháng
#
#${viewing_date_thue_can_ho}    id=move_in_date
#${btn_ok}    accessibility_id=OK
#
#${input_so_nguoi_o}    id=occupant_count
#${btn_xac_nhan}    accessibility_id=Xác nhận
#
##Thông báo thành công
#${msg_thanh_cong}    Đăng ký thành công\nCảm ơn bạn đã đăng ký thuê căn hộ.\nYêu cầu của bạn hiện đang chờ phê duyệt.\nChúng tôi sẽ gửi thông báo ngay khi bạn được xét duyệt thành công!
#${btn_dong}    accessibility_id=Đóng
