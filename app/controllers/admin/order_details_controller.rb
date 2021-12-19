class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    order = Order.find(@order_detail.order_id)
    @order_detail.update(order_detail_params)
    if order_detail_params[:making_status] == 'making'
      order.update(status: 2)
    end
    redirect_to admin_orders_path
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
