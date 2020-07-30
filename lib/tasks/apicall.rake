require 'rest-client'

namespace :fetch do
  task :keyword => :environment do
    filter_date('coronavirus')
    puts "Keyword articles fetched and saved"
  end

  def fetch_keyword_articles(keyword)
    header = {
      Authorization: "Bearer #{ENV['NEWS_API_KEY']}"
    }
    articles_response = RestClient.get("http://newsapi.org/v2/everything?q=#{keyword}", header)
    JSON.parse(articles_response)["articles"]
  end

  def filter_date(keyword)
    @articles = fetch_keyword_articles(keyword).select { |x| x["publishedAt"].partition("T").first.between?((Date.today - 60).to_s, Date.today.to_s) }
    puts @articles.first["source"]
    #need to update model to save
    @articles.save
  end
end
