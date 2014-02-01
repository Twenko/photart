class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :content
      t.integer :poster_id
      t.string :title
      t.integer :gallery_id
      t.integer :picture_id

      t.timestamps
    end
  end
end
