class ItemOrder 
include ActiveModel::Model
  attr_accessor :token,:post_code, :prefecture_id, :city, :address_number, :apartment, :phone_number, :user_id, :item_id

  

  with_options presence: true do
    #validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } 
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, :address_number
    validates :phone_number, format: {with: /\A\d{11}\z/ , message: "is invalid."}

  
  end


  def save
    purchase=Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address_number: address_number, phone_number: phone_number, apartment: apartment, purchase_id: purchase.id)
  end
end
