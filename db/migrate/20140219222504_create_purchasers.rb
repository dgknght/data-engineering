class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
      t.index [:first_name, :last_name], unique: true
    end
  end
end
