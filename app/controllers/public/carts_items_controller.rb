class Public::CartsItemsController < ApplicationController
  
  def index
    
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  private
  
  def carts_item_params
    params.require(:carts_item).permit(:item_id, :quantity)
  end
end
