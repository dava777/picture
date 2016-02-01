class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You are now a user'
      sign_in @user
      redirect_to root_url
    else
      flash.now[:notice] = 'Invalid data'
      render 'new'
    end
  end

  def edit
    @user = User.find_by id: current_user
  end

  def update
    @user = User.find current_user
    if @user.update_attributes(editable_user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end


  def destroy
    User.find_by id: current_user.destroy
    sign_out
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def editable_user_params
      params.require(:user).permit(:email)
    end

end
