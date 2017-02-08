class UpdateProductIdColumn < ActiveRecord::Migration
  def change
    rename_column :product_production_status, :products_id, :product_id
    rename_column :product_properties, :products_id, :product_id
  end
end
