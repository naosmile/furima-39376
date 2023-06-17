FactoryBot.define do
  factory :purchase_address do
    postal_code   {"157-0076"}
    prefecture_id {2}
    city          {"北区"}
    house_number  {"青山1-1-1"}
    building_name {"牧野ビル"}
    phone_number  {"09012190274"}
    purchase_id   {1}
    # token       {"tok_abcdefghijk00000000000000000"}

  end
end
 