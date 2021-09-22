class Admins::GenresController < ApplicationController

  before_action :authenticate_admin!


  def new
    @genre = Genre.new
  end

 def index
   @genres = Genre.all
   @genre = Genre.new
 end

 def create
   @genre = Genre.new(genre_params)
   @genre.save
   redirect_back(fall_location: root_path)
 end

 def edit
   @genre = Genre.find(params[:id])
 end

 def update
  genre = Genre.find(params[:id])
  if genre.update(genre_params)
   redirect_to admins_genres_path
  else
    flash[:genre_update_error] ="ジャンル名を入力してください"
    redirect_to edit_admins_genres_path(genre)
  end
 end
 private

  def genre_params
    params.require(:genre).permit(:name, :is_enabled)
  end
end

