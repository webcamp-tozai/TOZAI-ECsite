class Order < ApplicationRecord
  # Validations
  validates :total_price,             presence: true
  validates :user_id,                 presence: true
  validates :address_id,              presence: true
  validates :payment_id,              presence: true
  validates :status,                  presence: true
  
  validates :total_count,             presence: true,
    format: { with: /\A\d\z/, # 半角数字のみ
              message: "半角数字で入力して下さい。"  }
              
  validates :total_price_without_tax, presence: true,
    length: { minimum: 0 }, # 0以上
    format: { with: /\A\d\z/, # 半角数字のみ
              message: "半角数字で入力して下さい。"  }
              
  validates :total_price,             presence: true,
    length: { minimum: 0 }, # 0以上
    format: { with: /\A\d\z/, # 半角数字のみ
              message: "半角数字で入力して下さい。"  }
  
  # Association
  belongs_to :payment # payment has_many orders
  belongs_to :address # address has_many orders
  belongs_to :user # user has_many orders
  has_many :order_items
  has_many :items, through: :order_items
end
