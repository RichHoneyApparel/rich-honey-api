class AddProductTable < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.string :name
      t.integer :qty, default: 0, null: false
      t.decimal :price, default: 0
      t.timestamps
    end

    create_table(:product_properties) do |t|
      t.belongs_to :products, index: true, unique: true, foreign_key: true
      t.text :gender, array: true, default: []
      t.text :categories, array: true, default: []
      t.text :dyes, array: true, default: []
      t.text :washes, array: true, default: []
      t.timestamps
    end

    create_table(:product_production_status) do |t|
      t.belongs_to :products, index: true, unique: true, foreign_key: true
      t.string :name
      t.text :description
      t.text :state, array: true, default: []
      t.timestamps
    end
  end
end
