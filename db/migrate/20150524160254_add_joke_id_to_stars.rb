class AddJokeIdToStars < ActiveRecord::Migration
  def change
    add_reference :stars, :joke, index: true, foreign_key: true
  end
end
