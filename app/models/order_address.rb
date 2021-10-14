class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

with_options presence: true do
validates :municipality
validates :address
validates :user_id
validates :item_id
validates :token
end

validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

validates  :postal_code,presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }

validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'を入力してください' }

def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, postal_code: postal_code, order_id: order.id)
end

end

# Input correctly