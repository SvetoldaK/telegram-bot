class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :telegram_id, :limit => 8
      t.string :first_name

      t.timestamps
    end
  end
end
