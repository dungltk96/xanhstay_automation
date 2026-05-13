*** Variables ***
${btn_menu}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]
${btn_tim_nha}    xpath=(//android.view.View[@content-desc="Tìm nhà"])[2]
${btn_xem_chi_tiet_can_ho}    xpath=(//android.widget.Button[@content-desc="Xem chi tiết"])[1]

${btn_thue_can_ho}    xpath=//android.widget.Button[@content-desc="Thuê căn hộ"]
${viewing_contract}    xpath=//android.widget.Button[@resource-id="contract_type"]
${chon_thang}    xpath=//android.widget.Button[@content-desc="Theo tháng"]

${viewing_thoi_han_thue}    xpath=//android.widget.Button[@content-desc="Lựa chọn"]
${chon_thoi_han_thue}    xpath=//android.widget.Button[@content-desc="3 tháng"]

${viewing_date_thue_can_ho}    xpath=//android.view.View[@resource-id="move_in_date"]
#${date_picker_today}    xpath=//android.widget.Button[contains(@content-desc, 'Today')]
${btn_ok}    accessibility_id=OK

${input_so_nguoi_o}    xpath=//android.widget.EditText[@resource-id="occupant_count"]
${btn_xac_nhan}    xpath=//android.widget.Button[@content-desc="Xác nhận"]

#Thông báo thành công
${msg_thanh_cong}    Đăng ký thành công\nCảm ơn bạn đã đăng ký thuê căn hộ.\nYêu cầu của bạn hiện đang chờ phê duyệt.\nChúng tôi sẽ gửi thông báo ngay khi bạn được xét duyệt thành công!
${btn_dong}    xpath=//android.widget.Button[@content-desc="Đóng"]



