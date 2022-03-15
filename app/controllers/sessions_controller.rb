class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(email: params[:session][:email].downcase)
    if user && use.authenticate(params[:session][:password]) then
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
  end
end
