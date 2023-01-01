require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '手土産の投稿' do
    context '手土産投稿ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '購入できる都道府県が「---」以外であれば登録できる' do
        @item. buy_prefecture_id = 1
        expect(@item).to be_valid
      end
      it '10名あたりの予算が「---」以外であれば登録できる' do
        @item.price_id = 1
        expect(@item).to be_valid
      end
      it '季節（時季）が「---」以外であれば登録できる' do
        @item.season_id = 1
        expect(@item).to be_valid
      end
    end

    context '投稿ができないとき' do
      it 'ユーザー登録している人でないと投稿できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '購入できる都道府県の情報が「---」だと出品できない' do
        @item.buy_prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Buy prefecture must be other than 0')
      end
      it '購入できる都道府県の情報が空欄だと出品できない' do
        @item.buy_prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Buy prefecture can't be blank", 'Buy prefecture is not a number')
      end
      it '10名あたりの予算の情報が「---」だと出品できない' do
        @item.price_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be other than 0')
      end
      it '10名あたりの予算の情報が空欄だと出品できない' do
        @item.price_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '季節（時季）の情報が「---」だと出品できない' do
        @item.season_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Season must be other than 0')
      end
      it '季節（時季）の情報が空欄だと出品できない' do
        @item.season_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Season can't be blank", 'Season is not a number')
      end
    end
  end
end