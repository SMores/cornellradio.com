class RemovePasswordConfirmationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :passwordConfirmation, :string
  end
end
