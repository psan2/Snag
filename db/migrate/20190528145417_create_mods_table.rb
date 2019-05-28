class CreateModsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :mods do |t|
      t.string :name
    end
  end
end
