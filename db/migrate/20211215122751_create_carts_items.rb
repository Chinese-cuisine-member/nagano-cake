class CreateCartsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :carts_items do |t|
      t.references :customer
      t.references :item
      t.integer :quantity, default: 0, null: false
      t.timestamps
    end
  end
end
