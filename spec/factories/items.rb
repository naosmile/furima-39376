FactoryBot.define do
  factory :item do
    goods              { '名前' }
    explain            { '説明' }
    category_id        { 2 }
    situation_id       { 2 }
    shipping_charge_id { 2 }
    prefecture_id      { 2 }
    number_of_date_id  { 2 }
    price              { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
