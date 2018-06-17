class Track < ApplicationRecord
  # Validation
  validates :item_id,         presence: true
  validates :artist_id,         presence: true

  validates :disc_number, presence: true,
    format: { with: /\A\d{1}\z/, # 1桁の半角数字のみ。2桁もいけへんやろ。。。
              message: "半角数字で入力して下さい。"  }
  
  validates :track_number,          presence: true,
    format: { with: /\A\d\z/,
              message: "1桁の半角数字で入力して下さい。"  }
              
  validates :name,            presence: true # 曲名
  
  validates :length_hour,     presence: true,
    format: { with: /\A\d\z/,
              message: "半角数字で入力して下さい。"  }
              
  validates :length_minute,   presence: true,
    format: { with: /\A[0-9]\z|\A[1-5][0-9]\z/, # 0-59までの数字
              message: "0から59までの半角数字で入力して下さい。"  }
              
  validates :length_second,   presence: true,
    format: { with: /\A[0-9]\z|\A[1-5][0-9]\z/, # 0-59までの数字
              message: "0から59までの半角数字で入力して下さい。"  }
              
  # Association
  belongs_to :item # dics_number has_many :tracks
  belongs_to :artist # artist belongs_to track
end
