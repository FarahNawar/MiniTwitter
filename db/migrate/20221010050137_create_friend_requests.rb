class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :requestor, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users}
      t.boolean :confirmed, default: false 
      t.timestamps
    end
  end
end
