class Genre < ApplicationRecord
  validates :genre_english, presence: true
  validates :genre_kana,    presence: true
end
