class CreateBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :borrows do |t|
      t.references :user, foreign_key: true
      t.string :note
      t.datetime :date_borrow
      t.datetime :end_date_borrow
      t.integer :status,default: 0, null:false
      t.timestamps
    end
  end
end
