require 'rails_helper'
RSpec.describe "when a user visits the studio index page" do
  before :each do
    @studio1 = Studio.create!(name: "Big ol Studio", location: "over there")
    @movie1 = @studio1.movies.create!(title: "Turing Chapter 1: What is going on??", creation_year: 1997, genre: "horror")
    @movie2 = @studio1.movies.create!(title: "Turing Chapter 2: I Think I know what is going on??", creation_year: 1998, genre: "horror")
  end
  it "they will see a list of all of the movie studios & the names of all of its movies" do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.movies.first.title)
    expect(page).to have_content(@studio1.movies.last.title)
  end

end

#
# Story 1
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
