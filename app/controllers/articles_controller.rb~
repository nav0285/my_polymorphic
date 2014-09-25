class ArticlesController < ApplicationController

	before_filter :self_load, :only=>[:show, :edit, :update, :destroy]
	
	before_filter :require_login, :only=>[:edit, :update, :destroy]
	
	before_filter :authorised_user, :only => [:edit, :update, :destroy]
	
  def index
    @articles = Article.all
  end

  def show
    @comments = @article.comments
    @comment = @article.comments.build
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.new(params[:article])
    if @article.save
    	flash[:success] = 'Article was successfully created.'
    	redirect_to @article 
    else
      render action: "new"
    end
  end

  def update
    if @article.update_attributes(params[:article])
      flash[:success] = 'Article was successfully updated.'
      redirect_to @article 
    else
      render action: "edit" 
    end
  end

  def destroy
    @article.destroy
    @articles = Article.all
    respond_to do |format|
    	format.html {redirect_to articles_url}
    	format.js {}
    end	 
  end

private

	def self_load
		@article = Article.find(params[:id])
	end

	def require_login
		redirect_to sign_in_path if !current_user			
	end

	def authorised_user
		if current_user.id != @article.user_id
  		 flash[:error] = 'You are not authorised'
  		redirect_to @article
  	end
	end	
	
end
