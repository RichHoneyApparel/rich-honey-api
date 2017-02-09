class AddBackTablesWithNoArrays < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.string :name
      t.integer :qty
      t.decimal :price, default: 0
      t.timestamps
    end

    create_table(:product_properties) do |t|
      t.belongs_to :product, index: true, unique: true, foreign_key: true
      t.string :gender
      t.string :category
      t.string :dye
      t.string :wash
      t.string :fabric
      t.timestamps
    end

    create_table(:product_production_statuses) do |t|
      t.belongs_to :product, index: true, unique: true, foreign_key: true
      t.string :name
      t.string :description
      t.string :state
      t.timestamps
    end
  end
end
