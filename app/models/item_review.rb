class ItemReview < ApplicationRecord
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :review,  presence: true
end
