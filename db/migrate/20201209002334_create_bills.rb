class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :amount
      t.string :category
      t.string :date
      t.integer :user_id

      t.timestamps
    end
  end
end
