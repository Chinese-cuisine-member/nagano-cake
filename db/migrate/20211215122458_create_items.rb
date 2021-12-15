class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :genre
      t.string :name, default: "", null: false
      t.text :explanation, default: "", null: false
      t.string :image_id, default: "", null: false
      t.integer :price, default: 0, null: false
      t.boolean :is_active, default: true, null: false
      t.timestamps
    end
  end
end
