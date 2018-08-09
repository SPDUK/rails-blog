# frozen_string_literal: true

class ArticlesController < ApplicationController
  # do this before doing any of the actions
  # sets article to be the current article clicked, on how? magic
  before_action :set_article, only: %i[edit update show destroy]
  # requires user to the be logged in
  before_action :require_user, except: %i[index show]
  # requires user to be the one that actually owns the article
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    # named plural because it finds all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = 'Article was saved'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show;
  end

  def update
    # use the article_params method for validation
    if @article.update(article_params)
      flash[:success] = 'Article was updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = 'Article was deleted'
    redirect_to articles_path
  end

  def edit;
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # top level key article
    params.require(:article).permit(:title, :description)
  end

  def require_user
    unless logged_in?
      flash[:danger] = 'You must be logged in to perform that action'
      redirect_to root_path
    end
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin
      flash[:danger] = 'You can only edit or delete your own article'
      redirect_to root_path
    end
  end
end
