class DiscNumber < ApplicationRecord
  validates :number, presence: true,
    format: { with: /\A\d{1}\z/, # 1桁の半角数字のみ。2桁もいけへんやろ。。。
              message: "半角数字で入力して下さい。"  }
end