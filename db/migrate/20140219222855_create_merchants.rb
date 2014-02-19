class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :address

      t.timestamps
      t.index :name, unique: true
    end
  end
end
