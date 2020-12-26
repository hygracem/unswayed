require 'open-uri'
require 'rest-client'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # @articles = policy_scope(fetch_keyword_articles('coronavirus').select { |x| x["publishedAt"].partition("T").first.between?((Date.today - 60).to_s, Date.today.to_s) }, policy_scope_class: ArticlesPolicy::Scope)

    @articles = Article.all
  end

  def dashboard
  end
end
