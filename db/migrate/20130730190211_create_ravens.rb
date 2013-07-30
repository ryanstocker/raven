class CreateRavens < ActiveRecord::Migration
  def change
    create_table :ravens do |t|
      t.integer :message_id
      t.integer :user_id
    end
  end
end
