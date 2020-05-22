class AddMovieToActors < ActiveRecord::Migration[5.1]
  def change
    add_reference :actors, :movie, foreign_key: true
  end
end
