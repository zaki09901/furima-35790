class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :title, :text, presence: true

  validates :genre_id, numericality: { other_than: 0 , message: "can't be blank"}
end