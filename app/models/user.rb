class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 with_options presence: true do
        validates :name
        validates :email, uniqueness: true, format: {with: /\A\S+@\S+\.\S+\z/, message: "は＠を含んでください"}
        validates :birthday
     end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, {with: PASSWORD_REGEX, message: "は半角英数字で入力してください" }
       
  with_options presence: true do
        validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください"}
        validates :last_name,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください"}
        validates :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
        validates :kana_last_name , format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
  end

end
