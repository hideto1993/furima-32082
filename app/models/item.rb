class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden_fee
  belongs_to :prefecture
  belongs_to :shipping_date_and_time
  has_one_attached :image

  validates :title, :explanation, :image, presence: true

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_fee_id
    validates :prefecture_id
    validates :shipping_date_and_time_id
  end
end
