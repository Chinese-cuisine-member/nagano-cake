class Admin::ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update]
  # before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path

    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :genre_id, :price, :is_active)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
