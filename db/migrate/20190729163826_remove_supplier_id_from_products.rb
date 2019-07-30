class RemoveSupplierIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :supplier_id, :integer
  end
end
