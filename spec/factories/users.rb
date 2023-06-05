FactoryBot.define do
  factory :user do
    nickname                   {Faker::Name.initials(number: 2)}
    email                      {Faker::Internet.free_email}
    password                   {Faker::Internet.password(min_length: 6)}
    password_confirmation      {password}
    last_name_full_width       {"お名前（全角）"}
    first_name_full_width      {"お名前（全角）"}
    last_name_kana_full_width  {"お名前カナ（全角）"}
    first_name_kana_full_width {"お名前カナ（全角）"}
    date_of_birth              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end