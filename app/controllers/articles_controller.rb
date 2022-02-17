class ArticlesController < ApplicationController
  def show
    @mArticle = Article.find(params[:id])
  end

  def index
    @mArticles = Article.all
  end

  def new
    @mArticle = Article.new
  end

  def create
    @mArticle = Article.new(params.require(:article).permit(:title, :description, :body))
    if @mArticle.save then
      flash[:notice] = "Article was created successfully."
      redirect_to @mArticle
    else
      render 'new'
    end
  end
end
