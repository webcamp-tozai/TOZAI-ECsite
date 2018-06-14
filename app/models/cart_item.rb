class CartItem < ApplicationRecord
  # Validation
  validates :item_id,     presence: true
  validates :user_id,     presence: true
  validates :item_count,  presence: true,
    length: { minimum: 0 }, # 0以上
    format: { with: /\A\d\z/, # 半角数字のみ
              message: "半角数字で入力して下さい。"  }
              
  # Association
  belongs_to :user # user has_one :cart_item
  belongs_to :item # item 
end
