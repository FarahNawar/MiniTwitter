class AddPasswordDigestToUser < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :password_digest, :string
  end

  def down
    remove_column :users, :password_digest, :string
  end
end
