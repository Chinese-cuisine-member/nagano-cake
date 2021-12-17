class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc).first(4)
  end

  def about
  end
  
  def destroy_all
    current_customer.carts_items.destroy_all
    redirect_to carts_items_path
  end
end
