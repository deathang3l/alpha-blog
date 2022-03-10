class UsersController < ApplicationController
  def new
    @mUser = User.new
  end

  def create
    @mUser = User.new(user_params)
    if @mUser.save then
      flash[:notice] = "Welcome #{@mUser.username}, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @mUser = User.find(params[:id])
  end

  def update
    @mUser = User.find(params[:id])
    if @mUser.update(user_params) then
      flash[:notice] = "Your account information was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end  

  def show
    @mUser = User.find(param[:id])
    @mArticles = @mUser.articles
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
