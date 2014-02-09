class AddGmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gmail_user, :string
    add_column :users, :gmail_user_token, :string
    add_column :users, :gmail_abuser, :string
  end
end
