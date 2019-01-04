class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :rate_level
      t.timestamps
    end
  end
end
