require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context "商品出品がうまくいくとき" do
      it "正常型" do
        expect(@item).to be_valid
      end
    end
    context "商品出品がうまくいかないとき" do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "商品名が必須であること" do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品の説明が必須であること" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーの情報が必須であること" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "カテゴリーの情報が1以外でないと登録できないこと" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報が必須であること" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "商品の状態の情報が1以外でないと登録できないこと" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.burden_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden fee is not a number")
      end
      it "配送料の負担の情報が1以外でないと登録できないこと" do
        @item.burden_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden fee must be other than 1")
      end
      it "発送元の地域についての情報が必須であること" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "発送元の地域の情報が1以外でないと登録できないこと" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数についての情報が必須であること" do
        @item.shipping_date_and_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date and time is not a number")
      end
      it "発送までの日数の情報が1以外でないと登録できないこと" do
        @item.shipping_date_and_time_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date and time must be other than 1")
      end
      it "価格についての情報が必須であること" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "299円以下では登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "10,000,000以上では登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
