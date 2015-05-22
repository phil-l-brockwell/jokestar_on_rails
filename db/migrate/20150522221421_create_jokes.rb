class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.string :text
      t.integer :rating

      t.timestamps null: false
    end
  end
end
