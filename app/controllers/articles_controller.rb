class ArticlesController < ApplicationController
  def index
    @articles = Article.all
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
