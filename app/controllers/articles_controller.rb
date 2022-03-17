class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  private

  def set_article
    @mArticle = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end

  def require_same_user
    if current_user != @mArticle.user
      flash[:alert] = "You can only edit or delete your own articles"
      redirect_to @mArticle
    end
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
    @mArticle.user = current_user
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
