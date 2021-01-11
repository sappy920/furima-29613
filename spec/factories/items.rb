FactoryBot.define do
  factory :item do
    name {"本"}
    instruction {"新品の本です"}
    category_id {1}
    status_id {1}
    delivery_fee_id {1}
    prefecture_id {1}
    delivery_date_id {1}
    price {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
 
  end


end



