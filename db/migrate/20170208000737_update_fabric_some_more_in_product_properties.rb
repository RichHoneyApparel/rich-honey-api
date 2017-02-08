class UpdateFabricSomeMoreInProductProperties < ActiveRecord::Migration
  def up
    remove_column :product_properties, :fabrics
  end

  def down
    add_column :product_properties, :fabrics, :text, array: true, default: []
  end
end
