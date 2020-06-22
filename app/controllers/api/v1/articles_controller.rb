class Api::V1::ArticlesController < Api::V1::BaseController
  def index
    @articles = policy_scope(Article)
    # @articles = Article.all
  end
end
