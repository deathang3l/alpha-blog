class ArticlesController < ApplicationController
  define show
    @mArticle = Article.find(params[:id])
  end
end
