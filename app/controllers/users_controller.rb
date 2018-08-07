class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to blogs on rails #{@user.username}"
      redirect_to articles_path
    else
      # figure out why this route changes to /users
      render 'new'
    end

  end

  private

  def user_params
    # whitelist
    params.require(:user).permit(:username, :email, :password)
  end
end