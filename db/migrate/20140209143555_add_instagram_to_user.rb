class AddInstagramToUser < ActiveRecord::Migration
  def change
    add_column :users, :instagram_abuser, :string
    add_column :users, :instagram_abuser_id, :integer
  end
end
