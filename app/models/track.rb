class Track < ApplicationRecord
  # Validation
  validates :disc_number_id,  presence: true
  
  validates :number,          presence: true,
    format: { with: /\A\d\z/,
              message: "半角数字で入力して下さい。"  }
              
  validates :name,            presence: true
  
  validates :length_hour,     presence: true, default: 0,
    format: { with: /\A\d\z/,
              message: "半角数字で入力して下さい。"  }
              
  validates :length_minute,   presence: true,
    format: { with: /\A\d\z/,
              message: "半角数字で入力して下さい。"  }
              
  validates :length_second,   presence: true,
    format: { with: /\A\d\z/,
              message: "半角数字で入力して下さい。"  }
              
  # Association
  belongs_to :disc_number # dics_number has_many :tracks
  has_many :artists # artist belongs_to track
end
