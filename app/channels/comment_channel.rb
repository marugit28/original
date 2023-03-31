class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @item = Item.find(params[:item_id]) # 追記
    stream_for @item # 追記
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
