class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render # template: "index", prefixes: %w[articles application]
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to articles_url, notice: "Created article."
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to articles_url, notice: "Updated article."
    else
      render :edit
    end
  end
end
