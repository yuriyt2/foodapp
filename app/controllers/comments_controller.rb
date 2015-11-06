class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.food_id = params[:food_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to food_path(@comment.food)
  end

  def show
    @comment = Comment.find(params[:id])

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to food_path(@comment.food)
  end


  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :food_id)
  end

end
