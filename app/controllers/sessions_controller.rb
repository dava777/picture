class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by email: params[:email].downcase
    if user
      sign_in user
      redirect_to root_url
    else
      flash[:notice] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end


end
