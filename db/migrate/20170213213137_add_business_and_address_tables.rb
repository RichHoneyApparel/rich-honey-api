class AddBusinessAndAddressTables < ActiveRecord::Migration
  def change
    create_table(:businesses) do |t|
      t.belongs_to :users, index: true, unique: true, foreign_key: true
      t.string :business_email
      t.string :business_name
      t.string :business_url
      t.string :business_phone
      t.string :business_fax
      t.string :business_federal_tax_id
      t.string :business_state_sales_tax_license
      t.string :garment_decorated
      t.string :product_decorated
      t.string :product_resold
      t.text :business_type
      t.string :heard_about_us
      t.timestamps
    end

    create_table(:addresses) do |t|
      t.belongs_to :users, index: true, unique: true, foreign_key: true
      t.text :address_1
      t.text :address_2
      t.string :state
      t.string :city
      t.string :zip
      t.string :country
      t.timestamps
    end

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :approved, :boolean, default: false
    add_column :users, :phone, :string
    add_column :users, :username, :string

    rename_column :addresses, :users_id, :user_id
    rename_column :businesses, :users_id, :user_id
  end
end
