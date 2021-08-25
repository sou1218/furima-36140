FactoryBot.define do
  factory :buy_address do
    postal_code {"123-4567"}
    prefecture_id {2}
    city {"横浜市緑区"}
    house_number {"青山1-1-1"}
    phone_number {"1234567890"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
