*** Variables ***
#Nút bấm
${btn_xem_chi_tiet_can_ho}    xpath=(//android.widget.Button[@content-desc="Xem chi tiết"])[1]
${btn_dang_ky_xem_can_ho}    xpath=//android.widget.Button[@content-desc="Đăng ký xem căn hộ"]
${viewing_date}    //android.view.View[@resource-id="viewing_date"]
${date_picker_today}    xpath=//android.widget.Button[contains(@content-desc, 'Today')]
${btn_chon}    accessibility_id=Chọn

#Các trường thông tin khác
${input_ho_ten}    //android.widget.EditText[@hint="Nhập họ và tên"]
${input_email}    //android.widget.EditText[@hint="Nhập email"]
${input_so_dien_thoai}    //android.widget.EditText[@hint="Nhập số điện thoại"]
${btn_xac_nhan}    accessibility_id=Xác nhận
${btn_huy_bo}    accessibility_id=Hủy bỏ

#Thông báo thành công
${msg_thanh_cong}    thành công



