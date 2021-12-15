class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer
      t.integer :shipping_cost, default: 800, null: false
      t.integer :payment, default: 0, null: false
      t.integer :payment_method, default: 0, null: false
      t.string :zipcode, default: "", null: false
      t.string :address, default: "", null: false
      t.string :name, default: "", null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
