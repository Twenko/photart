class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :context
      t.integer :poster_id
      t.boolean :adorus

      t.timestamps
    end
  end
end
