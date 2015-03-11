class RemoveOnAirFromShows < ActiveRecord::Migration
  def change
    remove_column :shows, :on_air
  end
end
