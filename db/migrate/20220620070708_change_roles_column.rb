class ChangeRolesColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :roles, :Name, :name
  end
end
