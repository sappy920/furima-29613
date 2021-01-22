FactoryBot.define do
  factory :item_order do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address_number { '1-1' }
    apartment { '東京ハイツ' }
    phone_number {'09012345678'}

    
  end
end
