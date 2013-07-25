class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
    	redirect_to @comment.commentable
    else
    	render action: "new"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  	redirect_to comments_url 
  end
end
