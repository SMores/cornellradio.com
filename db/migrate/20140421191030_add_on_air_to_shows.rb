class AddOnAirToShows < ActiveRecord::Migration
  def change
    add_column :shows, :on_air, :boolean, default: true
  end
end
