*** Variables ***
${ds_hop_dong_co_trang_cho_lap_hop_dong}        xpath=//android.view.View[contains(@content-desc, 'Chờ lập hợp đồng')][1]
${btn_detail_yc_hop_dong}                       accessibility_id=Chi tiết hợp đồng
${tick_checkbox}                                xpath=//android.widget.CheckBox
${btn_xac_nhan_hop_dong}                        xpath=//android.widget.Button[@content-desc="Xác nhận hợp đồng"]
${title_thong_bao_xac_nhan_hop_dong_success}    xpath=//android.view.View[contains(@content-desc,'Chúc mừng bạn đã thuê thành công')]

# Các thông báo lỗi
${msg_untick_err}                               Bạn phải xác nhận đã đọc và đồng ý với các điều khoản trong hợp đồng trước khi xác nhận thuê căn hộ
${msg_KYC_err}                                  Người thuê chưa xác thực danh tính (KYC). Vui lòng hoàn tất KYC trước khi xác nhận hợp đồng.
${msg_payment_err}                              Vui lòng thanh toán hóa đơn cọc/tiền phòng trước khi ký
