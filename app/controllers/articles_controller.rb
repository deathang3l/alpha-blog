class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  private

  def set_article
    @mArticle = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end

  public

  def show
  end

  def index
    @mArticles = Article.all
  end

  def new
    @mArticle = Article.new
  end

  def create
    @mArticle = Article.new(article_params)
    if @mArticle.save then
      flash[:notice] = "(V) Article was created successfully."
      redirect_to @mArticle
    else
      flash[:notice] = "(X) #{@mArticle.errors.join('|')}"
      render 'new'
    end
  end

  def edit
  end

  def update
    @mArticle = Article.find(params[:id])
    if @mArticle.update(article_params) then
      flash[:notice] = "(V) Article was updated successfully."
      redirect_to @mArticle
    else
      flash[:notice] = "(X) #{@mArticle.errors.join('|')}"
      render 'edit'
    end
  end

  def destroy
    @mArticle.destroy
    redirect_to article_path
  end

end
