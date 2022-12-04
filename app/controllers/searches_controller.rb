class SearchesController < ApplicationController
  before_action :set_user_session
  before_action :set_search_session_id, only: [:index]
  before_action :record_trending_search, only: [:search]

  def index
    @latest_articles = Article.last(3)
    @trends = Trend.where(user_id: @current_user).order(query_count: :desc).limit(5)
  end

  def search
    @results = params[:query].empty? ? [] : Article.search(params[:query])
    render :search
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def record_trending_search
    return unless session[:search_id] != params[:search_session_id] && !params[:query].empty?

    last_trend = Trend.find_or_create_by(user_id: @current_user, query: params[:query])
    last_trend.increment_query_count
    session[:search_id] = params[:search_session_id]
  end

  def set_search_session_id
    session[:search_id] = SecureRandom.uuid
  end
end
