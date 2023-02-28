require "json"
require "open-uri"

class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    url = "https://api.themoviedb.org/3/movie/4527?api_key=3adb77a7d9d67af81bb3f72ac50f08eb"
    movies_serialized = URI.open(url).read
    movies = JSON.parse(movies_serialized)
    teste1 = movies[:belongs_to_collection]
    teste = movies.keys
    teste2 = movies[0]["results"]
    raise
    puts "#{user["name"]} - #{user["bio"]}"
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
