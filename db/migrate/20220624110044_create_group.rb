class CreateGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :nickname
      t.references :chat, foreign_key: {to_table: 'chats'}
      
      t.timestamps
    end
  end
end
