class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username,       null: false
      t.string :crypted_password
      t.string :salt
      t.string :first_name
      t.string :last_name
      t.integer :mod_id

      t.timestamps                null: false
    end

    add_index :users, :username, unique: true
  end
end
