class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.text :description
      t.datetime :published_at
      t.boolean :is_publish

      t.timestamps
    end
  end
end
