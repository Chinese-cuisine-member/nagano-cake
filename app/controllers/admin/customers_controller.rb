class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_customer, only: %i[show edit update]

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :address, :phone_number, :is_deleted)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
