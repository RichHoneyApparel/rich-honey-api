class UpdateProductProductionStatusName < ActiveRecord::Migration
  def change
    rename_table :product_production_status, :product_production_statuses
  end
end
