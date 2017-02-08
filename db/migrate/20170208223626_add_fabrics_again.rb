class AddFabricsAgain < ActiveRecord::Migration
  def change
    add_column :product_properties, :fabrics, :text, array: true
  end
end
