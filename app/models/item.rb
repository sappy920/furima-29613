class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :prefecture, :delivery_fee, :delivery_date

  validates :instruction, presence: true, if: :was_attached?
  def was_attached?
    self.image.attached?
  end


  with_options presence: true do
    validates :name, :instruction
    validates :category, :status_id, :delivery_date_id, :delivery_fee_id, numericality: { other_than: 0}
    validates :price, format: {with: /\A[0-9]+\z/},
    numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

   
  end

 
end