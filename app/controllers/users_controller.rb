# frozen_string_literal: true

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

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Your profile was updated'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    # whitelist
    params.require(:user).permit(:username, :email, :password)
  end
end
