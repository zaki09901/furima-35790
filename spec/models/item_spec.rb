require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end



describe '出品機能' do
  context '出品できるとき' do
    it 'product_description、product_name、product_status_id、load_id、selling_price、ship_id、prefecture_id、category_idが存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it 'product_nameが40文字以下であれば登録できる' do
      @item.product_name = 'テスト商品名'
      @item.product_name = 'テスト商品名'
      expect(@item).to be_valid
    end

    it 'product_descriptionが1,000文字以下であれば登録できる' do
      @item.product_description = 'テスト商品の説明'
      @item.product_description = 'テスト商品の説明'
      expect(@item).to be_valid
    end

  end

  context '出品出来ない時' do
    it 'product_descriptionが空では登録できない' do
      @item.product_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
      
    end

    it 'product_nameが空では登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it 'product_status_idが空では登録できない' do
      @item.product_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status can't be blank")
    end

    it 'load_idが空では登録できない' do
      @item.load_id  = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Load can't be blank")
    end

    it 'selling_priceが空では登録できない' do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end

    it 'ship_idが空では登録できない' do
      @item.ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship can't be blank")
    end

    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
   end
  end
end  