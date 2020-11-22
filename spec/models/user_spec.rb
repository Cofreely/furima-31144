require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '必須項目が正しく記入できていれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが@を含まないと登録できないこと' do
      @user.email = 'TechCamp.com'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'A2345b'
      @user.password_confirmation = 'A2345b'
      expect(@user).to be_valid
    end

    it 'passwordが英語のみでは登録できないこと' do
      @user.password = 'English'
      @user.password_confirmation = 'English'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it 'passwordが全角では登録できないこと' do
      @user.password = 'Ｆｕ１１Ｗｉｄｔｈ'
      @user.password_confirmation = 'Ｆｕ１１Ｗｉｄｔｈ'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.last_name = '３４Ｇｉ'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.last_name = '７Ｍａｅ'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "last_name_kanaが漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.last_name_kana = '３４Ｇｉ'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaが漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.first_name_kana = '７Ｍａｅ'
      @user.valid?
      expect(@user.errors.full_messages)
    end

    it 'birth_dateが空では登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end