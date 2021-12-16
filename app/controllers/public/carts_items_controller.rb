class Public::CartsItemsController < ApplicationController
  before_action :set_carts_item, only: %i[update destroy]
  
  def index
    @carts_items = current_customer.carts_items.all
    
    @total_price = 0
    @carts_items.each do |carts_item|
      @total_price += carts_item.subtotal
    end
  end
  
  def create
    @carts_item = current_customer.carts_items.new(carts_item_params) 
    @update_carts_item = CartsItem.find_by(item: @carts_item.item) 
    if @update_carts_item.present? && @carts_item.valid?
      @carts_item.quantity += @update_carts_item.quantity
      @update_carts_item.destroy
    end
    
    if @carts_item.save
      redirect_to items_path
    else
      @item = Item.find(params[:carts_item][:item_id])
      @carts_item = CartsItem.new
      render ("items/show")
    end
  end
  
  def update
    @carts_item.update(quantity: params[:carts_item][:quantity].to_i)
    redirect_to carts_items_path
  end
  
  def destroy
    @carts_item.destroy
    redirect_to request.referer
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
end
