class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :quantity
      t.string :unit
      t.float :price
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.string :image

      t.timestamps
    end
  end
end
