*** Variables ***
# locator admin
${btn_nav_dang_nhap}                xpath=//android.widget.Button[@content-desc="Đăng nhập"]
${btn_nav_dang_ky}                  xpath=//android.view.View[@content-desc="Chưa có tài khoản? Đăng ký tài khoản mới"]
${input_ho_ten_dk}                  xpath=//android.widget.EditText[@hint='Họ và tên']
${input_sdt_dk}                     xpath=//android.widget.EditText[@hint='Số điện thoại']
${input_email_dk}                   xpath=//android.widget.EditText[@hint='Email']
${input_mat_khau_dk}                xpath=//android.widget.EditText[@hint='Mật khẩu']
${input_nhap_lai_mat_khau_dk}       xpath=//android.widget.EditText[@hint='Nhập lại mật khẩu']
${btn_nhan_ma_qua_email_dk}         accessibility_id=Email
${checkbox_dieu_khoan_dk}           xpath=//android.widget.CheckBox
${btn_lay_ma_OTP_dk}                accessibility_id=Lấy mã OTP
${input_OPT}                        xpath=//android.view.View[@content-desc="Nhập mã xác thực"]/following-sibling::android.widget.EditText
${btn_gui_lai_ma_OTP_dk}            accessibility_id=Gửi lại mã
${btn_tiep_tuc_dk}                  accessibility_id=Tiếp tục
${btn_bo_qua_xac_thuc_KYC}          accessibility_id=Bỏ qua
${title_xac_thuc_KYC}               xpath=//android.view.View[@content-desc="Xác thực KYC"]
