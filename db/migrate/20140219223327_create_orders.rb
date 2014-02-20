class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :purchaser_id
      t.integer :merchant_id
      t.string :item_description
      t.decimal :item_price
      t.integer :purchase_count

      t.timestamps
    end
  end
end
