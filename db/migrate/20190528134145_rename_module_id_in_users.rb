class RenameModuleIdInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :module_id, :mod_id
  end
end
