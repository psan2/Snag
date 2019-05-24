class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.resources :requester_id
      t.resources :snagger_id
      t.resources :beer_id

      t.timestamps
    end
  end
end
