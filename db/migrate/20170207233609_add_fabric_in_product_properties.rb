class AddFabricInProductProperties < ActiveRecord::Migration
  def change
    add_column :product_properties, :fabric, :text, default: []
  end
end
