# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
studio1 = Studio.create!(name: "Big ol Studio", location: "over there")
movie1 = @studio1.movies.create!(title: "Turing Chapter 1: What is going on??", creation_year: 1997, genre: "horror")
movie2 = @studio1.movies.create!(title: "Turing Chapter 2: I Think I know what is going on??", creation_year: 1998, genre: "horror")
