FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    prefecture_id                        {5}
    municipality                         {'横浜市'}
    address                              {'青山1-1-1'}
    phone_number                         {'09012345678'}
    postal_code                          {'123-4567'}
    building_name                        {'青山'}
  end
end