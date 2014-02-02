class AddActivateToAll < ActiveRecord::Migration
  def change
    add_column :articles, :activate, :boolean, :default => true
    add_column :admins, :activate, :boolean, :default => true
    add_column :posts, :activate, :boolean, :default => true
    add_column :maingalls, :activate, :boolean, :default => true
    add_column :galleries, :activate, :boolean, :default => true
    add_column :users, :activate, :boolean, :default => true
    add_column :pictures, :activate, :boolean, :default => true

  end
end
