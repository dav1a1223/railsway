class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
    @current_day = nil
  end
end
