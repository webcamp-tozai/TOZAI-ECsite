class Payment < ApplicationRecord
  validates :payment_method, presence: true
end
