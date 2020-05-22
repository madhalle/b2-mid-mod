require 'rails_helper'
RSpec.describe "when I visit a movie's show page" do
  before :each do
    @studio1 = Studio.create!(name: "Big ol Studio", location: "over there")
    @movie1 = @studio1.movies.create!(title: "Turing Chapter 1: What is going on??", creation_year: 1997, genre: "horror")
    @movie2 = @studio1.movies.create!(title: "Turing Chapter 2: I Think I know what is going on??", creation_year: 1998, genre: "horror")
    @actor1 = @movie1.actors.create!(name: "Tom Cruise", age: 99)
    @actor2 = @movie1.actors.create!(name: "Tom Hanks", age: 43)
    @actor3 = @movie1.actors.create!(name: "Penelopy Cruise", age: 20)
  end

  it "see the movie's title, creation year, and genre, its actors from youngest to oldest, average age of actors" do
    visit "/movies/#{@movie1.id}"

    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie1.creation_year)
    expect(page).to have_content(@movie1.genre)

    expect(page).to have_content(@actor3.name)
    expect(page).to have_content(@actor2.name)
    expect(page).to have_content(@actor1.name)
    expect(page).to have_content("Average Age of Actors: 54")
  end

  it "I see a form for an actors name" do
    actor4 = @movie1.actors.create!(name: "Kiera Knightley", age: 35)
    visit "/movies/#{@movie1.id}"

    fill_in :name, with: "#{actor4.name}"
    click_on "Submit"

    expect(current_path).to eq("/movies/#{@movie1.id}")
    expect(page).to have_content(actor4.name)

    expect(page).to have_content("Average Age of Actors: 49.25")
  end
end
