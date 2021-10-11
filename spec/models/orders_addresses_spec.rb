require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1

    end

  context '購入できる時' do
    it "prefecture_id,municipality,address,phone_number,postal_code,tokenが存在すれば購入できる" do
      expect(@order_address).to be_valid
    end
  end



  it 'building_nameが空でも登録できる' do
    @order_address.building_name = ''
    expect(@order_address).to be_valid
  end





  context '購入出来ない時' do
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "prefecture_idが「---」では登録できないこと" do
      @order_address.prefecture_id = '0'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "municipalityが空では保存ができないこと" do
      @order_address.municipality = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it "addressが空では保存ができないこと" do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では保存ができないこと" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number を入力してください")
    end

    it "postal_codeが空では保存ができないこと" do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code を入力してください")
    end

    it "postal_codeが半角ハイフンを含む形でなければ購入できない" do
      @order_address.postal_code = '12304567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code を入力してください")
    end

    it "phone_numberが電話番号が9桁以下では購入できない" do
      @order_address.phone_number = '1234567890'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number を入力してください")
    end

    it "phone_numberが電話番号が12桁以上では購入できない" do
      @order_address.phone_number = '123456789012345'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number を入力してください")
    end

    it "phone_numberが電話番号に半角数字以外が含まれている場合は購入できない（※半角数字以外が一文字でも含まれていれば良い）" do
      @order_address.phone_number = '12345678901５2345'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number を入力してください")
    end

    it 'ユーザーが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it 'itemが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end







   end
  end
end