class Label < ApplicationRecord
=begin
  # Validation
  validates :name, presence: true
=end
  # Association
  has_many :items # item belongs_to label
end
