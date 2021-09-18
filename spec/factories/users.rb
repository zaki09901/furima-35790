FactoryBot.define do
  factory :user do
    nickname              {"TARO"}
    email                 {"taro@co.jp"}
    password              {"123456abc"}
    password_confirmation {"123456abc"}
    last_name             {"太朗"}
    first_name            {"田中"}
    last_name_kana        {"タロウ"}
    first_name_kana       {"タナカ"}
    birthday              {"1996-01-01"}

  
  end
end