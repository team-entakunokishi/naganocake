class Admins::ItemsController < ApplicationController

   before_action :authenticate_admin!


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item.id)
    else
      @genres=Genre.all
      render :new
    end
  end

  def show
   @item = Item.find(params[:id])
  end


  def edit
   @item = Item.find(params[:id])
   @genres = Genre.all
  end

  def update
   @item = Item.find(params[:id])
  if  @item.update(item_params)
      @item.save
   redirect_to admins_item_path(@item.id)
  else
    render edit
  end
end

  private

  def item_params
    params.require(:item).permit(:name,:price,:image,:example,:genre_id,:is_sell_status)
  end
end