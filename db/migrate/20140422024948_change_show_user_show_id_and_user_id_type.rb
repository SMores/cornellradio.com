class ChangeShowUserShowIdAndUserIdType < ActiveRecord::Migration
  def change
    change_column :show_users, :show_id, :integer
    change_column :show_users, :user_id, :integer
  end
end
