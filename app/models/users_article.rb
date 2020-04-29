class UsersArticle < ApplicationRecord
  validates :fact_check_rating, presence: true
  belongs_to :user
  belongs_to :article
end
