class ActorsController < ApplicationController
  def new

    # require "pry"; binding.pry
    # Movie.find_by(id: params[:movie_id])
    # movie = Movie.find(params[:@movie_id])
    actor = Actor.last
    actor.save!
    # movie.actors.create!(actor_params)
    redirect_to "/movies/#{actor.movie_id}"
  end

  private
  def actor_params
    params.permit(:name, :age, :movie_id)
  end
end
