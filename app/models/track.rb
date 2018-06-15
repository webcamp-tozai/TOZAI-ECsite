class Track < ApplicationRecord
  # Validation
  validates :disc_number_id,  presence: true
  
  validates :number,          presence: true,
    format: { with: /\A\d\z/,
              message: "1桁の半角数字で入力して下さい。"  }
              
  validates :name,            presence: true # 曲名
  
  validates :length_hour,     presence: true, default: 0,
    format: { with: /\A\d\z/,
              message: "半角数字で入力して下さい。"  }
              
  validates :length_minute,   presence: true,
    format: { with: /\A\d{1,2}\z/, # 60以上の数字も入る。範囲指定が上手くいけへん。。。
              message: "半角数字で入力して下さい。"  }
              
  validates :length_second,   presence: true,
    format: { with: /\A\d{1,2}\z/, # 60以上の数字も入る。範囲指定が上手くいけへん。。。
              message: "半角数字で入力して下さい。"  }
              
  # Association
  belongs_to :disc_number # dics_number has_many :tracks
  has_many :artists # artist belongs_to track
end
