class ChangeCitiesColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :cities, :Name, :name
  end
end
