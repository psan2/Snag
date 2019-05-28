class AddModuleIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :module_id, :integer
  end
end
