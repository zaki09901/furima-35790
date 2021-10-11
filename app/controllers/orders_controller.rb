class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index 
  before_action :move_to_root, only: :index


  def index
    @orders_address = OrderAddress.new
    @item = Item.find(params[:item_id])

  end

  def new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @orders_address = OrderAddress.new(orders_params)
     if @orders_address.valid?
      pay_item
      @orders_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def orders_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
      amount: @item.selling_price,  
      card: orders_params[:token],    
      currency: 'jpy'                
    )
  end  

  def move_to_root
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order != nil 
      redirect_to root_path
  end
end


end