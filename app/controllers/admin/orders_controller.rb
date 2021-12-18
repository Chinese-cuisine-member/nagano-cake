class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_order, only: %i[show update]

  def index
    @orders = Order.all
  end

  def show
    @order_details = @order.order_details
  end

  def update
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      render 'show'
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
