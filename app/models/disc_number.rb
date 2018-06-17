class DiscNumber < ApplicationRecord
  # Validation
  validates :number, presence: true,
    format: { with: /\A\d{1}\z/, # 1桁の半角数字のみ。2桁もいけへんやろ。。。
              message: "半角数字で入力して下さい。"  }
  
  # Association
  has_many :items # item has_many :disc_numbers
  has_many :tracks # track belongs_to :disc_number
end
