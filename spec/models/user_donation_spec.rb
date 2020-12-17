require 'rails_helper'

RSpec.describe UserDonation, type: :model do
  describe '購入情報の保存' do
    before do
      @user_donation = FactoryBot.build(:user_donation)
    end
    
    context '住所登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_donation).to be_valid
      end
    end

    context '住所登録がうまくいかないとき' do
      it '郵便番号が空だと保存できないこと' do
        @user_donation.postal_code = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にはハイフンが必要' do
        @user_donation.postal_code = "1112222"
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと保存できないこと' do
        @user_donation.prefecture_id = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が1だと保存できないこと' do
        @user_donation.prefecture_id = 1
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @user_donation.municipalities = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @user_donation.address = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @user_donation.phone_number = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号はハイフンが不要であること' do
        @user_donation.phone_number = "111-2222-3333"
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Phone number ハイフン無しの11桁以内で入力してください")
      end
      it '電話番号は11桁以内であること' do
        @user_donation.phone_number = "123456789123456"
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Phone number ハイフン無しの11桁以内で入力してください")
      end
      it 'building_numberは空でも保存できること' do
        @user_donation.building_number = nil
        expect(@user_donation).to be_valid
      end
      it "tokenが空では登録できないこと" do
        @user_donation.token = nil
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end