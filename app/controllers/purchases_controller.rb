class PurchasesController < ApplicationController

  def index
     @item= Item.find(params[:item_id])
     @item_order = ItemOrder.new
  end

  def new
    @item_order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
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

  def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :address_number, :apartment, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_a764dc561aba0fde2984ed5b"  
      Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],   
      currency:'jpy'
      )
  end

 
end