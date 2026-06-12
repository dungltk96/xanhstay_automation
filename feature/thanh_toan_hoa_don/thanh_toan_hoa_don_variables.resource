*** Variables ***
# Locator user
${btn_chon_hoa_don_chua_thanh_toan_coc}                 xpath=//android.view.View[contains(@content-desc, 'Chưa thanh toán') and contains(@content-desc, 'Đặt cọc căn hộ')][1]
${btn_chon_hoa_don_chua_thanh_toan_tien_thue}           xpath=//android.view.View[contains(@content-desc, 'Chưa thanh toán') and contains(@content-desc, 'Hóa đơn tiền thuê')][1]
${btn_chon_hoa_don_chua_thanh_toan_tien_coc_giu_cho}    xpath=//android.view.View[contains(@content-desc, 'Chưa thanh toán') and contains(@content-desc, 'Cọc giữ chỗ')][1]
${btn_thanh_toan_phieu}                                 id=btn_pay_invoice

# Admin duyệt hóa đơn
${btn_chon_hoa_don_thanh_toan_coc_t1_admin}             xpath=//android.view.View[contains(@content-desc, 'Chờ thanh toán') and contains(@content-desc, 'Đặt cọc căn hộ')][1]
${btn_chon_hoa_don_thanh_toan_nha_t1_admin}             xpath=//android.view.View[contains(@content-desc, 'Chờ thanh toán') and contains(@content-desc, 'Hóa đơn tiền thuê')][1]
${btn_xac_nhan_thanh_toan_admin}                        accessibility_id=Xác nhận thanh toán
${popup_xac_nhan_thanh_toan_admin}                      accessibility_id=Xác nhận
${msg_duyet_hoa_don_thanh_cong_admin}                   xpath=//android.view.View[contains(@content-desc, "Đã xác nhận thanh toán")]
${btn_back_admin}                                       xpath=//android.widget.Button[@content-desc="Back"]
