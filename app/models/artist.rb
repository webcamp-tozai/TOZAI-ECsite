class Artist < ApplicationRecord
  validates :track_id,  presence: true
  validates :name,      presence: true
  validates :name_kana, presence: true
end
