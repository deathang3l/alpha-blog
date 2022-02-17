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
    if @mArticle.save then
      redirect_to @mArticle
    else
      render html: helpers.tag.strong("Failed, remember about content constraints")
    end
  end
end
