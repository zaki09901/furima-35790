class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :product_status
  belongs_to :load
  belongs_to :ship
  belongs_to :prefecture
  belongs_to :category

  validates :product_description, presence: true
  validates :product_name, presence: true
  validates :product_status_id, presence: true
  validates :load_id, presence: true
  validates :selling_price, presence: true
  validates :ship_id, presence: true
  validates :prefecture_id, presence: true
  validates :category_id, presence: true
  has_one_attached :image
  validates :image, presence: true

  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :product_status_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :load_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :ship_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
end
