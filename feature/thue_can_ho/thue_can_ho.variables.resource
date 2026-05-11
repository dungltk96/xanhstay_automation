*** Variables ***
${btn_menu}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]
${btn_tim_nha}    (//android.view.View[@content-desc="Tìm nhà"])[2]
${btn_xem_chi_tiet_can_ho}    (//android.widget.Button[@content-desc="Xem chi tiết"])[2]

${btn_thue_can_ho}    //android.widget.Button[@content-desc="Thuê căn hộ"]
${viewing_contract}    //android.widget.Button[@resource-id="contract_type"]
${chon_thang}    //android.widget.Button[@content-desc="Theo tháng"]

${viewing_thoi_han_thue}    //android.widget.Button[@content-desc="Lựa chọn"]
${chon_thoi_han_thue}    //android.widget.Button[@content-desc="3 tháng"]

${viewing_date}    //android.view.View[@resource-id="move_in_date"]
${date_picker_today}    xpath=//android.widget.Button[contains(@content-desc, 'Today')]
${btn_chon}    accessibility_id=OK
${input_so_nguoi_o}    //android.widget.EditText[@resource-id="occupant_count"]
${btn_xac_nhan}    //android.widget.Button[@content-desc="Xác nhận"]





