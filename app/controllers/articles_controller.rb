require 'open-uri'
require 'rest-client'
class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def fetch_keyword_articles(keyword)
    header = {
      Authorization: "Bearer #{ENV['NEWS_API_KEY']}"
    }
    articles_response = RestClient.get("http://newsapi.org/v2/everything?q=#{keyword}", header)
    JSON.parse(articles_response)["articles"].first["title"]
  end

  def index
    # @articles = policy_scope(Article.all, policy_scope_class: ArticlesPolicy::Scope)
    # authorize @articles
    @articles = policy_scope(fetch_keyword_articles('coronavirus'), policy_scope_class: ArticlesPolicy::Scope)
    # had to force the policy
    # need to save it
    # where(date: today.beginning_of_day..today.end_of_day)
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
  #   @article = Artist.new(article_params)
  #   @article.save
  #   redirect_to article_path(@article)
  end

  def update
    if @article.update(article_params)
      redirect_to dashboard_path
    end
  end

  def destroy
  end

  def article_params
    params.require(:article).permit(:title, :country)
  end
end
