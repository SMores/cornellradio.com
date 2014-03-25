class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :userID
      t.integer :showID
      t.string :title
      t.string :blurb
      t.string :content

      t.timestamps
    end
    add_index :posts, [:userID, :created_at]
  end
end
