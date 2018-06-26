class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validatoin
  validates :family_name_kanji, presence: true,
    format: {
      with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/,
      message: "全角の日本語か半角の英語で入力して下さい"
    }

  validates :given_name_kanji,  presence: true,
    format: {
      with: /\A[ぁ-んァ-ン一-龥a-zA-Z]+\z/,
      message: "全角の日本語か半角の英語で入力して下さい"
    }

  validates :family_name_kana,  presence: true,
    format: {
      with: /\A[ァ-ンー－]+\z/,
      message: "全角のカタカナで入力して下さい"
    }

  validates :given_name_kana,   presence: true,
    format: {
      with: /\A[ァ-ンー－]+\z/,
      message: "全角のカタカナで入力して下さい"
    }

  validates :phone_number,      presence: true,
    format: {
      with: /\A\d{10}\z|\A\d{11}\z/,
      message: "ハイフン無しの半角数字のみで入力してください"
    }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,             presence: true, uniqueness: true,
    format: { 
      with: VALID_EMAIL_REGEX, 
      message: "記入内容を確認して下さい。"
    }

  validates :password,          presence: true,
    length: {
      in: 6..20,
      message: "6〜20文字までのパスワードを入力してください"
    },
    on: :create

  validates :post_code,         presence: true,
    format: {
      with: /\A\d{7}\z/,
      message: "ハイフン無しの半角数字のみで入力してください"
    }

  validates :address,           presence: true
  validates :member_status,     presence: true,
    format: {
      with: /\A\d\z/, # 0 => 入会、1 => 退会済み、2 => 強制退会
      message: "半角数字で入力して下さい。"
    }

  # Validation on update
  validates :password,
    length: { in: 6..20,
              message: "6〜20文字までのパスワードを入力してください" },
                                on: :update,
                                allow_blank: true

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
     params.delete(:password)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  # Association
  has_many :cart_items
  has_many :addresses # address belongs_to user
  has_many :orders # order belongs_to user
  has_many :item_reviews
  has_many :items, through: :item_reviews
end
