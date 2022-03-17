class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @mUser = User.new
  end

  def create
    @mUser = User.new(user_params)
    if @mUser.save then
      flash[:notice] = "Welcome #{@mUser.username}, you have successfully signed up"
      session[:user_id] = @mUser.id
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
    @mArticles = @mUser.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @mUsers = User.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    
    @mUser.destroy
    session[:user_id] = nil
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @mUser = User.find(params[:id])
  end

  def require_same_user
    if current_user != @mUser
      flash[:alert] = "You can only edit your own account"
      redirect_to @mUser
    end
  end

end
