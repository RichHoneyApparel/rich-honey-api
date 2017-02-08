class ChangeDescription < ActiveRecord::Migration
  def change
    def up
      change_column :product_production_statuses, :description, :text
    end

    def down
      change_column :product_production_statuses, :description, :string
    end
  end
end
