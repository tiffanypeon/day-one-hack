class AddOwnInstagramToUser < ActiveRecord::Migration
  def change
    add_column :users, :instagram_user, :string
    add_column :users, :instagram_user_id, :integer
  end
end
