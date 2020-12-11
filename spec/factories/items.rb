FactoryBot.define do
  factory :item do
    title {"hoge"}
    category_id {"2"}
    status_id {"2"}
    price {"300"}
    burden_fee_id {"2"}
    prefecture_id {"2"}
    shipping_date_and_time_id {"2"}
    explanation {"hoge"}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
