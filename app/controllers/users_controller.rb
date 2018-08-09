# frozen_string_literal: true

class UsersController < ApplicationController
  # used for User.find(params[:id])
  # maybe fix this back to normal [:array] if it don't work
  before_action :set_user, only: %i[edit update show]
  before_action :require_same_user, only: %i[edit update]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # signs the user in after signing up
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Blogs on Rails, #{@user.username}"
      redirect_to user_path(@user)
    else
      # figure out why this route changes to /users
      render 'new'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit; end

  def update
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

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    unless logged_in? && current_user != @user
      flash[:danger] = 'You can only edit your own account'
      redirect_to root_path
    end
  end
end
