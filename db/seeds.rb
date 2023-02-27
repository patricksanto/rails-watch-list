# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

40.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Quote.famous_last_words,
    rating: Faker::Number.between(from: 1, to: 10),
    poster_url: Faker::LoremFlickr.image
  )
  movie.save
  p "new movie created"
end
