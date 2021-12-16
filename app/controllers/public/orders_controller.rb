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
  end
  
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: params[:id])
  end
  
  def confirm
    @order = Order.new(order_params)
  end
  
  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:zipcode, :address, :name, :payment_method, :payment)
  end
  
end
