class AddUserIdToJokes < ActiveRecord::Migration
  def change
    add_reference :jokes, :user, index: true, foreign_key: true
  end
end
