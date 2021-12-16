class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true)
  end
  
  def show
    @item = Item.find(params[:id])
    @carts_item = CartsItem.new
  end
end
