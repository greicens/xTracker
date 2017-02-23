class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :receipt
      t.decimal :amount
      t.string :entry_type
      t.date :day
      t.string :payment_type
      t.text :notes
      t.string :vendor
      t.references :category
      t.boolean :recurring
      t.timestamps
    end
  end
end
