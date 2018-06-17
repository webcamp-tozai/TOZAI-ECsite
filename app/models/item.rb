class Item < ApplicationRecord
  attachment :image
  # Validation
  validates :label_id,          presence: true
  validates :genre_id,          presence: true
  validates :artist_id,         presence: true
  validates :title,             presence: true
  validates :image_id,          presence: true
  
  validates :stock,             presence: true,
    numericality: { greater_than_or_equal_to: 0 }, #0以上
    format: { with: /\A\d+\z/, # 半角数字のみ
              message: "0以上の半角数字のみ。"  }
              
  validates :price_without_tax, presence: true,
    numericality: { greater_than_or_equal_to: 0 }, #0以上
    format: { with: /\A\d+\z/, # 半角数字のみ
              message: "0以上の半角数字のみ。"  }
              
  validates :content_type,      presence: true
  
  validates :is_deleted,        inclusion: { in: [true, false] }
                                
  # Association
  belongs_to :label #label has_many :items
  belongs_to :genre #genre has_many :items
  belongs_to :artist
  has_many :tracks
  has_many :cart_items # cart_item belongs_to :item
  has_many :item_reviews
  has_many :users, through: :item_reviews
  has_many :order_items
  has_many :orders, through: :order_items
end
