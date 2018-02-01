class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.integer :rec_id
      t.string :title
      t.string :image
      t.integer :usedIngredientCount
      t.integer :missedIngredientCount
      t.integer :likes

      t.timestamps
    end
  end
end
