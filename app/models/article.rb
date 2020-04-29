class Article < ApplicationRecord
  validates :title, presence: true
  validates :country, presence: true
  has_many :users_articles
  has_many :users, through: :users_articles
  belongs_to :reporter
end
