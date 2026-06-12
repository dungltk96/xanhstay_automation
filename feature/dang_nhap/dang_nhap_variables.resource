*** Variables ***
# locator user
${btn_open_form_login}                  accessibility_id=Đăng nhập
${input_phone_number}                   id=login_phone_number
${input_password}                       id=login_password
${btn_nav_login}                        id=btn_login
${lbl_chao_mung_user}                   xpath=//android.widget.ImageView[contains(@content-desc, 'Chào mừng')]
${msg_loi_dang_nhap_sdt}                accessibility_id=Vui lòng nhập số điện thoại
${msg_loi_dang_nhap_mat_khau}           accessibility_id=Vui lòng nhập mật khẩu
${msg_loi_dang_nhap_sai_thong_tin}      Tên đăng nhập hoặc mật khẩu không đúng

# locator admin
${input_tai_khoan_admin}                xpath=//android.view.View[@content-desc='Tài khoản']/following-sibling::android.widget.EditText[1]
${input_password_admin}                 xpath=//android.view.View[@content-desc='Tài khoản']/following-sibling::android.widget.EditText[2]
${btn_login_admin}                      xpath=//android.widget.Button[@content-desc="Đăng nhập"]
${lbl_chao_mung_admin}                  xpath=//android.view.View[@content-desc="Xin chào chủ nhà"]
