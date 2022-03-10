class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
  end

  def update
    if @mUser.update(user_params) then
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @mUser
    else
      render 'edit'
    end
  end  

  def show
    @mArticles = @mUser.articles
  end

  def index
    @mUsers = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @mUser = User.find(params[:id])
  end

end
