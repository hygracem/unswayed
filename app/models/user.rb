class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_articles
  has_many :articles, through: :users_articles
  validates :nickname, presence: true
  validates :email, presence: true
end
