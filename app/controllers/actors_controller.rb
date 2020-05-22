class ActorsController < ApplicationController
  def new
    actor = Actor.last
    actor.save!

    redirect_to "/movies/#{actor.movie_id}"
  end

  private
  def actor_params
    params.permit(:name, :age, :movie_id)
  end
end
