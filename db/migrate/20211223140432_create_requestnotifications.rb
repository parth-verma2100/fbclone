class CreateRequestnotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :requestnotifications do |t|
      t.integer :user
      t.integer :friend_user

      t.timestamps
    end
  end
end
