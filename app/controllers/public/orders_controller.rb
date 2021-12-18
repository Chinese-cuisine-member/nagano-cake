class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!


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
   redirect_to orders_complete_path
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: params[:id])
  end

  def confirm
    @carts_items = current_customer.carts_items

    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method].to_i
    if params[:order][:address_button] == 'my_address'
      @order.zipcode = current_customer.zipcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_button] == 'saved_address'
      @ship = Ship.find(ship_params[:ship_id])
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

  private

  def order_params
    params.require(:order).permit(:zipcode, :address, :name, :payment)
  end

  def ship_params
    params.require(:order).permit(:ship_id)
  end
end