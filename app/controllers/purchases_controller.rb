class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @user_donation = UserDonation.new
  end
 
 
  def create
    @user_donation = UserDonation.new(donation_params)
     if @user_donation.valid?
        pay_item
        @user_donation.save
        redirect_to root_path
     else
        render 'index'
     end
  end
 
  private
  def donation_params
    params.require(:user_donation).permit(:prefecture_id, :municipalities, :address, :building_number, :postal_code, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: donation_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end


end
