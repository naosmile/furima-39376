require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id, user_id: user.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存ができること' do
        expect(@purchase_address).to be_valid
      end

      it '建物名は空でも保存ができること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存ができないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみの正しい形式でないと保存ができないこと（良い例:123-4567 良くない例:1234567）' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県を選択していないと保存ができないこと' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
      end

      it '市区町村が空では保存ができないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存ができないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空では保存ができないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は、9桁以下では保存ができないこと（良い例:09012345678 良くない例:090-1234-5678)' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号は、12桁以上では保存ができないこと（良い例:09012345678 良くない例:090-1234-5678)' do
        @purchase_address.phone_number = '123456789234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号は、半角数値以外が含まれている場合、保存ができないこと（良い例:09012345678 良くない例:090-1234-5678)' do
        @purchase_address.phone_number = '１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end

      it 'tokenが空では保存ができないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では保存ができないこと' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存ができないこと' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
