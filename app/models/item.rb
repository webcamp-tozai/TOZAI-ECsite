class Item < ApplicationRecord
  # Validation
  validates :track_id,          presence: true
  validates :disc_number_id,    presence: true
  validates :label_id,          presence: true
  validates :artist_id,         presence: true
  validates :genre_id,          presence: true
  validates :title,             presence: true
  validates :image_id,          presence: true
  
  validates :stock,             presence: true,
    length: { minimum: 0 },
    format: { with: /\A\d\z/,
              message: "半角数字で入力して下さい。"  }
              
  validates :price_without_tax, presence: true,
    length: { minimum: 1 },
    format: { with: /\A\d\z/,
              message: "半角数字で入力して下さい。" }
              
  validates :type,              presence: true
  
  validates :is_deleted,        inclusion: { in: [true, false] },
                                default: false # false => 販売中
                                
  # Association
  has_many :disc_numbers # disc_number belongs_to :item
  belongs_to :label #label has_many :items
  belongs_to :genre #genre has_many :items
  has_many :cart_items # cart_item belongs_to :item
  has_many :item_reviews
  has_many :users, through: :item_reviews
  has_many :order_items
  has_many :orders, through: :order_items
end
