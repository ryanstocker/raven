class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.binary :title
      t.binary :title_key
      t.binary :title_iv
      t.binary :body
      t.binary :body_key
      t.binary :body_iv
    end
  end
end
