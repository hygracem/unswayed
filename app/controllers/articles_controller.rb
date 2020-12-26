require 'open-uri'
require 'rest-client'
require 'selenium-webdriver'

class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def scrape_nbcnews_articles_by_keyword(keyword)
    articles = []

    Selenium::WebDriver::Chrome.driver_path = `which chromedriver-helper`.chomp # 설치한 크롬 드라이버 사용

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-gpu')
    options.add_argument('--headless')

    # 셀레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    browser = Selenium::WebDriver.for :chrome, options: options

    # 검색 페이지 이동
    browser.navigate().to "https://www.nbcnews.com/search/?q=#{keyword}"

    # TODO: 페이지 별로 목록을 가져오려면 아래 부분 구현 필요
    # 페이징 목록 가져오기
    # pages = browser.find_elements(css: "div.gsc-cursor > div.gsc-cursor-page")
    # pages.each do |page|
    #   page.click
    #   sleep(2)
    # end

    # 아티클 목록 가져오기
    article_list = browser.find_elements(css: "div.gsc-result")

    article_list.each do |article_link|
      # 아티클 링크에서 타이틀, 주소 가져오기
      article = Hash.new
      article["title"] = article_link.find_element(css: "a.gs-title").text
      article["thumbnail"] = article_link.find_element(css: "img.gs-image").attribute("src")
      article["url"] = article_link.find_element(css: "a.gs-title").attribute("href")
      articles << article
    end

    articles
  end

  def scrape_politico_articles_by_keyword(keyword)
    articles = []
    # TODO: 스크래핑 구현하기
    articles
  end

  def index
    keyword = params[:keyword]
    articles = []
    articles += scrape_nbcnews_articles_by_keyword(keyword)
    articles += scrape_politico_articles_by_keyword(keyword)

    @articles = policy_scope(articles, policy_scope_class: ArticlesPolicy::Scope)
  end

  # def fetch_keyword_articles(keyword)
  #   # header = {
  #   #   Authorization: "Bearer #{ENV['NEWS_API_KEY']}"
  #   # }
  #   # articles_response = RestClient.get("http://newsapi.org/v2/everything?q=#{keyword}", header)
  #   # JSON.parse(articles_response)["articles"]

  #   # html = HTTParty.get("https://www.nbcnews.com/search/?q=#{keyword}")
  #   html = HTTParty.get("https://www.politico.com/latest-news-updates/coronavirus")

  #   logger.info(html)

  #   response = Nokogiri::HTML(html)
  #   articles = response.css("a").text
  # # when(:publishedAt => Time.zone.today - 60..Time.zone.today)
  # end

  # def index
  #   # @articles = policy_scope(Article.all, policy_scope_class: ArticlesPolicy::Scope)
  #   # authorize @articles
  #   # @test = policy_scope(fetch_keyword_articles('coronavirus'), policy_scope_class: ArticlesPolicy::Scope)
  #   # @articles = policy_scope(fetch_keyword_articles('coronavirus').select { |x| x["publishedAt"].partition("T").first.between?((Date.today - 60).to_s, Date.today.to_s) }, policy_scope_class: ArticlesPolicy::Scope)
  #   @articles = policy_scope(fetch_keyword_articles('coronavirus'), policy_scope_class: ArticlesPolicy::Scope)
  #   # had to force the policy
  #   # need to save it
  #   # where(date: today.beginning_of_day..today.end_of_day)
  # end

  # def scrape
  #   # html = open("https://en.wikipedia.org/wiki/Douglas_Adams")
  #   html = HTTParty.get("https://www.nbcnews.com/search/?q=corona")
  #   response = Nokogiri::HTML(html)
  #   # response -> list
  # end

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


