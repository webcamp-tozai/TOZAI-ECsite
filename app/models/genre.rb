class Genre < ApplicationRecord
  # Validation
  validates :genre_english, presence: true,
    format: { with: /\A[a-zA-Z0-9_`-]+\z/,
              message: "半角英数字で入力して下さい。"  }
              
  validates :genre_kana,    presence: true,
    format: { with: /\A[ァ-ンー－]+\z/, # 全角カタカナのみ
              message: "全角カタカナで入力して下さい。例：Rock→ロック"  }
              
  # Association
  has_many :items # item belongs_to genres
end
