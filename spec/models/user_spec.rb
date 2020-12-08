require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "email一意性チェック" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください")
    end

    it "emailは@を含むこと" do
      @user.email = "email.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "12345q"
      @user.password_confirmation = "12345q"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12q34"
      @user.password_confirmation = "12q34"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "12q3456"
      @user.password_confirmation = "123q456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "second_nameが空では登録できないこと" do
      @user.second_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "Second name can't be blank", "Second name は全角文字で入力してください")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "First name can't be blank", "First name は全角文字で入力してください")
    end
    
    it "ユーザー本名は、全角での入力が必須であること(苗字)" do
      @user.second_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "Second name は全角文字で入力してください")
    end

    it "ユーザー本名は、全角での入力が必須であること(名前)" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "First name は全角文字で入力してください")
    end

    it "ユーザー本名は、全角での入力が必須であること(名前)" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "First name は全角文字で入力してください")
    end

    it "second_name_kanaが空では登録できないこと" do
      @user.second_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "Second name kana can't be blank", "Second name kana は全角カタカナで入力してください")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "First name kana can't be blank", "First name kana は全角カタカナで入力してください")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(苗字)" do
      @user.second_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "Second name kana は全角カタカナで入力してください")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(名前)" do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は文字と数字の両方を含めて設定してください", "First name kana は全角カタカナで入力してください")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end