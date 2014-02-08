class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :content_source
      t.text :content
      t.string :person
      t.boolean :abuse_flag

      t.timestamps
    end
  end
end
