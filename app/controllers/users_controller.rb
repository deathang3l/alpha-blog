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

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
