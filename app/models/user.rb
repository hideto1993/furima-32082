class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  #password
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は文字と数字の両方を含めて設定してください'

  with_options presence: true do
    #birthday
    validates :birthday
    validates :nickname
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角文字で入力してください' } do
    validates :first_name
    validates :second_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角カタカナで入力してください' } do
    validates :first_name_kana
    validates :second_name_kana
  end
end