class AddInfoToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :nick, :string, :null => false, :default => ""
    add_column :admins, :name, :string, :null => false, :default => ""
    add_column :admins, :nick_or_name, :boolean, :default => 0
  end
end
