class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    order = Order.find(@order_detail.order_id)
    order_details = OrderDetail.where(order_id: @order_detail.order_id)
    @order_detail.update(order_detail_params)
    if order_detail_params[:making_status] == 'making'
      order.update(status: 2)
    end

    all_complete = false
    order_details.each do |order_detail|
      if order_detail.making_status != 'complete'
        all_complete = false
        break
      elsif order_detail.making_status == 'complete'
        all_complete = true
        next
      end
    end
    if all_complete == true
      order.update(status: 3)
    end
    redirect_to admin_orders_path
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
