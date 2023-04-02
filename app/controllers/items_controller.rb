class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action :item_order, only: :edit


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit    
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to root_path
  end


private

def item_params
  params.require(:item).permit(:image, :itemname, :explanation, :category_id, :degree_id, :region_id, :scheduled_delivery_id,
    :atmosphere_id, :price).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def item_order
  if @item.orders
  redirect_to root_path
  end
end

end
