FactoryBot.define do
  factory :item do
    product_description   { '商品の説明' }
    product_name          { '商品名' }
    product_status_id     { '6' }
    load_id               { '1' }
    selling_price         { '33333' }
    ship_id               { '2' }
    prefecture_id         { '5' }
    category_id           { '5' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
