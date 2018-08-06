# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    # named plural because it finds all
    @articles = Article.all
  end
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was saved'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # find an article by params id to update
    @article = Article.find(params[:id])
    # use the article_params method for validation
    if @article.update(article_params)
      flash[:notice] = 'Article was updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private

  def article_params
    # top level key article
    params.require(:article).permit(:title, :description)
  end
end
