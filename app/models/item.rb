class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  validates :product_description, presence: true
  validates :product_name, presence: true
  validates :product_status_id, presence: true
  validates :load_id, presence: true
  validates :selling_price, presence: true
  validates :ship_id, presence: true
  validates :prefecture_id, presence: true
  validates :category_id, presence: true
  has_one_attached :image


  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  validates :age, numericality: { in: 300..9,999,999 }

  validates :product_status_id, numericality: { other_than: 0 , message: "can't be blank"}

  validates :load_id, numericality: { other_than: 0 , message: "can't be blank"}

  validates :ship_id, numericality: { other_than: 0 , message: "can't be blank"}

  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}

  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}

end