class AddUsdaToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :usda, :integer
  end
end
