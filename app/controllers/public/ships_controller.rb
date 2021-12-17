class Public::ShipsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_ship, only: %i[edit update destroy]
  
  def index
    @ships = current_customer.ships.all
    @ship = Ship.new
  end
  
  def create
    @ship = Ship.new(ship_params)
    @ship.customer_id = current_customer.id
    
    if @ship.save
      redirect_to ships_path
    else
      render :index
    end
  end
  
  def edit
  end
  
  def update
    if @ship.update(ship_params)
      redirect_to ships_path
    else
      render :edit
    end
  end
  
  def destroy
    @ship.destroy
    redirect_to ships_path
  end
  
  private
  
  def ship_params
    params.require(:ship).permit(:zipcode, :address, :name)
  end
  
  def set_ship
    @ship = Ship.find(params[:id])
  end
end
