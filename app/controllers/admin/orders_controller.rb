class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_order, only: %i[show update]

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order_details = @order.order_details
    @total_payment = 0
    @order_details.each do |order_detail|
      @total_payment += order_detail.item.with_tax_price * order_detail.quantity
    end
    @amount_billed = @total_payment + @order.shipping_cost
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
