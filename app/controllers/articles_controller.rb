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
    @mArticle = Article.new(params.require(:article).permit(:title, :description, :body))
    @mArticle.save
  end
end
