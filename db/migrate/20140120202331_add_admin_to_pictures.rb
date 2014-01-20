class AddAdminToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :admin_id, :integer

  end
end
