require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '正常に登録できる時' do
      it 'itemnameとexplanationとimageとcategory_idとstate_idとregion_idとshopping_fee_idとcheduled_delivery_idとprice商品出品ができる' do
        expect(@item).to be_valid
      end
      it '価格が半角数字であれば登録できる' do
        @item.price = '600'
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it 'itemnameが空では登録できない' do
        @item.itemname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Itemname can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'categoryに「----」が選択されている場合は登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'degreeに「----」が選択されている場合は登録できない' do
        @item.degree_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Degree can't be blank"
      end
      it 'regionに「----」が選択されている場合は登録できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end
      it 'atmosphere_idに「----」が選択されている場合は登録できない' do
        @item.atmosphere_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Atmosphere can't be blank"
      end
      it 'scheduled_deliveryに「----」が選択されている場合は登録できない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceは300円未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが10000000より多い時は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceは全角では登録できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが小数点を含んでいると登録できない' do
        @item.price = '1000.45'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
