class OrderItem < ApplicationRecord
  # Validation
  validates :item_id,                 presence: true
  
  validates :item_count,              presence: true,
    numericality: { greater_than_or_equal_to: 0 }, #0以上
    format: { with: /\A\d+\z/, # 半角数字のみ
              message: "半角数字で入力して下さい。"  }

  validates :total_price_without_tax, presence: true,
    numericality: { greater_than_or_equal_to: 0 }, #0以上
    format: { with: /\A\d+\z/, # 半角数字のみ
              message: "半角数字で入力して下さい。"  }
  
  # Association
  belongs_to :item
  belongs_to :order
end
