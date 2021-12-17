class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  def index
    @items = Item.where(is_active: true)
    @genres = Genre.all
  end
  
  def show
    @item = Item.find(params[:id])
    @carts_item = CartsItem.new
    @genres = Genre.all
  end
end
