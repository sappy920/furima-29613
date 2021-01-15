class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]

  before_action :set_item, only: [:show, :edit, :update]
  
  def index
    @items = Item.all.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    if current_user.id != @item.user_id 
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:price, :name, :instruction, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
