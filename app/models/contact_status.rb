class ContactStatus < ApplicationRecord
  # Validation
  validates :admin_id,  presence: true
  validates :status,    presence: true

  # Association
  belongs_to :admin # admin has_many :contact_statuses
  has_many :cantacts # contacts belongs_to :contact_status
end
