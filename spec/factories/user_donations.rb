FactoryBot.define do
  factory :user_donation do
    postal_code {"123-4567"}
    prefecture_id {3}
    municipalities {"郡山市菜根"}
    address {"100番地"}
    building_number {"hoge"}
    phone_number {"09011112222"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
