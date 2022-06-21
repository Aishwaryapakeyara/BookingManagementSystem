class ChangeCategoriesColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :Name, :name
  end
end
