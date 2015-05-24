class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :rating

      t.timestamps null: false
    end
  end
end
