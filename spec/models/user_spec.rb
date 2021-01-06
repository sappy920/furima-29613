 require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passeordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上で英数字混合あれば登録できる" do
        @user.password ="a00000"
        @user.password_confirmation ="a00000"
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
     it "nicknameが空では登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが＠を含まないと登録できない" do
      @user.email = "test.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email は＠を含んでください")
    end
    

    
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
 



 
    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it "passwordが５文字以下であれば登録できないこと" do
      @user.password ="12345"
      @user.password_confirmation ="12345"
      @user.valid?
     expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end


   it "passwordとpassword_confirmationが不一致では登録できないこと" do
     @user.password = "a11111"
     @user.password_confirmation = "b11111"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

   it "passwordが半角数字のみの場合は登録できない" do
     @user.password = "123456"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください")
   end

   it "passwordが半角英字のみの場合は登録できない" do
    @user.password = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください")
  end

  it "passwordは全角では登録できないこと" do
    @user.password = "AAAAAA"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください")
  end



    it "family nameが空では登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "last nameが空では登録できない" do  
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "family nameが半角では登録できない" do
      @user.family_name = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name は全角で入力してください")
    end
    it "last nameが半角では登録できない" do
      @user.last_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください")
    end

    it"kana_family_nameは全角カタカナでないと登録できない" do
      @user.kana_family_name = "ﾀﾅｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name は全角カタカナで入力して下さい。")
    end

    it"kana_last_nameは全角カタカナでないと登録できない" do
      @user.kana_last_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name は全角カタカナで入力して下さい。")
    end

    it "生年月日が空では登録できない" do
      @user.birthday=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
 end
end