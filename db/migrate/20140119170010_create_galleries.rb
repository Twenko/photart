class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.integer :picture_id
      t.integer :maingall_id, :default => 0
      t.text :description

      t.timestamps
    end
  end
end
