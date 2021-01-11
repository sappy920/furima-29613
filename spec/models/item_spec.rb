require 'rails_helper' 
 RSpec.describe Item, type: :model do
    before do
       @item = FactoryBot.build(:item)
    end

  describe '商品情報の登録' do
    context '商品登録がうまくいくとき' do
      it "全ての項目が正しく入力されていれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品登録がうまくいかないとき' do
      it "nameが空では登録できない" do
         @item.name = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
      end

     it "instructionが空では登録できない" do
         @item.instruction = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Instruction can't be blank")
     end

     it "category_idが空では登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
     end

     it "status_idが空では登録できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
     end

     it "delivery_fee_idが空では登録できない" do
      @item.delivery_fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
     end

     it "prefecture_idが空では登録できない" do
      @item.prefecture_id = ""
      @item.valid?
     expect(@item.errors.full_messages).to include("Prefecture can't be blank")
     end

     it "delivery_date_idが空では登録できない" do
      @item.delivery_date_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
     end


      it "商品のカテゴリーを選択していないと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
     end

     it "商品の状態を選択していないと登録できない" do
         @item.status_id = 0
         @item.valid?
         expect(@item.errors.full_messages).to include("Status must be other than 0")
      end

      it "配送料の負担を選択していないと登録できない" do
         @item.delivery_fee_id = 0
         @item.valid?
         expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
       end

      it "配送元の地域を選択していないと登録できない" do
          @item.prefecture_id = 0
          @item.valid?
         expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
       end


      it "配送日までの日数を選択していないと登録できない" do
        @item.delivery_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 0")
      end


      it "商品価格が空では登録できない" do
         @item.price = ""
         @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
       end

  
      it "価格が￥300以上でないと登録できない" do
         @item.price= 299
         @item.valid?
         expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "価格が￥10000000以上では登録できない" do
        @item.price= 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
     end


      it "価格が全角では登録できない" do
          @item.price= "３００"
          @item.valid?
           expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "画像がなければ登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end