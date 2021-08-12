FactoryBot.define do
  factory :buy_item do
    name {"あああ"}
    experience {"あああ"}
    category_id {2}
    condition_id {2}
    delivery_fee_id {2}
    delivery_day_id {2}
    prefecture_id {2}
    price {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |buy_item|
       buy_item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
