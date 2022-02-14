class ArticlesController < ApplicationController
  def show
    @mArticle = Article.find(params[:id])
  end
end
