class RemoveRatingFromJokes < ActiveRecord::Migration
  def change
    remove_column :jokes, :rating, :integer
  end
end
