*** Variables ***
${xuong_dong}                                   ${\n}
${btn_dang_ky_xem_can_ho}                       accessibility_id=Đăng ký xem căn hộ
${viewing_date_xem_can_ho}                      id=viewing_date
${btn_chon}                                     xpath=//android.widget.Button[@content-desc="Chọn"]
${btn_chon_gio_xem}                             accessibility_id=08:00
${btn_dang_ky_xem_chi_tiet_can_ho_da_thue}      xpath=//*[contains(@content-desc, '[Đã thuê] Cho thuê căn hộ cao cấp')]//*[@content-desc='Xem chi tiết']
${btn_xac_nhan}                                 accessibility_id=Xác nhận
${btn_huy_bo}                                   accessibility_id=Hủy bỏ
${lbl_da_dang_ky_lich}                          xpath=//android.view.View[contains(@content-desc, 'Bạn đã đăng ký xem căn hộ này vào ngày')]
# ${lbl_da_dang_ky_lich}    Bạn đã đăng ký xem căn hộ này vào ngày

# Các trường thông tin nhập liệu (Chỉ dùng để điền, không lấy data ở đây)
${input_ho_ten}                                 id=full_name
${input_email}                                  id=email
${input_so_dien_thoai}                          id=form_phone_number

# UI màn chi tiết căn hộ (dùng để lấy data gốc lưu vào dictionary)
${ngay_xem_phong_man_dang_ky_can_ho}            xpath=//android.view.View[@content-desc='Ngày xem *']/following-sibling::android.view.View[1]
${dia_chi_can_ho_man_chi_tiet_can_ho}           xpath=//android.view.View[contains(@content-desc, 'đánh giá')]/following-sibling::android.view.View[1]
${ten_can_ho_man_chi_tiet_can_ho}               xpath=//android.view.View[@content-desc='Tên căn hộ:']/following-sibling::android.view.View[1]
${ho_ten_chu_can_ho_man_chi_tiet_can_ho}        xpath=//android.view.View[contains(@content-desc, 'đánh giá')]/following-sibling::android.view.View[2]
${sdt_chu_can_ho_man_chi_tiet_can_ho}           xpath=//android.view.View[@content-desc="Liên hệ:"]/following-sibling::android.view.View[1]

# Thông báo từ hệ thống
${msg_dat_lich_thanh_cong}                      Bạn đã đặt lịch xem phòng thành công.
${msg_doi_lich_thanh_cong}                      Bạn đã đổi lịch xem phòng thành công.
${msg_loi_can_ho_da_cho_thue}                   Căn hộ đang có người ở hoặc đã ngừng sử dụng, không thể đặt lịch xem!

# Khởi tạo biến dictionary trống (global variable)
&{dic_thong_tin_yeu_cau_xem_can_ho}
...                                             sdt_chu_can_ho=${NONE}
...                                             dia_chi_can_ho=${NONE}
...                                             ten_can_ho=${NONE}
...                                             ngay_xem_can_ho=${NONE}
