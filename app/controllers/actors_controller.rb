class ActorsController < ApplicationController
  def new
    actor = Actor.last
    actor.save!

    redirect_to "/movies/#{actor.movie_id}"
  end

  def show
    @actor = Actor.find(params[:id])
    @actor.save!
    @movie_id = @actor.movie_id
    # require "pry"; binding.pry
  end

  private
  def actor_params
    params.permit(:name, :age, :movie_id)
  end
end
