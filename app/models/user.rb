class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Validatoin
  validates :password,
  	length: {
  		in: 6..20,
  		message: "6〜20文字までのパスワードを入力してください"
  		}
  validates :family_name_kanji,
  	format: {
  		with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/,
  		message: "全角の日本語か半角の英語で入力して下さい"
  		}
  validates :given_name_kanji,
  	format: {
  		with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/,
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
  validates :phone_number,
		format: {
			with: /\A\d{10}\z|\A\d{11}\z/,
			message: "ハイフン無しの半角数字のみで入力してください"
			}
  validates :post_code,
    format: {
			with: /\A\d{7}\z/,
			message: "ハイフン無しの半角数字のみで入力してください"
			}
  					
  # Association
  has_one :cart_item
  has_many :addresses # address belongs_to user
  has_many :orders # order belongs_to user
  has_many :item_reviews
  has_many :items, through: :item_reviews
end
