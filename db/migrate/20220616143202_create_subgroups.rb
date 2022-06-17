class CreateSubgroups < ActiveRecord::Migration[7.0]
  def change
    create_table :subgroups do |t|
      t.string :nickname
      t.string :name
      t.references :user, foreign_key: {to_table: 'users'}

      t.timestamps
    end
  end
end
