class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, :null => false, :default => ""
    add_column :users, :name, :string, :null => false, :default => ""
    add_column :users, :nick_or_name, :boolean, :default => 0
  end
end
