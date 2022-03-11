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
    @mArticles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @mArticle = Article.new
  end

  def create
    @mArticle = Article.new(article_params)
    @mArticle.user = User.first
    if @mArticle.save then
      flash[:notice] = "Article was created successfully."
      redirect_to @mArticle
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @mArticle = Article.find(params[:id])
    
    if @mArticle.update(article_params) then
      flash[:notice] = "Article was updated successfully."
      redirect_to @mArticle
    else
      render 'edit'
    end
  end

  def destroy
    @mArticle.destroy
    redirect_to article_path
  end

end
