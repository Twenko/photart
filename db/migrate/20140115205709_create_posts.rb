class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :context
      t.integer :poster_id
      t.boolean :adorus
      t.integer :gallery_id
      t.string :picture_ids

      t.timestamps
    end
  end
end
