class AddBackTables < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.string :name
      t.integer :qty
      t.decimal :price, default: 0
      t.timestamps
    end

    create_table(:product_properties) do |t|
      t.belongs_to :products, index: true, unique: true, foreign_key: true
      t.text :gender, array: true
      t.text :categories, array: true
      t.text :dyes, array: true
      t.text :washes, array: true
      t.timestamps
    end

    create_table(:product_production_statuses) do |t|
      t.belongs_to :products, index: true, unique: true, foreign_key: true
      t.string :name
      t.text :description
      t.text :state, array: true
      t.timestamps
    end
  end
end
