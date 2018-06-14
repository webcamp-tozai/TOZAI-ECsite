class Contact < ApplicationRecord
  validates :contact_status_id, presence: true
  validates :name,              presence: true
  validates :title,             presence: true
  validates :email,             presence: true
  validates :message,           presence: true
end
