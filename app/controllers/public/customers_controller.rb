class Public::CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update withdraw]
  
  def show
  end
  
  def edit
  end
  
  def update
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end
  
  def unsubscribe
  end
  
  def withdraw
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :address, :phone_number, :is_deleted)
  end
  
  def set_customer
    @customer = current_customer
  end
end
