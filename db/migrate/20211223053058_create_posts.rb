class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.text :content
      t.integer :likes

      t.timestamps
    end
  end
end
