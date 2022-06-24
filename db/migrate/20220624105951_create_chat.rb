class CreateChat < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :name
      t.integer :chat_id, :limit => 8
      t.references :user, foreign_key: {to_table: 'users'}

      t.timestamps
    end
  end
end
