require 'rails_helper'
RSpec.describe "when I visit a movie's show page" do
  before :each do
    @studio1 = Studio.create!(name: "Big ol Studio", location: "over there")
    @movie1 = @studio1.movies.create!(title: "Turing Chapter 1: What is going on??", creation_year: 1997, genre: "horror")
    @movie2 = @studio1.movies.create!(title: "Turing Chapter 2: I Think I know what is going on??", creation_year: 1998, genre: "horror")
    @actor1 = @movie1.actors.create!(name: "Tom Cruise", age: 99)
    @actor2 = @movie1.actors.create!(name: "Tom Hanks", age: 43)
    @actor3 = @movie1.actors.create!(name: "Penelopy Cruise", age: 20)
    @actor4 = @movie2.actors.create!(name: "Kiera Knightley", age: 35)
  end
  it "see the movie's title, creation year, and genre, its actors from youngest to oldest, average age of actors" do
    visit "/movies/#{@movie1.id}"

    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie1.creation_year)
    expect(page).to have_content(@movie1.genre)

    expect(page).to have_content(@actor3.name)
    expect(page).to have_content(@actor2.name)
    expect(page).to have_content(@actor1.name)
    expect(page).to_not have_content(@actor4.name)

    expect(page).to have_content("Average Age of Actors: 54")
  end
end

# Story 2
# As a visitor,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors