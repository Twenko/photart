class CreateMaingalls < ActiveRecord::Migration
  def change
    create_table :maingalls do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
