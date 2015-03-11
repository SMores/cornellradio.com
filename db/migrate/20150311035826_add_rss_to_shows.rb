class AddRssToShows < ActiveRecord::Migration
  def change
    add_column :shows, :rss, :string
  end
end
