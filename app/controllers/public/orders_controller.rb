class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end
  
  def new
    @order = Order.new
    @ships = Ship.where(customer: current_customer)
  end
  
  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_complete_path
    
   @carts_items = current_customer.carts_items
   @carts_items.each do |carts_item|
     OrderDetail.create(
       item: carts_item.item,
       order: @order,
       quantity: carts_item.quantity
       amount_price: 
       )
   end
  end
  
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: params[:id])
  end
  
  def confirm
    @cart_items = current_customer.carts_items
    @order = Order.new(customer: current_customer,
    payment_method: params[:order][:payment_method]
    )
    @order = Order.new(order_params)
  end
  
  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:zipcode, :address, :name, :payment_method, :payment)
  end
  
end
