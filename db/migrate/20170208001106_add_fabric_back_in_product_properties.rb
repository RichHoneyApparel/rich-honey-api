class AddFabricBackInProductProperties < ActiveRecord::Migration
  def change
    add_column :product_properties, :fabrics, :text, array: true, default: []
  end
end
