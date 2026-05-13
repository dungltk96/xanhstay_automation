*** Variables ***
${btn_menu}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]
${btn_ca_nhan}    accessibility_id=Cá nhân
#${input_phone_number}   id=login_phone_number
#${input_password}    id=login_password

${input_phone_number}   xpath=//android.widget.EditText[@hint='Số điện thoại']
${input_password}    xpath=//android.widget.EditText[@hint='Mật khẩu']

${btn_open_login}    accessibility_id=Đăng nhập
${btn_login}    xpath=//android.widget.Button[@content-desc="Đăng nhập"]
