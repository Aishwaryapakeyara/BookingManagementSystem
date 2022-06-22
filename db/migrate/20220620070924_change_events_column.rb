class ChangeEventsColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :Name, :name
    rename_column :events, :Start_time, :start_time
    rename_column :events, :End_time, :end_time
  end
end
