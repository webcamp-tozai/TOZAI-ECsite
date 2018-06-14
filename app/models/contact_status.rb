class ContactStatus < ApplicationRecord
  validates :admin_id,  presence: true
  validates :status,    presence: true
end
