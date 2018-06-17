class Artist < ApplicationRecord
  validates :name,      presence: true
  validates :name_kana, presence: true,
    format: { with: /\A[ァ-ンー－]+\z/, # 全角カタカナのみ
              message: "全角カタカナで入力して下さい。例：AKB48→エーケービー"  }
              
  has_many :tracks # track has_many :tracks
  has_many :items
end
