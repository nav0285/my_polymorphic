class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
  	@comment = Comment.new(params[:comment])
    if current_user
   		if @comment.save
    		redirect_to @comment.commentable
    	else
    		render action: "new"
    	end
    else
    	flash[:error] = 'Please Log In'
    	redirect_to @comment.commentable
    end	
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  	redirect_to comments_url 
  end
end
