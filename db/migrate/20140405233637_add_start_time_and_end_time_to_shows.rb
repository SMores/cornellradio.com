class AddStartTimeAndEndTimeToShows < ActiveRecord::Migration
  def change
    add_column :shows, :start_time, :time
    add_column :shows, :end_time, :time
    add_column :shows, :start_day, :string
    add_column :shows, :end_day, :string
  end
end
