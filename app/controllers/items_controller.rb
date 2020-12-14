class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end  
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title,:explanation,:category_id,:status_id,:burden_fee_id,:prefecture_id,:shipping_date_and_time_id, :price, :content, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
