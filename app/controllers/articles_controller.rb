class ArticlesController < ApplicationController
  def show
    @mArticle = Article.find(params[:id])
  end

  def index
    @mArticles = Article.all
  end

  def new

  end

  def create

  end
end
