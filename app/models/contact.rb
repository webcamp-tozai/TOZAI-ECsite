class Contact < ApplicationRecord
  # Validation
  validates :contact_status_id, presence: true
  validates :name,              presence: true
  validates :title,             presence: true
  validates :email,             presence: true
  validates :message,           presence: true
  
  # Association
  belongs_to :contact_status # contact_status has_many :contacts
end
