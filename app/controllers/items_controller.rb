class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    if @item.user_id ==current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path

   else
     render :edit
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

  def destroy
      @item.destroy if @item.user_id ==current_user.id
      redirect_to root_path
  end
end


  private

  def item_params
    params.require(:item).permit(:product_description, :product_name, :product_status_id, :load_id, :selling_price, :ship_id,
                                 :prefecture_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
