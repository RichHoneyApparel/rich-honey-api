class AddProductImage < ActiveRecord::Migration
  def change
    create_table(:product_images) do |t|
      t.belongs_to :product, index: true, unique: true, foreign_key: true
      t.string :src
      t.string :alt
      t.boolean :featured
      t.timestamps
    end
  end
end
