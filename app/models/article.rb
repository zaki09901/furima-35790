class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :title, :text, presence: true
  validates :title, :text, presence: true
  validates :title, :text, presence: true
  validates :title, :text, presence: true
  validates :title, :text, presence: true
  validates :title, :text, presence: true
  validates :title, :text, presence: true
  validates :title, :text, presence: true

end
