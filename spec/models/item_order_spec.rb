require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入情報の保存' do
    before do  
      @item_owner = FactoryBot.create(:user)
      @item_buyer = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id:@item_owner.id)
      @item_order = FactoryBot.build(:item_order, user_id:@item_buyer.id, item_id:@item.id)
      sleep 1
    end

    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@item_order).to be_valid
    end

    it 'apartmentは空でも購入できること' do
      @item_order.apartment = nil
      expect(@item_order).to be_valid
    end

    it 'post_codeが空だと購入できないこと' do
      @item_order.post_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
      @item_order.post_code ='1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'prefectureを選択していないと購入できないこと' do
      @item_order.prefecture_id = 0
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと購入できないこと' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end

    it 'address_numberが空だと購入できないこと' do
      @item_order.address_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Address number can't be blank")
    end

    it 'phone_numberが空だと購入できないこと' do
      @item_order.phone_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上だと購入できないこと' do
      @item_order.phone_number = '123456789111'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is invalid.")
    end

    it "tokenが空では購入できないこと" do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end

    it "item_idがいなければ購入できないこと" do
      @item_order.item_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item can't be blank")
    end

    it "user_idがなければ購入できないこと" do
      @item_order.user_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("User can't be blank")
    end






  end



end
