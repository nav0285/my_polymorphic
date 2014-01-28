class ArticlesController < ApplicationController

	before_filter :self_load, :only=>[:show, :edit, :update, :destroy]
	
  def index
    @articles = Article.all
  end

  def show	
    @comments = @article.comments
    @comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
    	redirect_to @article, notice: 'Article was successfully created.' 
    else
      render action: "new"
    end
  end

  def update
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Article was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url 
  end
  
private

	def self_load
		@article = Article.find(params[:id])  
	end
	
end
