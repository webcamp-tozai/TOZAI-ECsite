class Address < ApplicationRecord
  validates :user_id,   presence: true
  validates :name,      presence: true
  validates :post_code, presence: true,
    format: { with: /\A\d{7}\z/,
              message: "半角数字7桁で入力して下さい。例：1234567" }
    # 半角数字7桁のみ入力可能
  validates :address,   presence: true
end
