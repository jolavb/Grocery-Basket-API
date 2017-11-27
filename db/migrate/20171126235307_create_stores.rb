class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.float :lat
      t.float :lng
      t.string :location
      t.string :name

      t.timestamps
    end
  end
end
