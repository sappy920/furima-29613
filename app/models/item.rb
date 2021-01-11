class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :prefecture, :delivery_fee, :delivery_date

 

 

  with_options presence: true do
    validates :name, :instruction, :image
    validates :category_id, :status_id, :delivery_date_id, :delivery_fee_id, :prefecture_id, numericality: { other_than: 0}
    validates :price, format: {with: /\A[0-9]+\z/}, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end




 
end