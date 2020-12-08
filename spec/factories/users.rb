FactoryBot.define do
  factory :user do
    nickname {"hide"}
    email {"hoge@hoge"}
    password {"s12345"}
    password_confirmation {"s12345"}
    second_name {"田中"}
    first_name {"太郎"}
    second_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birthday {"1930-01-01"}
  end
end