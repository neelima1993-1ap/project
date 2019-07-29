class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.references :supplier, index: true
      t.decimal :price
      t.string :category
      t.boolean :active
      t.timestamps null: false
    end
  end
end
