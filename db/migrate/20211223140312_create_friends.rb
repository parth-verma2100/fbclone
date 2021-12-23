class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :current_user
      t.integer :friend_user
      t.date :date

      t.timestamps
    end
  end
end
