class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :encrypted_password,
  				length: {
  					in: 6..20,
  					message: "6〜20文字までのパスワードを入力してください"
  					}
  validates :family_name_kanji,
				format: {
					with: /\A[ぁ-んァ-ン一-龥a-zA-Z]/,
					message: "全角の日本語か半角の英語で入力して下さい"
					}
  validates :given_name_kanji,
				format: {
					with: /\A[ぁ-んァ-ン一-龥a-zA-Z]/,
					message: "全角の日本語か半角の英語で入力して下さい"
					}
  validates :family_name_kana,
				format: {
					with: /\A[ァ-ンー－]+\z/,
					message: "全角のカタカナで入力して下さい"
					}
  validates :given_name_kana,
				format: {
					with: /\A[ァ-ンー－]+\z/,
					message: "全角のカタカナで入力して下さい"
					}
end
