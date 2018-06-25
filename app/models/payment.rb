class Payment < ApplicationRecord
  # Validation
  validates :payment_method, presence: true
  
  # Association
  has_many :orders # order belongs_to :payment
end
