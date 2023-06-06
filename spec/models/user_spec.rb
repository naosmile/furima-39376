require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do

      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'a'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password 半角英数字で入力して下さい")
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字で入力して下さい")
      end

      it 'passwordが全角だと登録できない' do
        @user.password = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字で入力して下さい")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_name_full_widthが空では登録できない' do
        @user.last_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name full width can't be blank")
      end

      it 'last_name_full_widthに半角文字が含まれている場合は登録できない' do
        @user.last_name_full_width = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name full width 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
    
      it 'first_name_full_widthが空では登録できない' do
        @user.first_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full width 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end

      it 'first_name_full_widthに半角文字が含まれている場合は登録できない' do
        @user.first_name_full_width = 'a' 
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name full width 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end

      it 'last_name_kana_full_widthが空では登録できない' do
        @user.last_name_kana_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana full width 全角カタカナで入力して下さい")
      end

      it 'last_name_kana_full_widthにカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
        @user.last_name_kana_full_width = 'あ' 
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana full width 全角カタカナで入力して下さい")  
      end

      it 'first_name_kana_full_widthが空では登録できない' do
        @user.first_name_kana_full_width = ''  
        @user.valid?  
        expect(@user.errors.full_messages).to include("First name kana full width 全角カタカナで入力して下さい") 
      end

      it 'first_name_kana_full_widthにカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
        @user.first_name_kana_full_width = 'あ' 
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana full width 全角カタカナで入力して下さい") 
      end

      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = '' #わざと登録できない値を入れる
        @user.valid? #登録できないことを確かめる
        expect(@user.errors.full_messages).to include("Date of birth can't be blank") #登録できない場合に出てくるエラー文を書く
      end
    end
  end
end
