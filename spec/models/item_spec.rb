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

    it '商品の状態に「---」が選択されている場合は出品できない
    ' do
      @item.product_status_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status can't be blank")
    end

    it '配送料の負担に「---」が選択されている場合は出品できない
    ' do
      @item.load_id  = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Load can't be blank")
    end

    it '価格が空では出品できない' do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end

    it '発送までの日数に「---」が選択されている場合は出品できない
    ' do
      @item.ship_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship can't be blank")
    end

    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.prefecture_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'カテゴリーに「---」が選択されている場合は出品できない
    ' do
      @item.category_id = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end


    it 'ユーザーが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.selling_price = '33ss'
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not a number")
    end

    it '価格が300円未満では出品できない' do
      @item.selling_price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
    end


    it '画像が空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end







   end
  end
end  