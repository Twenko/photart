class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :gallery_id
      t.string :name
      t.text :description
      t.string :size

      t.timestamps
    end
  end
end
