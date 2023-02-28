# require "json"
# require "open-uri"
# require 'faker'

# 40.times do
#   movie = Movie.new(
#     title: Faker::Movie.title,
#     overview: Faker::Quote.famous_last_words,
#     rating: Faker::Number.between(from: 1, to: 10),
#     poster_url: Faker::LoremFlickr.image
#   )
#   movie.save
#   p "new movie created"
# end
# api_key=3adb77a7d9d67af81bb3f72ac50f08eb
# https://api.themoviedb.org/3/movie/top_rated?api_key=<your_api_key>
# url = "https://api.themoviedb.org/3/movie/550?api_key=3adb77a7d9d67af81bb3f72ac50f08eb"
# # url = "https://api.themoviedb.org/3/movie/top_rated?api_key=3adb77a7d9d67af81bb3f72ac50f08eb"
# 10.times do |i|
# # movies = JSON.parse(URI.open("#{url}?page=#{i+1}").read)["results"]
# movies = JSON.parse(URI.open(url).read)["results"]
# p movies.class


#   movies.each do |result|
#     Movie.create!(
#       poster_url: "https://image.tmdb.org/t/p/original/#{result["backdrop_path"]}",
#       overview: result["overview"],
#       title: result["title"],
#       rating: result["vote_average"]
#       )
#   end
# end

require "open-uri"
require "json"

puts "Cleaning up database..."
# Movie.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"
40.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie["backdrop_path"]}",
      rating: movie["vote_average"]
    )
  end
end
puts "Movies created"
