class UpdateDefaults < ActiveRecord::Migration
  def change
    drop_table(:products)
    drop_table(:product_production_statuses)
    drop_table(:product_properties)
  end
end
