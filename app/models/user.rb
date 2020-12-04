class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  FORMAT_ZENKAKU = /\A[ぁ-んァ-ン一-龥]/.freeze
  FORMAT_KANA = /\A[ァ-ヶ一-]+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  #password
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は文字と数字の両方を含めて設定してください'

  with_options presence: true do
    #nickname
    validates :nickname
    #second_name
    validates :second_name, format: { with: FORMAT_ZENKAKU, message: 'は全角文字で入力してください' }
    #first_name
    validates :first_name, format: { with: FORMAT_ZENKAKU, message: 'は全角文字で入力してください' }
    #second_name_kana
    validates :second_name_kana, format: { with: FORMAT_KANA, message: 'は全角カタカナで入力してください' }
    #first_name_kana
    validates :first_name_kana, format: { with: FORMAT_KANA, message: 'は全角カタカナで入力してください' }
    #birthday
    validates :birthday
  end
end
