class AddManualValidateToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :manual_validate, :boolean, :default => 0
  end
end
