FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    family_name {Faker::Name.last_name}
    family_name_kana {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    first_name_kana {Faker::Name.first_name}
    birthday{Faker::Date.birthday}
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end