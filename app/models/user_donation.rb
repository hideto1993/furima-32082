class UserDonation
  include ActiveModel::Model
  attr_accessor :prefecture_id, :municipalities, :address, :building_number, :postal_code, :phone_number, :user_id, :item_id, :token
  validates :token, presence: true

  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # 「住所」の電話番号に関するバリデーション
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: "ハイフン無しの11桁以内で入力してください" }
    # 「住所」の市町村に関するバリデーション
    validates :municipalities
    # 「住所」の番地に関するバリデーション
    validates :address
    # 「購入」のuser_idに関するバリデーション
    validates :user_id
    # 「購入」のitem_idに関するバリデーション
    validates :item_id
    
  end
  # 「住所」の都道府県に関するバリデーション
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    #取引の情報を保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, phone_number: phone_number, building_number: building_number, purchase_id: purchase.id)
  end
end