class SearchesController < ApplicationController
  before_action :set_user_session, only: [:index]

  def index
    @latest_articles = Article.last(3)
  end

  def search
    @results = params[:query].empty? ? [] : Article.search(params[:query])
    render :search
  end
end
