class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id]) #追加

    if @comment.save
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user } #追加
    end
  end

  private
  def comment_params
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user } #追加
  end
end
