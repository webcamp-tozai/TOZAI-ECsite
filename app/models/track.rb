class Track < ApplicationRecord
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
end
