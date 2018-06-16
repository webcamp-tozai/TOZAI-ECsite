class Contact < ApplicationRecord
  # Validation
  validates :contact_status_id, presence: true
  validates :name,              presence: true
  validates :title,             presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,             presence: true, 
    format: { with: VALID_EMAIL_REGEX, 
              message: "記入内容を確認して下さい。"  }

  validates :message,           presence: true

  # Association
  belongs_to :contact_status # contact_status has_many :contacts
end
