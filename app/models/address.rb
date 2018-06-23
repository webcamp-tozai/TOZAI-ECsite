class Address < ApplicationRecord
  # Validation
  validates :user_id,           presence: true
  validates :family_name_kanji, presence: true
  validates :given_name_kanji,  presence: true
  
  validates :post_code,         presence: true,
    format: { with: /\A\d{7}\z/, # 半角数字7桁のみ入力可能
              message: "半角数字7桁で入力して下さい。例：1234567" }
              
  validates :address,   presence: true
  
  # Association
  has_many :orders # order belongs_to address
  belongs_to :user # user has_many addresses
end
