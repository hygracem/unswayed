class Reporter < ApplicationRecord
  validates :name, presence: true
  validates :media, presence: true
  has_many :articles
end
