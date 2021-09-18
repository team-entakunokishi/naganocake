class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render action:new
    end
  end

  def show
   @item = Item.find(params[:id])
  end

  def edit
   @item = Item.find(params[:id])
   @genresv = Genre.all
  end

  def update
   @item = Item.find(Params[:id])
   @item.update(item_parms)
  end

  private

  def Item_params
    params.require(:item).permit(:aaaaa)
  end
end