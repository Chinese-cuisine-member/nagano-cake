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
       quantity: carts_item.quantity,
       amount_price: (carts_item.item.price * 1.1).floor
       )
   end
   
   @carts_items.destroy_all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: params[:id])
  end
  
  def confirm
    @carts_items = current_customer.carts_items
    
    @order = Order.new(order_params)
    if params[:address_button] == 'my_address'
      @order.zipcode = current_customer.zipcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:address_button] == 'saved_address'
      @ship = Ship.find(params[:order][:ship_id])
      @order.zipcode = @ship.zipcode
      @order.address = @ship.address
      @order.name = @ship.name
    end
    
    @total_payment = 0
    @carts_items.each do |carts_item|
      @total_payment += carts_item.subtotal
    end
    @amount_billed = @total_payment + @order.shipping_cost
  end
  
  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:zipcode, :address, :name, :payment_method, :payment)
  end
  
end
