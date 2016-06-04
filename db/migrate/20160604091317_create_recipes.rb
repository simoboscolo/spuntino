class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.text :ingredients
      t.text :procedure

      t.timestamps null: false
    end
  end
end
