class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :firstName
      t.string :lastName
      t.string :profilePic
      t.string :password
      t.string :passwordConfirmation

      t.timestamps
    end
  end
end
