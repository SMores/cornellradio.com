class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.integer :userID
      t.integer :showID
      t.string :title
      t.string :audio
      t.string :description

      t.timestamps
    end
    add_index :podcasts, [:userID, :showID, :created_at]
  end
end
