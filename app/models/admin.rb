class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validation
  validates :family_name_kanji,   presence: true,
    format: {
      with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/,
      message: "全角の日本語か半角の英語で入力して下さい"
      }

  validates :given_name_kanji,    presence: true,
    format: {
      with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/,
      message: "全角の日本語か半角の英語で入力して下さい"
      }

  validates :family_name_kana,    presence: true,
    format: {
      with: /\A[ァ-ンー－]+\z/,
      message: "全角のカタカナで入力して下さい"
      }

  validates :given_name_kana,     presence: true,
    format: {
      with: /\A[ァ-ンー－]+\z/,
      message: "全角のカタカナで入力して下さい"
      }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,               presence: true, 
                                  uniqueness: true,
    format: { with: VALID_EMAIL_REGEX, 
              message: "記入内容を確認して下さい。"  }
  # Validation on create
  validates :password,            presence: true,
    length: { in: 6..20,
              message: "6〜20文字までのパスワードを入力してください" }

  validates :is_main_administer,  presence: true,
                                  inclusion: { in: [true, false] }
  
  validates :is_deleted,          presence: true,
                                  inclusion: { in: [true, false] }
  
  # Association
  has_many :contact_statuses #contact_status belongs_to :admin
end
