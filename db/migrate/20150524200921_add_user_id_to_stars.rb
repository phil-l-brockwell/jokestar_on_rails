class AddUserIdToStars < ActiveRecord::Migration
  def change
    add_reference :stars, :user, index: true, foreign_key: true
  end
end
