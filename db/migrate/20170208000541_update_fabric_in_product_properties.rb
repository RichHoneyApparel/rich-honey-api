class UpdateFabricInProductProperties < ActiveRecord::Migration
  def change
    rename_column :product_properties, :fabric, :fabrics
  end
end
