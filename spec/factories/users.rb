FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    family_name {"山田"}
    family_name_kana {"ヤマダ"}
    first_name {"太郎"}
    first_name_kana {"タロウ"}
    birthday{Faker::Date.birthday}
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end