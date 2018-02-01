class AddStoreToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipes, :store, foreign_key: true
  end
end
