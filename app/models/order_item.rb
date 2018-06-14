class OrderItem < ApplicationRecord
  validates :item_id,                 presence: true
  
  validates :item_count,              presence: true,
    length: { minimum: 0 }, # 0以上
    format: { with: /\A\d\z/, # 半角数字のみ
              message: "半角数字で入力して下さい。"  }

  validates :total_price_without_tax, presence: true,
    length: { minimum: 0 }, # 0以上
    format: { with: /\A\d\z/, # 半角数字のみ
              message: "半角数字で入力して下さい。"  }
          
end
