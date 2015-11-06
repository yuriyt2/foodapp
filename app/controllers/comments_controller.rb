class CommentsController < ApplicationController

  def new
  end

  def show
    @comment = Comment.new
    @comment.food_id = @food_id
  end

end
