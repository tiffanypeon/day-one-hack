class AddTimeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :content_created_at, :timestamp
  end
end
