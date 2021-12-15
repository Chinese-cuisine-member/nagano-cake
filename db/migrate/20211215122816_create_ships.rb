class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.references :customer
      t.string :zipcode, default: "", null: false
      t.string :address, default: "", null: false
      t.string :name, default: "", null: false
      t.timestamps
    end
  end
end
