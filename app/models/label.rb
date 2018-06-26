class Label < ApplicationRecord
  # Validation
  validates :name, presence: true

  # Association
  has_many :items # item belongs_to label
end
