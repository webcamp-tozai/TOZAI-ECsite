class Order < ApplicationRecord
  # Validations
  validates :user_id,                 presence: true
  validates :address_id,              presence: true
  validates :payment_id,              presence: true
  validates :status,                  presence: true
  
  validates :total_count,             presence: true,
    numericality: { greater_than_or_equal_to: 0 }, #0以上
    format: { with: /\A\d+\z/, # 半角数字のみ
              message: "0以上の半角数字のみ。"  }
              
  validates :total_price_without_tax, presence: true,
    numericality: { greater_than_or_equal_to: 0 }, #0以上
    format: { with: /\A\d+\z/, # 半角数字のみ
              message: "-以上の半角数字のみ。"  }
              
  validates :total_price,             presence: true,
    numericality: { greater_than_or_equal_to: 0 }, #0以上
    format: { with: /\A\d+\z/, # 半角数字のみ
              message: "0以上の半角数字のみ。"  }
  
  # Association
  belongs_to :payment # payment has_many orders
  belongs_to :address # address has_many orders
  belongs_to :user # user has_many orders
  has_many :order_items
  has_many :items, through: :order_items
end
