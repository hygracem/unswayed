class Article < ApplicationRecord
  validates :title, presence: true
  validates :country, presence: true
  has_many :users_articles
  has_many :users, through: :users_articles
  belongs_to :reporter

  def retrieve_artist_image
    # require "open-uri"
    # require "json"
    # require "news-api"
    # News.authenticate(ENV["NEWS_API_KEY"])
    # news_corona = newsapi.get_top_headlines(q: 'corona', language: 'en', country: 'us')
    # artist_info = RSpotify::Artist.search(artist)
    # artist_image_url = artist_info.first.images.first["url"]
    # file = URI.open(artist_image_url)
    # photo.attach(io: file, filename: "#{artist}.png", content_type: 'image/png')
  end
end
