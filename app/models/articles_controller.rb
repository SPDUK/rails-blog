# frozen_string_literal: true

class ArticlesController < ApplicationController
  # do this before doing any of the CRUD actions
  # sets article to be the current article clicked, on how? magic
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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

  def show; end

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

  def edit; end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    # top level key article
    params.require(:article).permit(:title, :description)
  end
end
