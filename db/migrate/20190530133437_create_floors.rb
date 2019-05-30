class CreateFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :floors do |t|
      t.integer :floor_number
      t.string :cups

      t.timestamps
    end
  end
end
