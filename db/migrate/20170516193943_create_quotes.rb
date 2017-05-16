class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :product_name
      t.string :product_style_num
      t.string :fabric
      t.string :color
      t.string :dye
      t.integer :qty, default: 150
      t.text :note

      t.timestamps
    end

    create_table :size_breakdowns do |t|
      t.belongs_to :quote, index: true, foreign_key: true
      t.integer :xs
      t.integer :s
      t.integer :m
      t.integer :l
      t.integer :xl
      t.integer :xxl
    end

    create_table :labels do |t|
      t.belongs_to :quote, index: true, foreign_key: true
      t.boolean :sewing, default: false
      t.boolean :creation, default: false
    end

    create_table :hangtags do |t|
      t.belongs_to :quote, index: true, foreign_key: true
      t.boolean :placement, default: false
      t.boolean :creation, default: false
    end
  end
end
