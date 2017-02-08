class UpdateProductIdAgain < ActiveRecord::Migration
  def change
    rename_column :product_production_statuses, :products_id, :product_id
    rename_column :product_properties, :products_id, :product_id
  end
end
