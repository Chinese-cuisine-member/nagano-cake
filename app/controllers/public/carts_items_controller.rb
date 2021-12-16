class Public::CartsItemsController < ApplicationController
  before_action :set_carts_item, only: %i[update destroy]
  
  def index
    @carts_items = current_customer.carts_items.all
  end
  
  def create
    @carts_item = current_customer.carts_items.new(carts_item_params) 
  end
  
  def update
  end
  
  def destroy
    
  end
  
  def destroy_all
    current_customer.carts_items.destroy_all
    redirect_to carts_items_path
  end
  
  private
  
  def carts_item_params
    params.require(:carts_item).permit(:item_id, :quantity)
  end
  
  def set_carts_item
    @carts_item = CartsItem.find(params[:id])
end
