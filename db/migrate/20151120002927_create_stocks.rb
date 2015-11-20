class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.date :date
      t.float :price

      t.timestamps null: false
    end
  end
end
