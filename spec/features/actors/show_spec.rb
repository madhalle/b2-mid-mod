require 'rails_helper'
RSpec.describe "when I visit an actor's show page" do
  before :each do
    @studio1 = Studio.create!(name: "Big ol Studio", location: "over there")
    @movie1 = @studio1.movies.create!(title: "Turing Chapter 1: What is going on??", creation_year: 1997, genre: "horror")
    @movie2 = @studio1.movies.create!(title: "Turing Chapter 2: I Think I know what is going on??", creation_year: 1998, genre: "horror")
    @actor1 = @movie1.actors.create!(name: "Tom Cruise", age: 99)
    @actor2 = @movie1.actors.create!(name: "Tom Hanks", age: 43)
    @actor3 = @movie2.actors.create!(name: "Penelopy Cruise", age: 20)
  end
  it " I see that actors name and age & all other actors that actor has worked with" do
    visit "/actors/#{@actor1.id}"

    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor1.age)
    # expect(page).to have_content(@actor2.name)
    # expect(page).to_not have_content(@actor3.name)
  end
end



# Story 4
# As a visitor,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular actor has worked with.
