class ItemReview < ApplicationRecord
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :review,  presence: true
end
