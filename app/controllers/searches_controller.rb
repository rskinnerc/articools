class SearchesController < ApplicationController
  def index
    @latest_articles = Article.last(3)
  end

  def search
    @results = params[:query].empty? ? [] : Article.search(params[:query])
    render :search
  end
end
