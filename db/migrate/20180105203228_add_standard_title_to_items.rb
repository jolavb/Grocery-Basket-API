class AddStandardTitleToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :StandardTitle, :string
  end
end
