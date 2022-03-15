class SessionsController < ApplicationController
  def new
  end

  def create
    input = params[:session][:email]
    if input.include? '@' then
      user = User.find(email: input.downcase)
    else
      user = User.find(username: input)
    end
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
