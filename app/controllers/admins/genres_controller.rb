class Admins::GenresController < ApplicationController
  before_action :authenticate_admin
  
  def index
    @genre = Gerne.new
    @genres = Genre
  
end
