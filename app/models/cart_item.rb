class CartItem < ApplicationRecord
  validates :item_id,     presence: true
  validates :user_id,     presence: true
  validates :item_count,  presence: true,
    length: { minimum: 0 },
    format: { with: /\A\d\z/, # 0以上の半角数字のみ
              message: "半角数字で入力して下さい。"  }
end
