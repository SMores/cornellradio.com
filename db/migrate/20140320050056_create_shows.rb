class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :profilePic
      t.string :description
      t.string :fbPage
      t.string :twPage
      t.string :extPage

      t.timestamps
    end
    add_index :shows, :title
  end
end
