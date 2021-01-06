FactoryBot.define do
  factory :user do
    name                  {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"田中"}
    last_name             {"太朗"}
    kana_family_name      {"タナカ"}
    kana_last_name        {"タロウ"}
    birthday              {"2000-01-01"}



  end
end
