class SearchesController < ApplicationController

  def index
    @latest_articles = Article.last(3)
  end
end
