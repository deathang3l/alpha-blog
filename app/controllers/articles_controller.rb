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

  def edit
    @mArticle = Article.find(params[:id])
  end

  def update
    @mArticle = Article.find(params[:id])
    if @mArticle.update(params.require(:article).permit(:title, :description, :body)) then
      flash[:notice] = "Article was updated successfully."
      redirect_to @mArticle
    else
      redirect_to article_path
    end
  end

  def destroy
    @mArticle = Article.find(params[:id])
    @mArticle.destroy
    redirect_to article_path
  end

end
