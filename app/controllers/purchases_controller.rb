class PurchasesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_item

  before_action :purchase_confirm


  def index
     @item_order = ItemOrder.new
     if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
     end
  end

  def create
    @item_order = ItemOrder.new(purchase_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_confirm
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end

  def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :address_number, :apartment, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],   
      currency:'jpy'
      )
  end

 
end