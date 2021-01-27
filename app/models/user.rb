class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  
 with_options presence: true do
        validates :name
        validates :email, uniqueness: true, format: {with: /\A\S+@\S+\.\S+\z/, message: "は＠を含んでください"}
        validates :birthday
     end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, {with: PASSWORD_REGEX, message: "は半角英数字で入力してください" }
       
  with_options presence: true , format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください"} do
        validates :family_name
        validates :last_name
  end

  with_options presence: true , format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"} do
        validates :kana_family_name
        validates :kana_last_name 
  end

end
