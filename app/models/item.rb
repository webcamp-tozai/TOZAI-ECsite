class Item < ApplicationRecord
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
end
